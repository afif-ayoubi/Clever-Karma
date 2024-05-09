import { Module } from "@nestjs/common";
import { MongooseModule, Schema } from "@nestjs/mongoose";
import { User, UserSchema } from "src/schemas/user.schema";
import { UsersService } from "./user/users.service";
import { UsersController } from "./user/users.controller";
import { NotificationSchema, Notifications } from "src/schemas/notification.schema";
import { UserInfo, UserInfoSchema } from "src/schemas/user_info.schema";
import { OrganizationDetail, OrganizationDetailSchema } from "src/schemas/organization_detail.schema";
import { UserLocation, UserLocationSchema } from "src/schemas/location.schema";
import { Follower, FollowerSchema } from "src/schemas/follower_schema";
import { VolunteeringSection, VolunteeringSectionSchema } from "src/schemas/volunteering_opportunity.schema";
import { VolunteeringSectionService } from "./volunteering_section/volunteering_section.service";
import { OrganizationController } from "./organization/organization.controller";
import { OrganizationService } from "./organization/organization.service";
import { VolunteeringSectionController } from "./volunteering_section/volunteering_section.controller";

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
        UsersService, VolunteeringSectionService, OrganizationService],
    controllers: [UsersController,VolunteeringSectionController, OrganizationController],
    exports: [UsersService]
})
export class UserModule { }