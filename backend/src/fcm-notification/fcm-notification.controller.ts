import { Controller, Post, Body, Get, Query } from '@nestjs/common';
import { FcmNotificationService } from './fcm-notification.service';

@Controller('firebase')
export class FcmNotificationController {
  constructor(private readonly fcmNotificationService: FcmNotificationService) {}

  @Post('send-notification')
  async sendNotification(@Body() body: { title: string, notificationBody: string }) {
    const { title, notificationBody } = body;
    return await this.fcmNotificationService.sendNotificationToAllUsers(title, notificationBody);
  }

  @Get('get-notifications')
  async getNotifications(@Query('token') token: string) {
    return await this.fcmNotificationService.getNotificationsByUserToken(token);
  }
}
