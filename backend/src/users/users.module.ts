import { Module } from "@nestjs/common";
import { MongooseModule, Schema } from "@nestjs/mongoose";
import { User, UserSchema } from "src/schemas/user.schema";
import { UsersService } from "./users.service";
import { UsersController } from "./users.controller";
import { NotificationSchema } from "src/schemas/notification.schema";

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
            }
        ])
    ],
    providers: [
        UsersService],
    controllers: [UsersController],
    exports: [UsersService]
})
export class UserModule { }