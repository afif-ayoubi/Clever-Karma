import { Test, TestingModule } from '@nestjs/testing';
import { UsersService } from './users.service';
import { getModelToken } from '@nestjs/mongoose';
import { CreateUserDto, NotificationsDto } from './dto/user_dto/create_user.dto';
import { LoginDto } from './dto/user_dto/login.dto';
import { Model } from 'mongoose';
import { compare } from 'bcrypt';
import { sign } from 'jsonwebtoken';
import { User } from 'src/schemas/user.schema';
import { VolunteeringSection } from 'src/schemas/volunteering_opportunity.schema';
import { ERROR_MESSAGES } from 'src/core/constants/error_message';

jest.mock('bcrypt');
jest.mock('jsonwebtoken');

describe('UsersService', () => {
  let service: UsersService;
  let userModel: Model<User>;
  let volunteeringSectionModel: Model<VolunteeringSection>;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        UsersService,
        {
          provide: getModelToken(User.name),
          useValue: {
            findOne: jest.fn(),
            findById: jest.fn(),
            find: jest.fn(),
            findByIdAndUpdate: jest.fn(),
            create: jest.fn(),
            save: jest.fn(),
          },
        },
        {
          provide: getModelToken(VolunteeringSection.name),
          useValue: {
            findById: jest.fn(),
            find: jest.fn(),
          },
        },
      ],
    }).compile();

    service = module.get<UsersService>(UsersService);
    userModel = module.get<Model<User>>(getModelToken(User.name));
    volunteeringSectionModel = module.get<Model<VolunteeringSection>>(getModelToken(VolunteeringSection.name));
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  describe('createUser', () => {
    it('should create a user', async () => {
      const createUserDto: CreateUserDto = {
          email: 'test@example.com', password: 'password',
          notifications: new NotificationsDto,
          role: ''
      };
      const savedUser = { ...createUserDto, _id: 'userId' };

      userModel.findOne = jest.fn().mockResolvedValue(null);
      userModel.create = jest.fn().mockResolvedValue(savedUser);

      const result = await service.createUser(createUserDto);
      expect(result).toEqual(savedUser);
      expect(userModel.findOne).toHaveBeenCalledWith({ email: createUserDto.email });
      expect(userModel.create).toHaveBeenCalledWith(createUserDto);
    });

    it('should throw an error if email is already taken', async () => {
      const createUserDto: CreateUserDto = {
          email: 'test@example.com', password: 'password',
          notifications: new NotificationsDto,
          role: ''
      };

      userModel.findOne = jest.fn().mockResolvedValue({});

      await expect(service.createUser(createUserDto)).rejects.toThrow(ERROR_MESSAGES.EMAIL_ALREADY_TAKEN);
      expect(userModel.findOne).toHaveBeenCalledWith({ email: createUserDto.email });
    });
  });

  describe('loginUser', () => {
    it('should log in a user', async () => {
      const loginDto: LoginDto = { email: 'test@example.com', password: 'password' };
      const foundUser = { email: 'test@example.com', password: 'hashedPassword' };

      userModel.findOne = jest.fn().mockResolvedValue(foundUser);
      (compare as jest.Mock).mockResolvedValue(true);

      const result = await service.loginUser(loginDto);
      expect(result).toEqual(foundUser);
      expect(userModel.findOne).toHaveBeenCalledWith({ email: loginDto.email });
      expect(compare).toHaveBeenCalledWith(loginDto.password, foundUser.password);
    });

    it('should throw an error if user is not found', async () => {
      const loginDto: LoginDto = { email: 'test@example.com', password: 'password' };

      userModel.findOne = jest.fn().mockResolvedValue(null);

      await expect(service.loginUser(loginDto)).rejects.toThrow(ERROR_MESSAGES.USER_NOT_FOUND);
      expect(userModel.findOne).toHaveBeenCalledWith({ email: loginDto.email });
    });

    it('should throw an error if password is incorrect', async () => {
      const loginDto: LoginDto = { email: 'test@example.com', password: 'password' };
      const foundUser = { email: 'test@example.com', password: 'hashedPassword' };

      userModel.findOne = jest.fn().mockResolvedValue(foundUser);
      (compare as jest.Mock).mockResolvedValue(false);

      await expect(service.loginUser(loginDto)).rejects.toThrow(ERROR_MESSAGES.INCORRECT_PASSWORD);
      expect(userModel.findOne).toHaveBeenCalledWith({ email: loginDto.email });
      expect(compare).toHaveBeenCalledWith(loginDto.password, foundUser.password);
    });
  });

});
