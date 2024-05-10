import { BadRequestException, Injectable, NotFoundException } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model } from "mongoose";
import { OrganizationDetail } from "src/schemas/organization_detail.schema";
import { OrganizationDto } from "./dto/organization.dto";
import { VolunteeringSection } from "src/schemas/volunteering_opportunity.schema";
import { ModelNotFoundException } from "src/core/error/exception";
import { ERROR_MESSAGES } from "src/core/constants/error_message";

@Injectable()
export class OrganizationService {
    constructor(@InjectModel(OrganizationDetail.name) private organizationSectionModel: Model<OrganizationDetail>, @InjectModel(VolunteeringSection.name) private volunteeringSectionModel: Model<VolunteeringSection>

    ) { }
    async createOrganization(organizationDto: OrganizationDto): Promise<OrganizationDetail> {
        if (!organizationDto.VolunteeringSection) throw new ModelNotFoundException(ERROR_MESSAGES.VOLUNTEERING_SECTION_REQUIRED);

        const volunteeringSectionDto = organizationDto.VolunteeringSection;
        const existingVolunteeringSection = await this.volunteeringSectionModel.findOne({
            name: volunteeringSectionDto.name,
            description: volunteeringSectionDto.description,
            imageUrl: volunteeringSectionDto.imageUrl
        });

        if (!existingVolunteeringSection) throw new ModelNotFoundException(ERROR_MESSAGES.INVALID_VOLUNTEERING_SECTION_VALUES);



        const createOrganization = new this.organizationSectionModel(organizationDto);
        return createOrganization.save();
    }
    async getAllOrganizations(): Promise<OrganizationDetail[]> {
        return this.organizationSectionModel.find().exec();
    }
    async deleteOrganization(id:string): Promise<void> {
        const organization = await this.organizationSectionModel.findByIdAndDelete(id);
        if (!organization) throw new NotFoundException(ERROR_MESSAGES.ORGANIZATION_NOT_FOUND);
    }
}