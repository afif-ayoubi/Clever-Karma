import { IsNotEmpty, IsString, IsEmail, IsIn } from "class-validator";
import { USER_ROLES } from "src/users/user/utils/user_roles_enum";

export class LoginDto {


    @IsNotEmpty()
    @IsEmail({ require_tld: true }, { message: "Invalid email format" })
    readonly email: string;

    @IsNotEmpty()
    readonly password: string;


}
