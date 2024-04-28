import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';


@Schema()
export class Notification {
    @Prop({ required: true })
    title: string;
    @Prop({ required: true })
    description: string;
    @Prop({ required: true })
    date: Date;

}
export const NotificationSchema = SchemaFactory.createForClass(Notification);