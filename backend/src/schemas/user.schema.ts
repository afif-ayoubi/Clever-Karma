import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';
import { USER_ROLES } from 'src/users/user/utils/user_roles_enum';
import { NotificationSchema, Notifications } from './notification.schema';
import { UserInfo } from './user_info.schema';
import { OrganizationDetail, OrganizationDetailSchema } from './organization_detail.schema';
import { Follower, FollowerSchema } from './follower_schema';
import { hash, compare } from 'bcrypt';
import { UserLocation, UserLocationSchema } from './location.schema';
@Schema()
export class User {

    @Prop({ required: true })
    firstName: string;
    @Prop({ required: true })
    lastName: string;
    @Prop({ required: true, unique: true })
    email: string;
    @Prop({ required: true, select: false })
    password: string;
    @Prop({ enum: [USER_ROLES.ADMIN, USER_ROLES.USER, USER_ROLES.ORGANIZATION], default: USER_ROLES.USER })
    role: string;
    @Prop({ type: UserInfo, })
    userInfo?: UserInfo;
    @Prop({ type: OrganizationDetailSchema })
    organizationDetail?: OrganizationDetail;
    @Prop({ type: UserLocationSchema, })
    location?: UserLocation;
    @Prop({ type: [NotificationSchema] })
    notification?: Notifications[];
    @Prop({ type: FollowerSchema, })
    followers?: Follower;


}
export const UserSchema = SchemaFactory.createForClass(User);
UserSchema.pre<User>('save', async function (next: Function) {
    this.password = await hash(this.password, 10);
    next();
});
