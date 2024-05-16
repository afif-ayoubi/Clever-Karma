import { MiddlewareConsumer, Module, RequestMethod } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { UserModule } from './users/users.module';
import { AuthMiddleware } from './users/middlewares/auth.middleware';
import { MailerModule } from '@nestjs-modules/mailer';
import 'dotenv/config';
import { ConfigModule } from '@nestjs/config';
import { OtpController } from './otp/otp.controllers';
import { OtpService } from './otp/otp.service';

@Module({
  imports: [MongooseModule.forRoot(process.env.CONNECTION_STRING),
    UserModule,
  ConfigModule.forRoot(
    {
      cache: true,
      isGlobal: true,
    }),
  MailerModule.forRoot({
    transport: {
      host: process.env.SMTP_HOST, port: 587,
      secure: false,
      auth: {
        user: process.env.USER,
        pass: process.env.PASSWORD
      }
      
    },
    defaults: {
      from: '"No Reply" <afif.alayoubi@gmail.com>',
    },
  
  }),
  
  ],
  controllers: [OtpController,],
  providers: [OtpService,],
})
export class AppModule {
  configure(consumer: MiddlewareConsumer) {
    consumer.apply(AuthMiddleware).exclude(
      { path: 'user/create', method: RequestMethod.POST },
      { path: 'user/login', method: RequestMethod.POST },
      { path: 'user/create-organization', method: RequestMethod.POST },
    )

      .forRoutes({
        path: '*',
        method: RequestMethod.ALL
      })
  }
}