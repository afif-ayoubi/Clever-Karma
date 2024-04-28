import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';
import { Types } from 'mongoose';

@Schema()
export class Follower{
    @Prop({ required: true })
    organizationId: Types.ObjectId;

    @Prop({ required: true })
    organizationName: string;
}
export const FollowerSchema = SchemaFactory.createForClass(Follower);
