import { MiddlewareConsumer, Module, RequestMethod } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { UserModule } from './users/users.module';
import { AuthMiddleware } from './users/middlewares/auth.middleware';
import { UsersService } from './users/user/users.service';

@Module({
  imports: [MongooseModule.forRoot('mongodb://localhost/backend'),
    UserModule
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