import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';

export class UserInfo {
    @Prop()
    phone?: number;
    @Prop()
    gender?: String;
    @Prop()
    dateOfBirth?: Date;
    @Prop()
    image?: String;
}
export const UserInfoSchema = SchemaFactory.createForClass(UserInfo);