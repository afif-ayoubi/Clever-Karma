import { HttpException, HttpStatus, Injectable } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model, Types } from "mongoose";
import { User } from "src/schemas/user.schema";
import { UserAuthResponseType } from "./types/auth_user_response_type";
import { compare } from "bcrypt";
import { sign } from 'jsonwebtoken';
import { HydratedDocument } from 'mongoose';
import { UserResponseType } from "./types/user_response_type";
import { CreateUserDto } from "./dto/create_user.dto";
import { LoginDto } from "./dto/login.dto";
import { ModelConflictException, ModelUnprocessableEnitityException } from "src/core/error/exception";
import { ERROR_MESSAGES } from "src/core/constants/error_message";

export type UserDocument = HydratedDocument<User>;


@Injectable()
export class UsersService {
    constructor(@InjectModel(User.name) private userModel: Model<User>,
    ) { }

    async createUser(createUserDto: CreateUserDto): Promise<UserDocument> {
        const user = (await this.userModel.findOne({ email: createUserDto.email }));
        if (user) throw new ModelUnprocessableEnitityException(ERROR_MESSAGES.EMAIL_ALREADY_TAKEN);

        const createdUser = new this.userModel(createUserDto);
        return createdUser.save();
    }
    async loginUser(loginDto: LoginDto): Promise<UserDocument> {
        const user = await this.userModel.findOne({ email: loginDto.email }).select("+password");
        if (!user) throw new ModelUnprocessableEnitityException(ERROR_MESSAGES.USER_NOT_FOUND);
        const isPasswordCorrect = await compare(loginDto.password, user.password);
        if (!isPasswordCorrect) throw new ModelUnprocessableEnitityException(ERROR_MESSAGES.INCORRECT_PASSWORD);
        return user;
    }
    getUsers(): Promise<User[]> {
        return this.userModel.find();
    }

    async updateUser(id: string, updateUserDto: any): Promise<UserDocument> {
        const existingUser = await this.userModel.findOne({ email: updateUserDto.email });
        if (existingUser && existingUser._id.toString() !== id) {
            throw new ModelConflictException(ERROR_MESSAGES.EMAIL_ALREADY_EXISTS);;
        }
        const user = this.userModel.findByIdAndUpdate(id, updateUserDto, { new: true });
        if (!user) throw new ModelUnprocessableEnitityException(ERROR_MESSAGES.USER_NOT_FOUND);
        return user;
    }


    buildUserResponse(user: UserDocument): UserResponseType {

        return {
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email,
            role: user.role,
            id: user._id,
            userInfo: user.userInfo,
        };
    }
   
    buildAuthUserResponse(user: UserDocument): UserAuthResponseType {
        return {
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email,
            role: user.role,
            token: this.generateJwt(user),
            id: user._id,

        };
    }

    generateJwt(user: UserDocument): string {
        const userId = user._id;
        return sign({ userId: userId }, 'JWT_SECRET');
    }
    async findById(id: Types.ObjectId): Promise<UserDocument> {

        return this.userModel.findById(id);
    }
}
