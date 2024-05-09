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
import { VolunteeringSection, VolunteeringSectionSchema } from "src/schemas/volunteering_opportunity.schema";
import { VolunteeringSectionController } from "./volunteering_section/volunteering_opportunity.controller";
import { VolunteeringSectionService } from "./volunteering_section/volunteering_opportunity.service";

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
                name: VolunteeringSection.name,
                schema: VolunteeringSectionSchema,
            },
        ])
    ],
    providers: [
        UsersService, VolunteeringSectionService],
    controllers: [UsersController, VolunteeringSectionController],
    exports: [UsersService]
})
export class UserModule { }