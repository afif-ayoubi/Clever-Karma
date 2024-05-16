import { Controller, Get, Res } from "@nestjs/common";
import { OtpService } from "./otp.service";
import { Response } from "express";  // Import the correct type from express

@Controller('mail')
export class OtpController {
    constructor(private readonly otpService: OtpService) {}

    @Get()
    async sendMail(@Res() response: Response) {
        try {
            const mail = await this.otpService.sendMail();  
            return response.status(200).json({
                message: 'success',
                mail,
            });
        } catch (error) {
            return response.status(500).json({
                message: 'Failed to send email',
                error: error.message,
            });
        }
    }
}
