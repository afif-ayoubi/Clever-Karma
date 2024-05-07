import { IsEmail, IsNotEmpty, IsString } from "class-validator";
import { userInfoDto } from "./user_info.dto";

export class updateUserDto{
    @IsString()
    readonly firstName: string;

    @IsString()
    readonly lastName: string;

    @IsEmail({ require_tld: true }, { message: "Invalid email format" })
    readonly email: string;

    readonly userInfo:userInfoDto;

}   