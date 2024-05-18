import { Injectable } from '@nestjs/common';
import * as admin from 'firebase-admin';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import 'dotenv/config';
import { User } from 'src/schemas/user.schema';
import { Notifications } from 'src/schemas/notification.schema';

admin.initializeApp({
  credential: admin.credential.cert({
    projectId: process.env.FIREBASE_PROJECT_ID,
    clientEmail: process.env.FIREBASE_CLIENT_EMAIL,
    privateKey: process.env.FIREBASE_PRIVATE_KEY.replace(/\\n/g, '\n'),

  }),
});

@Injectable()
export class FcmNotificationService {
  constructor(
    @InjectModel(Notifications.name) private notificationModel: Model<Notifications>,
    @InjectModel(User.name) private userModel: Model<User>
  ) { }

  async sendNotificationToAllUsers(title: string, body: string) {
    const payload = {
      notification: {
        title: title,
        body: body,
      },
      data: {
        name: "Joe",
        age: "21"
      }
    };

    try {
      const users = await this.userModel.find().select('notifications.fcm_token');
      const tokens = users.flatMap(user => user.notifications.map(notification => notification.fcm_token));

      const uniqueTokens = [...new Set(tokens)];
      console.log(uniqueTokens);

      const response = await admin.messaging().sendToDevice(uniqueTokens, payload);

      const notifications = uniqueTokens.map(token => ({
        fcm_token: token,
        title: title,
        body: body,
        created_by: 'system'
      }));

      await this.notificationModel.insertMany(notifications);

      return { success: true, response };
    } catch (error) {
      return { success: false, error: error.message };
    }
  }

  async getNotificationsByUserToken(token: string) {
    try {
      const user = await this.userModel.findOne({ 'notifications.fcm_token': token }).populate('notifications');
      if (user) {
        return { success: true, notifications: user.notifications };
      } else {
        return { success: false, message: 'User not found' };
      }
    } catch (error) {
      return { success: false, error: error.message };
    }
  }

}
