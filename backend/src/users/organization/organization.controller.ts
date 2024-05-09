import { Body, Controller, Post } from "@nestjs/common";
import { OrganizationService } from "./organization.service";
import { OrganizationDto } from "./dto/organization.dto";
import { OrganizationDetail } from "src/schemas/organization_detail.schema";

@Controller('organization')
 export class OrganizationController {
    constructor(private organizationService: OrganizationService) { }
    @Post('')
    async createOrganization(@Body() organizationDto: OrganizationDto): Promise<OrganizationDetail> {
        return this.organizationService.createOrganization(organizationDto);
    }
 }