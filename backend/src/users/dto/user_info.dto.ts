import { IsDate, IsNotEmpty, IsString } from "class-validator";

export class userInfoDto {
    @IsString()
    readonly phone?: number;
    @IsString()
    readonly gender?: String;
    @IsDate()
    readonly dateOfBirth?: Date;
    @IsString()
    readonly image?: String;
}