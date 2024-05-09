import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';


@Schema()
export class Notifications {
    @Prop({ required: true })
    fcm_token: string;
    @Prop({ required: true })
    title: string;
    @Prop({ required: true })
    body: string;
    @Prop({ required: true })
    created_by: string;

}
export const NotificationSchema = SchemaFactory.createForClass(Notifications);