import { Controller, Post, Body } from '@nestjs/common';
import { FcmNotificationService } from './fcm-notification.service';

@Controller('firebase')
export class FcmNotificationController {
  constructor(private readonly sendingNotificationService: FcmNotificationService) {}

  @Post('send-notification')
  async sendNotification(@Body() body: { token: string, title: string, notificationBody: string }) {
    const { token, title, notificationBody } = body;
    return await this.sendingNotificationService.sendNotificationToOneUser(token, title, notificationBody);
  }
}
