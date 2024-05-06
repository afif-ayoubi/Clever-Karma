import { IsEmail, IsNotEmpty, IsString } from "class-validator";

export class updateUserDto{
    @IsNotEmpty()
    @IsString()
    readonly firstName: string;

    @IsNotEmpty()
    @IsString()
    readonly lastName: string;

    @IsNotEmpty()
    @IsEmail({ require_tld: true }, { message: "Invalid email format" })
    readonly email: string;

}