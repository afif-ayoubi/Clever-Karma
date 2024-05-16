import { HttpException, HttpStatus, Injectable } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model, Types } from "mongoose";
import { User } from "src/schemas/user.schema";
import { UserAuthResponseType } from "./types/user_type/auth_user_response_type";
import { compare } from "bcrypt";
import { sign } from 'jsonwebtoken';
import { HydratedDocument } from 'mongoose';
import { UserResponseType } from "./types/user_type/user_response_type";
import { CreateUserDto } from "./dto/user_dto/create_user.dto";
import { LoginDto } from "./dto/user_dto/login.dto";
import { ModelConflictException, ModelUnprocessableEnitityException } from "src/core/error/exception";
import { ERROR_MESSAGES } from "src/core/constants/error_message";
import {  OrganizationDto } from "./dto/organization_dto/organization.dto";


export type UserDocument = HydratedDocument<User>;


@Injectable()
export class UsersService {
    constructor(@InjectModel(User.name) private userModel: Model<User>,
    ) { }

 
    async createOrganization(organizationDto: OrganizationDto): Promise<UserDocument> {
        const organization = (await this.userModel.findOne({ email: organizationDto.email }));
        if (organization) throw new ModelUnprocessableEnitityException(ERROR_MESSAGES.EMAIL_ALREADY_TAKEN);

        const createdOrganization = new this.userModel(organizationDto);
        return createdOrganization.save();
    }
    async updateOrganization(id: string, organizationDto: any): Promise<UserDocument> {
        const existingUser = await this.userModel.findOne({ email: organizationDto.email });

        console.log(existingUser._id.toString() );
        
        if (existingUser && existingUser._id.toString() !== id) {
            throw new ModelConflictException(ERROR_MESSAGES.EMAIL_ALREADY_EXISTS);;
        }
        const user = this.userModel.findByIdAndUpdate(id, organizationDto, { new: true });
        if (!user) throw new ModelUnprocessableEnitityException(ERROR_MESSAGES.USER_NOT_FOUND);
        return user;
    }
    async loginUser(loginDto: LoginDto): Promise<UserDocument> {
        const user = await this.userModel.findOne({ email: loginDto.email }).select("+password");
        console.log(user.password);
        console.log(loginDto.password); 
        if (!user) throw new ModelUnprocessableEnitityException(ERROR_MESSAGES.USER_NOT_FOUND);
        const isPasswordCorrect = await compare(loginDto.password, user.password);
        console.log(isPasswordCorrect);
        if (!isPasswordCorrect) throw new ModelUnprocessableEnitityException(ERROR_MESSAGES.INCORRECT_PASSWORD);
        return user;
    }
    getUsers(): Promise<User[]> {
        return this.userModel.find();
    }
    async createUser(createUserDto: CreateUserDto): Promise<UserDocument> {
        const user = (await this.userModel.findOne({ email: createUserDto.email }));
        if (user) throw new ModelUnprocessableEnitityException(ERROR_MESSAGES.EMAIL_ALREADY_TAKEN);

        const createdUser = new this.userModel(createUserDto);
        return createdUser.save();
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
            organizationDetail: user.organizationDetail,
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
            userInfo: user.userInfo,
            organizationDetail: user.organizationDetail,

        };
    }

  
    generateJwt(user: UserDocument): string {
        const userId = user._id;
        return sign({ userId: userId }, process.env.JWT_SECRET);
    }
    async findById(id: Types.ObjectId): Promise<UserDocument> {

        return this.userModel.findById(id);
    }
}
