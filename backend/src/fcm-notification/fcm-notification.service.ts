import { Injectable } from '@nestjs/common';
import { CreateFcmNotificationDto } from './dto/create-fcm-notification.dto';
import { UpdateFcmNotificationDto } from './dto/update-fcm-notification.dto';

@Injectable()
export class FcmNotificationService {
  create(createFcmNotificationDto: CreateFcmNotificationDto) {
    return 'This action adds a new fcmNotification';
  }

  findAll() {
    return `This action returns all fcmNotification`;
  }

  findOne(id: number) {
    return `This action returns a #${id} fcmNotification`;
  }

  update(id: number, updateFcmNotificationDto: UpdateFcmNotificationDto) {
    return `This action updates a #${id} fcmNotification`;
  }

  remove(id: number) {
    return `This action removes a #${id} fcmNotification`;
  }
}
