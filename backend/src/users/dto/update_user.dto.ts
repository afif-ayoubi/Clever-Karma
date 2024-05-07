import { Type } from "class-transformer";
import { IsDate, IsEmail, IsIn, IsString, ValidateNested } from "class-validator";
import { USER_GENDERS } from "src/utils/user_genders_enum";

export class userInfoDto {
    @IsString()
    readonly phone?: number;

    @IsIn(Object.values(USER_GENDERS), { message: "Invalid Gender" })
    @IsString()
    readonly gender?: String;
    @IsDate()
    readonly dateOfBirth?: Date;
    @IsString()
    readonly image?: String;
}

export class updateUserDto {
    @IsString()
    readonly firstName: string;

    @IsString()
    readonly lastName: string;

    @IsEmail({ require_tld: true }, { message: "Invalid email format" })
    readonly email: string;

    @ValidateNested({ each: true })
    @Type(() => userInfoDto)
    readonly userInfo: userInfoDto;

}
