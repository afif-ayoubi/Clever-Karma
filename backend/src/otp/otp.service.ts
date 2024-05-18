import { MailerService } from "@nestjs-modules/mailer";
import { Injectable } from "@nestjs/common";
import 'dotenv/config';

const OTP='otp';
@Injectable()
export class OtpService {
    private otps = new Map<string, string>();

    constructor(private readonly mailService: MailerService) {}
cs
    async sendMail(email: string): Promise<void> {
        const otp = this.generateOtp();
        const message = `Your OTP code is ${otp}. If you didn't request this, please ignore this email.`;

        try {
            await this.mailService.sendMail({
                from: process.env.USER,
                to: email,
                subject: `Your OTP Code`,
                text: message,
            });

            this.otps.set(OTP, otp); 
            console.log(this.otps) 
        } catch (error) {
            throw new Error(`Failed to send email: ${error.message}`);
        }
    }

    generateOtp(): string {
        return Math.floor(1000 + Math.random() * 9000).toString(); 
    }

}
