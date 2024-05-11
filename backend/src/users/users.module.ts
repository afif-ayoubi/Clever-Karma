import { Module } from "@nestjs/common";
import { MongooseModule, Schema } from "@nestjs/mongoose";
import { User, UserSchema } from "src/schemas/user.schema";
import { UsersService } from "./user/users.service";
import { UsersController } from "./user/users.controller";
import { NotificationSchema, Notifications } from "src/schemas/notification.schema";
import { OrganizationDetail, OrganizationDetailSchema } from "src/schemas/organization_detail.schema";

import { VolunteeringSection, VolunteeringSectionSchema } from "src/schemas/volunteering_opportunity.schema";
import { VolunteeringSectionService } from "./volunteering_section/volunteering_section.service";
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
                name: OrganizationDetail.name,
                schema: OrganizationDetailSchema,
            },
          
          
            {
                name: VolunteeringSection.name,
                schema: VolunteeringSectionSchema,
            },
        ])
    ],
    providers: [
        UsersService, VolunteeringSectionService ],
    controllers: [UsersController,VolunteeringSectionController],
    exports: [UsersService]
})
export class UserModule { }