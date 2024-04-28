import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';
import { USER_ROLES } from 'src/utils/user_roles_enum';
import { NotificationSchema, Notification } from './notification.schema';
import { Location, LocationSchema } from './location.schema';
@Schema()
export class User {

    @Prop({ required: true })
    firstName: string;
    @Prop({ required: true })
    lastName: string;
    @Prop({ required: true, unique: true })
    email: string;
    @Prop({ required: true })
    password: string;
    @Prop({ enum: [USER_ROLES.ADMIN, USER_ROLES.USER, USER_ROLES.ORGANIZATION], default: USER_ROLES.USER })
    role: string;
    @Prop()
    image?: String;
    @Prop()
    phone?: number;
    @Prop()
    gender?: String;
    @Prop()
    dateOfBirth?: Date;
    @Prop({ type: LocationSchema, default: {} })
    location?: Location;



    @Prop({ type: [NotificationSchema], default: [] })
    notification: Notification[];

}
export const UserSchema = SchemaFactory.createForClass(User);