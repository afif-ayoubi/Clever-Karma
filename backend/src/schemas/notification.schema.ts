import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';


@Schema()
export class Notifications {
    @Prop({ required: true })
    fcm_token: string;
    title: string;
    body: string;
    created_by: string;

}
export const NotificationSchema = SchemaFactory.createForClass(Notifications);