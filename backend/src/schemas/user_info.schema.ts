import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';

export class UserInfo {
    @Prop()
    phone?: number;
    @Prop()
    gender?: String;
    @Prop()
    dateOfBirth?: Date;
}
export const UserInfoSchema = SchemaFactory.createForClass(UserInfo);