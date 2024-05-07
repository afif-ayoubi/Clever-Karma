import { Body, Controller, Get, HttpException, HttpStatus, Param, Patch, Post, Request } from "@nestjs/common";
import { UsersService } from "./users.service";
import { CreateUserDto } from "./dto/create_user.dto";
import mongoose from "mongoose";
import { UserResponseType } from "./types/user_response_type";
import { loginDto } from "./dto/login_dto";
import { ExpressRequest } from "./middlewares/auth.middleware";
import { updateUserDto } from "./dto/update_user.dto";

@Controller('user')
export class UsersController {
    constructor(private userService: UsersService) { }
    @Post('/create')
    async createUser(@Body() createUserDto: CreateUserDto): Promise<UserResponseType> {
        const user = await this.userService.createUser(createUserDto);
        console.log(createUserDto);
        return this.userService.buildUserResponse(user);
    }
    @Post('/login')
    async login(@Body() loginDto: loginDto): Promise<UserResponseType> {
        const user = await this.userService.loginUser(loginDto);
        return this.userService.buildUserResponse(user);
    }
    @Get('/all')
    getUsers() {
        console.log('hello')
        return this.userService.getUsers();
    }
    // @Get(':id')
    // async getUserById(@Param('id') id: string): Promise<UserResponseType> {
    //     const isValid = mongoose.Types.ObjectId.isValid(id);
    //     if (!isValid) throw new HttpException("Invalid id", 404);
    //     const findUser = await this.userService.getUserById(id);
    //     if (!findUser) throw new HttpException("User not found", 404);
    //     return this.userService.buildUserResponse(findUser);
    // }
    @Get()
    async currentUser(@Request() request: ExpressRequest): Promise<UserResponseType> {
        if (!request.user) throw new HttpException("UNAUTHORIZED", HttpStatus.UNAUTHORIZED);
        return this.userService.buildUserResponse(request.user);
    }

    @Patch()
    async updateUser(@Request() request: ExpressRequest, @Body() updateUserDto: updateUserDto): Promise<UserResponseType> {
        if (!request.user) throw new HttpException("UNAUTHORIZED", HttpStatus.UNAUTHORIZED);
        const userId = request.user._id.toString();
        const updatedUser = await this.userService.updateUser(userId, updateUserDto);
        return this.userService.buildUserResponse(updatedUser);


    }
    @Post('/logout')
    async logout(@Request() request: ExpressRequest): Promise<{ message: string }> {
        
        request.user = null;
        return {
            message: "Logout successfully"
        }
    }
       // @Post('/logout')
        // async logout(@Request() req): Promise<{ message: string }> {
        //     req.session.destroy();
        //     return {
        //         message: "Logout successfully"
        //     }
        // }
}