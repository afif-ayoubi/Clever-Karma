import { IsNotEmpty, IsString, IsEmail, IsIn } from "class-validator";
import { USER_ROLES } from "src/utils/user_roles_enum";

export class CreateUserDto {
    @IsNotEmpty()
    @IsString()
    readonly firstName: string;

    @IsNotEmpty()
    @IsString()
    readonly lastName: string;

    @IsNotEmpty()
    @IsEmail({ require_tld: true }, { message: "Invalid email format" })
    readonly email: string;

    @IsNotEmpty()
    readonly password: string;

    @IsNotEmpty()
    @IsString()
    @IsIn(Object.values(USER_ROLES), { message: "Invalid role" })
    readonly role: string;
}
