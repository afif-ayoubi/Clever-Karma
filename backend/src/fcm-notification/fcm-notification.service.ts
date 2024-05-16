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
  ) {}

  async sendNotificationToOneUser(token: string, title: string, body: string) {
    const payload = {
      token: token,
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
      await admin.messaging().send(payload);

      const notification = new this.notificationModel({
        fcm_token: token,
        title: title,
        body: body,
        created_by: 'system' 
      });
      const user = await this.userModel.findOne({ 'notifications.fcm_token': token });
      if (user) {
          user.notifications.push(notification);
          await user.save();
      }

      return { success: true };


    } catch (error) {
      return { success: false, error: error.message };
    }
  }
}
