import { Test, TestingModule } from '@nestjs/testing';
import { UsersController } from './users.controller';
import { UsersService } from './users.service';
import { CreateUserDto, NotificationsDto } from './dto/user_dto/create_user.dto';
import { UserAuthResponseType } from './types/user_type/auth_user_response_type';
import { LoginDto } from './dto/user_dto/login.dto';
import { UpdateOrganizationDto } from './dto/organization_dto/update_organization.dto';
import { OrganizationResponseType } from './types/organizaiton_type/organization_response_type';
import { ChangePasswordDto } from './dto/user_dto/change_password.dto';
import { UserResponseType } from './types/user_type/user_response_type';
import { FollowDto } from './dto/follow_dto/follow.dto';

describe('UsersController', () => {
  let controller: UsersController;
  let service: UsersService;

  const mockUserService = {
    createUser: jest.fn(),
    loginUser: jest.fn(),
    createOrganization: jest.fn(),
    updateOrganization: jest.fn(),
    getUsers: jest.fn(),
    buildAuthUserResponse: jest.fn(),
    buildUserResponse: jest.fn(),
    changePassword: jest.fn(),
    followOrganization: jest.fn(),
    unfollowOrganization: jest.fn(),
    findOrganizationsByVolunteeringSection: jest.fn(),
    updateUser: jest.fn(),
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [UsersController],
      providers: [
        {
          provide: UsersService,
          useValue: mockUserService,
        },
      ],
    }).compile();

    controller = module.get<UsersController>(UsersController);
    service = module.get<UsersService>(UsersService);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });

  describe('createUser', () => {
    it('should create a user and return auth response', async () => {
      const createUserDto: CreateUserDto = {
          email: 'test@example.com', password: 'password',
          notifications: new NotificationsDto,
          role: ''
      };
      const result: UserAuthResponseType = { email: 'test@example.com', token: 'token' } as UserAuthResponseType;

      mockUserService.createUser.mockResolvedValue(result);
      mockUserService.buildAuthUserResponse.mockReturnValue(result);

      expect(await controller.createUser(createUserDto)).toEqual(result);
      expect(service.createUser).toHaveBeenCalledWith({ ...createUserDto, role: 'USER' });
      expect(service.buildAuthUserResponse).toHaveBeenCalledWith(result);
    });
  });

  describe('login', () => {
    it('should log in a user and return auth response', async () => {
      const loginDto: LoginDto = { email: 'test@example.com', password: 'password' };
      const result: UserAuthResponseType = { email: 'test@example.com', token: 'token' } as UserAuthResponseType;

      mockUserService.loginUser.mockResolvedValue(result);
      mockUserService.buildAuthUserResponse.mockReturnValue(result);

      expect(await controller.login(loginDto)).toEqual(result);
      expect(service.loginUser).toHaveBeenCalledWith(loginDto);
      expect(service.buildAuthUserResponse).toHaveBeenCalledWith(result);
    });
  });

});
