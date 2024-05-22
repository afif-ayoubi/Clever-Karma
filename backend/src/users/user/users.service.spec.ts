import { Test, TestingModule } from '@nestjs/testing';
import { getModelToken } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { UsersService } from './users.service';
import { User } from '../../schemas/user.schema';
import { VolunteeringSection } from '../../schemas/volunteering_opportunity.schema';
import { ModelUnprocessableEnitityException, ModelConflictException, ModelNotFoundException } from '../../core/error/exception';
import { ERROR_MESSAGES } from '../../core/constants/error_message';
import { OrganizationDto } from './dto/organization_dto/organization.dto';
import { CreateUserDto, NotificationsDto } from './dto/user_dto/create_user.dto';
import { LoginDto } from './dto/user_dto/login.dto';
import { ChangePasswordDto } from './dto/user_dto/change_password.dto';
import { FollowDto } from './dto/follow_dto/follow.dto';
import { USER_ROLES } from './utils/user_roles_enum';
import { compare } from 'bcrypt';

describe('UsersService', () => {
  let service: UsersService;
  let userModel: Model<User>;
  let volunteeringSectionModel: Model<VolunteeringSection>;

  const mockUser = {
    _id: '61c0ccf11d7bf83d153d7c06',
    email: 'org@example.com',
    firstName: 'Blood org',
    lastName: 'organization3',
    role: 'organization',
    isActive: true,
    organizationDetail: {
      aboutUs: 'About our organization',
      howToVolunteer: 'How you can volunteer',
      imageUrl: 'http://example.com/image.png',
      location: {
        longitude: 37.092,
        latitude: 38.899,
      },
      volunteeringSectionId: '664943ac69b541102c576877',
    },
  };

  const mockVolunteeringSection = {
    _id: '664943ac69b541102c576877',
    name: 'Volunteering Section',
  };

  const mockUserModel = {
    findOne: jest.fn(),
    findById: jest.fn(),
    save: jest.fn(),
    create: jest.fn(),
    findByIdAndUpdate: jest.fn(),
    find: jest.fn(),
  };

  const mockVolunteeringSectionModel = {
    findById: jest.fn(),
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        UsersService,
        {
          provide: getModelToken(User.name),
          useValue: mockUserModel,
        },
        {
          provide: getModelToken(VolunteeringSection.name),
          useValue: mockVolunteeringSectionModel,
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

  describe('createOrganization', () => {
    const organizationDto: OrganizationDto = {
      firstName: 'Blood org',
      lastName: 'organization3',
      email: 'd21w@gmail.com',
      password: 'Password',
      role: 'organization',
      isActive: true,
      organizationDetail: {
        aboutUs: 'About our organization',
        howToVolunteer: 'How you can volunteer',
        imageUrl: 'http://example.com/image.png',
        location: {
          longitude: 37.092,
          latitude: 38.899,
        },
        volunteeringSectionId: '664943ac69b541102c576877',
      },
      liveStreaming: {
        liveStremingId: '1234567',
        isActivated: false,
      },
    };

    it('should create a new organization', async () => {
      mockUserModel.findOne.mockResolvedValue(null);
      mockVolunteeringSectionModel.findById.mockResolvedValue(mockVolunteeringSection);
      mockUserModel.create.mockResolvedValue(mockUser);

      const result = await service.createOrganization(organizationDto);

      expect(mockUserModel.findOne).toHaveBeenCalledWith({ email: organizationDto.email });
      expect(mockVolunteeringSectionModel.findById).toHaveBeenCalledWith(organizationDto.organizationDetail.volunteeringSectionId);
      expect(mockUserModel.create).toHaveBeenCalled();
      expect(result).toEqual(mockUser);
    });

    it('should throw an error if the email is already taken', async () => {
      mockUserModel.findOne.mockResolvedValue(mockUser);

      await expect(service.createOrganization(organizationDto)).rejects.toThrow(ModelUnprocessableEnitityException);
      expect(mockUserModel.findOne).toHaveBeenCalledWith({ email: organizationDto.email });
    });

    it('should throw an error if the volunteering section is not found', async () => {
      mockUserModel.findOne.mockResolvedValue(null);
      mockVolunteeringSectionModel.findById.mockResolvedValue(null);

      await expect(service.createOrganization(organizationDto)).rejects.toThrow('Volunteering Section not found');
      expect(mockVolunteeringSectionModel.findById).toHaveBeenCalledWith(organizationDto.organizationDetail.volunteeringSectionId);
    });
  });

  describe('findOrganizationsByVolunteeringSection', () => {
    it('should return organizations by volunteering section', async () => {
      mockVolunteeringSectionModel.findById.mockResolvedValue(mockVolunteeringSection);
      mockUserModel.find.mockResolvedValue([mockUser]);

      const result = await service.findOrganizationsByVolunteeringSection(mockVolunteeringSection._id);

      expect(mockVolunteeringSectionModel.findById).toHaveBeenCalledWith(mockVolunteeringSection._id);
      expect(mockUserModel.find).toHaveBeenCalledWith({ 'organizationDetail.VolunteeringSection': mockVolunteeringSection._id });
      expect(result).toEqual([mockUser]);
    });

    it('should throw an error if the volunteering section is not found', async () => {
      mockVolunteeringSectionModel.findById.mockResolvedValue(null);

      await expect(service.findOrganizationsByVolunteeringSection(mockVolunteeringSection._id)).rejects.toThrow('Volunteering Section not found');
      expect(mockVolunteeringSectionModel.findById).toHaveBeenCalledWith(mockVolunteeringSection._id);
    });
  });

  describe('updateOrganization', () => {
    const updateDto = { ...mockUser, firstName: 'Updated Name' };

    it('should update an organization', async () => {
      mockUserModel.findOne.mockResolvedValue(null);
      mockUserModel.findByIdAndUpdate.mockResolvedValue(updateDto);

      const result = await service.updateOrganization(mockUser._id, updateDto);

      expect(mockUserModel.findOne).toHaveBeenCalledWith({ email: updateDto.email });
      expect(mockUserModel.findByIdAndUpdate).toHaveBeenCalledWith(mockUser._id, updateDto, { new: true });
      expect(result).toEqual(updateDto);
    });

    it('should throw an error if email already exists', async () => {
      mockUserModel.findOne.mockResolvedValue(mockUser);

      await expect(service.updateOrganization(mockUser._id, updateDto)).rejects.toThrow(ModelConflictException);
      expect(mockUserModel.findOne).toHaveBeenCalledWith({ email: updateDto.email });
    });

    it('should throw an error if user not found', async () => {
      mockUserModel.findByIdAndUpdate.mockResolvedValue(null);

      await expect(service.updateOrganization(mockUser._id, updateDto)).rejects.toThrow(ModelUnprocessableEnitityException);
      expect(mockUserModel.findByIdAndUpdate).toHaveBeenCalledWith(mockUser._id, updateDto, { new: true });
    });
  });

  describe('loginUser', () => {
    const loginDto: LoginDto = { email: 'org@example.com', password: 'Password' };

    it('should login a user', async () => {
      mockUserModel.findOne.mockResolvedValue({ ...mockUser, password: 'Password' });
      (compare as jest.Mock).mockResolvedValue(true);

      const result = await service.loginUser(loginDto);

      expect(mockUserModel.findOne).toHaveBeenCalledWith({ email: loginDto.email });
      expect(result).toEqual(mockUser);
    });

    it('should throw an error if user not found', async () => {
      mockUserModel.findOne.mockResolvedValue(null);

      await expect(service.loginUser(loginDto)).rejects.toThrow(ModelUnprocessableEnitityException);
      expect(mockUserModel.findOne).toHaveBeenCalledWith({ email: loginDto.email });
    });

    it('should throw an error if password is incorrect', async () => {
      mockUserModel.findOne.mockResolvedValue({ ...mockUser, password: 'WrongPassword' });
      (compare as jest.Mock).mockResolvedValue(false);

      await expect(service.loginUser(loginDto)).rejects.toThrow(ModelUnprocessableEnitityException);
      expect(mockUserModel.findOne).toHaveBeenCalledWith({ email: loginDto.email });
    });
  });

  describe('changePassword', () => {
    const changePasswordDto: ChangePasswordDto = { email: 'org@example.com', newPassword: 'NewPassword' };

    it('should change the user password', async () => {
      mockUserModel.findOne.mockResolvedValue({ ...mockUser, password: 'OldPassword', save: jest.fn().mockResolvedValue(mockUser) });

      const result = await service.changePassword(changePasswordDto);

      expect(mockUserModel.findOne).toHaveBeenCalledWith({ email: changePasswordDto.email });
      expect(result.password).toEqual(changePasswordDto.newPassword);
    });

    it('should throw an error if user not found', async () => {
      mockUserModel.findOne.mockResolvedValue(null);

      await expect(service.changePassword(changePasswordDto)).rejects.toThrow(ModelNotFoundException);
      expect(mockUserModel.findOne).toHaveBeenCalledWith({ email: changePasswordDto.email });
    });
  });

  describe('followOrganization', () => {
    const followDto: FollowDto = { organizationId: '61c0ccf11d7bf83d153d7c07' };

    it('should follow an organization', async () => {  
      const user = { ...mockUser, role: USER_ROLES.USER, followers: [], save: jest.fn().mockResolvedValue(mockUser) };
      const organization = { ...mockUser, _id: '61c0ccf11d7bf83d153d7c07', role: USER_ROLES.ORGANIZATION };

      mockUserModel.findById.mockResolvedValueOnce(user).mockResolvedValueOnce(organization);
 
      const result = await service.followOrganization(mockUser._id, followDto);

      expect(mockUserModel.findById).toHaveBeenCalledWith(mockUser._id);
      expect(mockUserModel.findById).toHaveBeenCalledWith(followDto.organizationId);
      expect(result.followers).toContainEqual({ organizationId: followDto.organizationId });
    });

    it('should throw an error if user or organization not found', async () => {
      mockUserModel.findById.mockResolvedValueOnce(null);

      await expect(service.followOrganization(mockUser._id, followDto)).rejects.toThrow(ModelNotFoundException);
      expect(mockUserModel.findById).toHaveBeenCalledWith(mockUser._id);
    });

    it('should throw an error if roles are invalid', async () => {
      const user = { ...mockUser, role: USER_ROLES.ADMIN };
      const organization = { ...mockUser, _id: '61c0ccf11d7bf83d153d7c07', role: USER_ROLES.ORGANIZATION };

      mockUserModel.findById.mockResolvedValueOnce(user).mockResolvedValueOnce(organization);

      await expect(service.followOrganization(mockUser._id, followDto)).rejects.toThrow(ModelConflictException);
      expect(mockUserModel.findById).toHaveBeenCalledWith(mockUser._id);
      expect(mockUserModel.findById).toHaveBeenCalledWith(followDto.organizationId);
    });
  });

  describe('unfollowOrganization', () => {
    const followDto: FollowDto = { organizationId: '61c0ccf11d7bf83d153d7c07' };

    it('should unfollow an organization', async () => {
      const user = { ...mockUser, role: USER_ROLES.USER, followers: [{ organizationId: followDto.organizationId }], save: jest.fn().mockResolvedValue(mockUser) };

      mockUserModel.findById.mockResolvedValue(user);

      const result = await service.unfollowOrganization(mockUser._id, followDto);

      expect(mockUserModel.findById).toHaveBeenCalledWith(mockUser._id);
      expect(result.followers).not.toContainEqual({ organizationId: followDto.organizationId });
    });

    it('should throw an error if user not found', async () => {
      mockUserModel.findById.mockResolvedValue(null);

      await expect(service.unfollowOrganization(mockUser._id, followDto)).rejects.toThrow(ModelNotFoundException);
      expect(mockUserModel.findById).toHaveBeenCalledWith(mockUser._id);
    });

    it('should throw an error if role is invalid', async () => {
      const user = { ...mockUser, role: USER_ROLES.ADMIN, followers: [{ organizationId: followDto.organizationId }] };

      mockUserModel.findById.mockResolvedValue(user);

      await expect(service.unfollowOrganization(mockUser._id, followDto)).rejects.toThrow(ModelConflictException);
      expect(mockUserModel.findById).toHaveBeenCalledWith(mockUser._id);
    });
  });

  describe('createUser', () => {
    const createUserDto: CreateUserDto = {
      email: 'user@example.com',
      password: 'password',
      role: 'user',
      notifications: new NotificationsDto
    };

    it('should create a new user', async () => {
      mockUserModel.findOne.mockResolvedValue(null);
      mockUserModel.create.mockResolvedValue(mockUser);

      const result = await service.createUser(createUserDto);

      expect(mockUserModel.findOne).toHaveBeenCalledWith({ email: createUserDto.email });
      expect(mockUserModel.create).toHaveBeenCalledWith(createUserDto);
      expect(result).toEqual(mockUser);
    });

    it('should throw an error if email is already taken', async () => {
      mockUserModel.findOne.mockResolvedValue(mockUser);

      await expect(service.createUser(createUserDto)).rejects.toThrow(ModelUnprocessableEnitityException);
      expect(mockUserModel.findOne).toHaveBeenCalledWith({ email: createUserDto.email });
    });
  });

  describe('updateUser', () => {
    const updateUserDto = { ...mockUser, firstName: 'Updated User' };

    it('should update a user', async () => {
      mockUserModel.findOne.mockResolvedValue(null);
      mockUserModel.findByIdAndUpdate.mockResolvedValue(updateUserDto);

      const result = await service.updateUser(mockUser._id, updateUserDto);

      expect(mockUserModel.findOne).toHaveBeenCalledWith({ email: updateUserDto.email });
      expect(mockUserModel.findByIdAndUpdate).toHaveBeenCalledWith(mockUser._id, updateUserDto, { new: true });
      expect(result).toEqual(updateUserDto);
    });

    it('should throw an error if email is already taken by another user', async () => {
      mockUserModel.findOne.mockResolvedValue(mockUser);

      await expect(service.updateUser(mockUser._id, updateUserDto)).rejects.toThrow(ModelConflictException);
      expect(mockUserModel.findOne).toHaveBeenCalledWith({ email: updateUserDto.email });
    });

    it('should throw an error if user is not found', async () => {
      mockUserModel.findByIdAndUpdate.mockResolvedValue(null);

      await expect(service.updateUser(mockUser._id, updateUserDto)).rejects.toThrow(ModelUnprocessableEnitityException);
      expect(mockUserModel.findByIdAndUpdate).toHaveBeenCalledWith(mockUser._id, updateUserDto, { new: true });
    });
  });

  describe('getUsers', () => {
    it('should return a list of users', async () => {
      mockUserModel.find.mockResolvedValue([mockUser]);

      const result = await service.getUsers();

      expect(mockUserModel.find).toHaveBeenCalled();
      expect(result).toEqual([mockUser]);
    });
  });
});
