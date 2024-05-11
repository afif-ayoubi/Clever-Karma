// import { BadRequestException, Injectable, NotFoundException } from "@nestjs/common";
// import { InjectModel } from "@nestjs/mongoose";
// import { Model, Types } from "mongoose";
// import { OrganizationDetail } from "src/schemas/organization_detail.schema";
// import { VolunteeringSection } from "src/schemas/volunteering_opportunity.schema";
// import { ModelNotFoundException } from "src/core/error/exception";
// import { ERROR_MESSAGES } from "src/core/constants/error_message";

// @Injectable()
// export class OrganizationService {
//     constructor(@InjectModel(OrganizationDetail.name) private organizationSectionModel: Model<OrganizationDetail>, @InjectModel(VolunteeringSection.name) private volunteeringSectionModel: Model<VolunteeringSection>

//     ) { }
//     async createOrganization(organizationDto: OrganizationDto): Promise<OrganizationDetail> {
//         if (!organizationDto.VolunteeringSection) throw new ModelNotFoundException(ERROR_MESSAGES.VOLUNTEERING_SECTION_REQUIRED);

//         const volunteeringSectionDto = organizationDto.VolunteeringSection;
//         const existingVolunteeringSection = await this.volunteeringSectionModel.findOne({
//             name: volunteeringSectionDto.name,
//             description: volunteeringSectionDto.description,
//             imageUrl: volunteeringSectionDto.imageUrl
//         });

//         if (!existingVolunteeringSection) throw new ModelNotFoundException(ERROR_MESSAGES.INVALID_VOLUNTEERING_SECTION_VALUES);



//         const createOrganization = new this.organizationSectionModel(organizationDto);
//         return createOrganization.save();
//     }
//     async getAllOrganizations(): Promise<OrganizationDetail[]> {
//         return this.organizationSectionModel.find();
//     }
//     async deleteOrganization(id: string): Promise<void> {
//         if (!Types.ObjectId.isValid(id)) throw new ModelNotFoundException(ERROR_MESSAGES.INVALID_Id);

//         const organization = await this.organizationSectionModel.findOneAndDelete();
//         if (!organization) throw new ModelNotFoundException(ERROR_MESSAGES.ORGANIZATION_NOT_FOUND);
//     }
//     async updateOrganization(id: string, updatedOrganizationDto: OrganizationDto): Promise<OrganizationDetail> {
//         const updatedOrganization = await this.organizationSectionModel.findByIdAndUpdate(id, updatedOrganizationDto, { new: true });

//         if (!updatedOrganization) throw new ModelNotFoundException(ERROR_MESSAGES.ORGANIZATION_NOT_FOUND);

//         return updatedOrganization;
//     }
// }