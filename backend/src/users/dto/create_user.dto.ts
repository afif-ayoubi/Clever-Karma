import { IsNotEmpty, IsString, IsEmail, IsIn } from "class-validator";
import { USER_ROLES } from "src/utils/user_roles_enum";

export class CreateUserDto {
    @IsNotEmpty()
    @IsString()
    firstName: string;

    @IsNotEmpty()
    @IsString()
    lastName: string;

    @IsNotEmpty()
    @IsEmail({ require_tld: true }, { message: "Invalid email format" })
    email: string;

    @IsNotEmpty()
    password: string;

    @IsNotEmpty()
    @IsString()
    @IsIn(Object.values(USER_ROLES), { message: "Invalid role" })
    role: string;
}
