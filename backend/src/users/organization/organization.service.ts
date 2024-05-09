import { Injectable } from "@nestjs/common";
import { InjectModel } from "@nestjs/mongoose";
import { Model } from "mongoose";
import { OrganizationDetail } from "src/schemas/organization_detail.schema";
import { VolunteeringSection } from "src/schemas/volunteering_opportunity.schema";

@Injectable()
export class OrganizationService {
    constructor(@InjectModel(OrganizationDetail.name) private organizationSectionModel: Model<OrganizationDetail>
    ) { }
    async created
}