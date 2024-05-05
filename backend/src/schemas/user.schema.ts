import { Schema, Prop, SchemaFactory } from '@nestjs/mongoose';
import { USER_ROLES } from 'src/utils/user_roles_enum';
import { NotificationSchema, Notification } from './notification.schema';
import { Location, LocationSchema } from './location.schema';
import { UserInfo } from './user_info.schema';
import { OrganizationDetail, OrganizationDetailSchema } from './organization_datail.schema';
import { Follower, FollowerSchema } from './follower_schema';
import { hash } from 'bcrypt';
@Schema()
export class User {

    @Prop({ required: true })
    firstName: string;
    @Prop({ required: true })
    lastName: string;
    @Prop({ required: true, unique: true })
    email: string;
    @Prop({ required: true ,select:false})
    password: string;
    @Prop({ enum: [USER_ROLES.ADMIN, USER_ROLES.USER, USER_ROLES.ORGANIZATION], default: USER_ROLES.USER })
    role: string;
    @Prop({ type: UserInfo, })
    userInfo?: UserInfo;
    @Prop({ type: OrganizationDetailSchema })
    organizationDetail?: OrganizationDetail;
    @Prop({ type: LocationSchema, })
    location?: Location;
    @Prop({ type: [NotificationSchema] })
    notification?: Notification[];
    @Prop({ type: FollowerSchema, })
    followers?: Follower;


}
export const UserSchema = SchemaFactory.createForClass(User);
UserSchema.pre<User>('save',async function (next:Function) {
this.password= await hash(this.password,10);
next();
});