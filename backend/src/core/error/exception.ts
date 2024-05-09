import { HttpException, HttpStatus } from '@nestjs/common';

export class ModelNotFoundException extends HttpException {
  constructor(message: string) {
    super(message, HttpStatus.NOT_FOUND);
  }
}

export class InvalidVolunteeringSectionException extends HttpException {
  constructor(message: string) {
    super(message, HttpStatus.BAD_REQUEST);
  }
}