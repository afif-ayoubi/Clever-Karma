import { Controller, Post, Body, Get, Query } from '@nestjs/common';
import { FcmNotificationService } from './fcm-notification.service';

@Controller('firebase')
export class FcmNotificationController {
  constructor(private readonly sendingNotificationService: FcmNotificationService) {}

  @Post('send-notification')
  async sendNotification(@Body() body: { token: string, title: string, notificationBody: string }) {
    const { token, title, notificationBody } = body;
    return await this.sendingNotificationService.sendNotificationToOneUser(token, title, notificationBody);
  }
  @Get('get-notifications')
  async getNotifications(@Query('token') token: string) {
    return await this.sendingNotificationService.getNotificationsByUserToken(token);
  }
}

