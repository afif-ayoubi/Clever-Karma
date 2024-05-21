import { Test, TestingModule } from '@nestjs/testing';
import { getModelToken } from '@nestjs/mongoose';
import { Model } from 'mongoose';

import { VolunteeringSection } from '../../schemas/volunteering_opportunity.schema';
import { VolunteeringSectionService } from './volunteering_section.service';
import { VolunteeringSectionDto } from './dto/volunteering_section.dto';
import { ModelUnprocessableEnitityException } from '../../core/error/exception';

describe('VolunteeringSectionService', () => {
  let service: VolunteeringSectionService;
  let volunteeringSectionModel: Model<VolunteeringSection>;

  const mockVolunteeringSection = {
    _id: '664943ac69b541102c576877',
    name: 'Volunteering Section',
    description: 'Description of volunteering section',
    imageUrl: 'https://example.com/image.png',
  };

  const mockVolunteeringSectionDto: VolunteeringSectionDto = {
    name: 'New Volunteering Section',
    description: 'Description of new volunteering section',
    imageUrl: 'https://newexample.com/image.png',
  };

  const mockVolunteeringSectionModel = {
    findOneAndDelete: jest.fn(),
    find: jest.fn(),
    save: jest.fn().mockResolvedValue(mockVolunteeringSection),
    findById: jest.fn().mockResolvedValue(mockVolunteeringSection),
    findByIdAndUpdate: jest.fn().mockResolvedValue(mockVolunteeringSection),
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        VolunteeringSectionService,
        {
          provide: getModelToken(VolunteeringSection.name),
          useValue: mockVolunteeringSectionModel,
        },
      ],
    }).compile();

    service = module.get<VolunteeringSectionService>(VolunteeringSectionService);
    volunteeringSectionModel = module.get<Model<VolunteeringSection>>(getModelToken(VolunteeringSection.name));
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  describe('createdVolunteeringSection', () => {
    it('should create a new volunteering section', async () => {
      const result = await service.createdVolunteeringSection(mockVolunteeringSectionDto);
      expect(result).toEqual(mockVolunteeringSection);
      expect(mockVolunteeringSectionModel.save).toHaveBeenCalledWith(mockVolunteeringSectionDto);
    });
  });

  describe('deleteVolunteeringSection', () => {
    it('should delete a volunteering section', async () => {
      const id = '664943ac69b541102c576877';
      await service.deleteVolunteeringSection(id);
      expect(mockVolunteeringSectionModel.findOneAndDelete).toHaveBeenCalledWith({ _id: id });
    });

    it('should throw ModelUnprocessableEnitityException if volunteering section is not found', async () => {
      const id = 'non-existent-id';
      mockVolunteeringSectionModel.findOneAndDelete.mockResolvedValue(null);
      await expect(service.deleteVolunteeringSection(id)).rejects.toThrow(ModelUnprocessableEnitityException);
      expect(mockVolunteeringSectionModel.findOneAndDelete).toHaveBeenCalledWith({ _id: id });
    });
  });

  describe('getAllVolunteeringOpportunities', () => {
    it('should return all volunteering opportunities', async () => {
      const expectedResult = [mockVolunteeringSection];
      mockVolunteeringSectionModel.find.mockResolvedValue(expectedResult);
      const result = await service.getAllVolunteeringOpportunities();
      expect(result).toEqual(expectedResult);
      expect(mockVolunteeringSectionModel.find).toHaveBeenCalled();
    });
  });
});
