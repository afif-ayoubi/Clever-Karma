import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { FcmNotificationService } from './fcm-notification.service';
import { CreateFcmNotificationDto } from './dto/create-fcm-notification.dto';
import { UpdateFcmNotificationDto } from './dto/update-fcm-notification.dto';
@Controller('firebase')
export class FcmNotificationController {
  constructor(
    private readonly sendingNotificationService: FcmNotificationService,
  ) { }

  @Post('send-notification')
  async sendNotidication(@Body() body: { token: string }) {
    const { token } = body
    return await this.sendingNotificationService.sendingNotificationOneUser(token)
  }
}