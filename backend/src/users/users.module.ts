import { Module } from "@nestjs/common";
import { MongooseModule, Schema } from "@nestjs/mongoose";
import { User, UserSchema } from "src/schemas/user.schema";
import { UsersService } from "./users.service";
import { UsersController } from "./users.controller";
import { NotificationSchema } from "src/schemas/notification.schema";
import { UserInfo, UserInfoSchema } from "src/schemas/user_info.schema";

@Module({
    imports: [
        MongooseModule.forFeature([
            {
                name: User.name,
                schema: UserSchema,
            },
            {
                name: Notification.name,
                schema: NotificationSchema,
            },
            {
                name: UserInfo.name,
                schema: UserInfoSchema,
            },
            {
                name: Orga,
                schema: UserInfoSchema,
            },
        ])
    ],
    providers: [
        UsersService],
    controllers: [UsersController],
    exports: [UsersService]
})
export class UserModule { }