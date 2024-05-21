import { ForbiddenException, Injectable, NestMiddleware, UnauthorizedException } from "@nestjs/common";
import { ExpressRequest } from "./auth.middleware";
import { NextFunction } from "express";
import { USER_ROLES } from 'src/users/user/utils/user_roles_enum';

import { UsersService } from "../user/users.service";

@Injectable()
export class RolesMiddleware implements NestMiddleware {
  constructor(private readonly userService: UsersService) {}

  use(requiredRole: USER_ROLES) {
    return async (req: ExpressRequest, res: Response, next: NextFunction) => {
      if (!req.user) {
        throw new UnauthorizedException('User not authenticated');
      }

      if (req.user.role !== requiredRole) {
        throw new ForbiddenException('User does not have the necessary permissions');
      }

      next();
    };
  }
}