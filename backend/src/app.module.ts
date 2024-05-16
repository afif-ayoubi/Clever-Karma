import { MiddlewareConsumer, Module, RequestMethod } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { UserModule } from './users/users.module';
import { AuthMiddleware } from './users/middlewares/auth.middleware';
import { MailerModule } from '@nestjs-modules/mailer';
import { ConfigModule } from '@nestjs/config';
@Module({
  imports: [MongooseModule.forRoot(process.env.CONNECTION_STRING),
    UserModule,
    ConfigModule.forRoot(
      {
        cache:true,
        isGlobal:true,
        
      }
    ),
    MailerModule.forRoot({
      transport:{
        host:'smtp.gmail.com',
        auth:{
          user:process.env.EMAIL,
          pass:process.env.PASSWORD
        }
      }
    })
  ],
  controllers: [],
  providers: [],
})
export class AppModule {
  configure(consumer: MiddlewareConsumer) {
    consumer.apply(AuthMiddleware).exclude(
      {path:'user/create',method:RequestMethod.POST},
      {path:'user/login',method:RequestMethod.POST},
      {path:'user/create-organization',method:RequestMethod.POST},
    )
    
    .forRoutes({
      path: '*',
      method: RequestMethod.ALL
    })
  }
}