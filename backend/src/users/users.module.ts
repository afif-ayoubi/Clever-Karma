import { Module } from "@nestjs/common";
import { MongooseModule, Schema } from "@nestjs/mongoose";
import { User, UserSchema } from "src/schemas/user.schema";
import { UsersService } from "./user/users.service";
import { UsersController } from "./user/users.controller";
import { NotificationSchema, Notifications } from "src/schemas/notification.schema";
import { UserInfo, UserInfoSchema } from "src/schemas/user_info.schema";
import { OrganizationDetail, OrganizationDetailSchema } from "src/schemas/organization_datail.schema";
import { UserLocation, UserLocationSchema } from "src/schemas/location.schema";
import { Follower, FollowerSchema } from "src/schemas/follower_schema";
import { VolunteeringOpportunity, VolunteeringOpportunitySchema } from "src/schemas/volunteering_opportunity.schema";

@Module({
    imports: [
        MongooseModule.forFeature([
            {
                name: User.name,
                schema: UserSchema,
            },
            {
                name: Notifications.name,
                schema: NotificationSchema,
            },
            {
                name: UserInfo.name,
                schema: UserInfoSchema,
            },
            {
                name: OrganizationDetail.name,
                schema: OrganizationDetailSchema,
            },
            {
                name: UserLocation.name,
                schema: UserLocationSchema,
            },
            {
                name: Follower.name,
                schema: FollowerSchema,
            },
            {
                name: VolunteeringOpportunity.name,
                schema: VolunteeringOpportunitySchema,
            },
        ])
    ],
    providers: [
        UsersService],
    controllers: [UsersController],
    exports: [UsersService]
})
export class UserModule { }