import { Body, Controller, Get, HttpException, Param, Post } from "@nestjs/common";
import { UsersService } from "./users.service";
import { CreateUserDto } from "./dto/create_user.dto";
import mongoose from "mongoose";

@Controller('users')
export class UsersController {
    constructor(private userService: UsersService) { }
    @Post()
    createUser(@Body() createUserDto: CreateUserDto) {
        console.log(createUserDto);
        return this.userService.createUser(createUserDto);
    }
    @Get()
    getUsers() {
        return this.userService.getUsers();
    }
    @Get(':id')
    async getUserById(@Param('id') id: string) {
        const isValid =mongoose.Types.ObjectId.isValid(id);
        if (!isValid) throw new HttpException("Invalid id", 404);
        const findUser = await this.userService.getUserById(id);
        if (!findUser) throw new HttpException("User not found", 404);
    }

}