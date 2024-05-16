import { MailerService } from "@nestjs-modules/mailer";
import { Injectable } from "@nestjs/common";

@Injectable()
export class OtpService {
    constructor(private readonly mailService: MailerService) {}

    async sendMail() {
        const message = `Forgot your password? If you didn't forget your password, please ignore this email!`;

        try {
            const result = await this.mailService.sendMail({
                from: 'afif.alayoubi@gmail.com',
                to: 'afifayoubi22@gmail.com',
                subject: `How to Send Emails with Nodemailer`,
                text: message,
            });
            return result;
        } catch (error) {
            throw new Error(`Failed to send email: ${error.message}`);
        }
    }
}
