import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { FcmNotificationService } from './fcm-notification.service';
import { CreateFcmNotificationDto } from './dto/create-fcm-notification.dto';
import { UpdateFcmNotificationDto } from './dto/update-fcm-notification.dto';

@Controller('fcm-notification')
export class FcmNotificationController {
  constructor(private readonly fcmNotificationService: FcmNotificationService) {}

  @Post()
  create(@Body() createFcmNotificationDto: CreateFcmNotificationDto) {
    return this.fcmNotificationService.create(createFcmNotificationDto);
  }

  @Get()
  findAll() {
    return this.fcmNotificationService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.fcmNotificationService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateFcmNotificationDto: UpdateFcmNotificationDto) {
    return this.fcmNotificationService.update(+id, updateFcmNotificationDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.fcmNotificationService.remove(+id);
  }
}
