import { Injectable, NestMiddleware } from "@nestjs/common";
import { Request, Response, NextFunction } from "express";
import { verify } from "jsonwebtoken";
import { UserDocument, UsersService } from "../users.service";

export interface ExpressRequest extends Request {
    user?: UserDocument
}

@Injectable()
export class AuthMiddleware implements NestMiddleware {
    constructor(private readonly userService: UsersService) { }
    async use(req: ExpressRequest, res: Response, next: NextFunction) {
        if (!req.headers['authorization']) {
            req.user = null
            next()
            return
        }
        const token = req.headers['authorization'].split(' ')[1];
        try {
            const decoded = verify(token, 'JWT_SECRET') as { id: string };
            const user = await this.userService.findById(decoded.id);
            req.user = user;
            next();
        } catch (e) {
            req.user = null
            next()
        }
    }
}