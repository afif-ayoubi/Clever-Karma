import { Module } from "@nestjs/common";
import { MongooseModule, Schema } from "@nestjs/mongoose";
import { User, UserSchema } from "src/schemas/user.schema";
import { UsersService } from "./users.service";

@Module({
    imports: [
        MongooseModule.forFeature([
            {
                name: User.name,
                schema: UserSchema,
            }
        ])
    ],
    providers:[
        UsersService
    ]
})
export class UserModule { }