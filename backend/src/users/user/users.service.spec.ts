import { Test, TestingModule } from '@nestjs/testing';
import { getModelToken } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { UsersService } from './users.service';
import { User } from '../../schemas/user.schema';
import { VolunteeringSection } from '../../schemas/volunteering_opportunity.schema';
import { ModelUnprocessableEnitityException, ModelConflictException } from '../../core/error/exception';
import { ERROR_MESSAGES } from '../../core/constants/error_message';
import { OrganizationDto } from './dto/organization_dto/organization.dto';

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
});
