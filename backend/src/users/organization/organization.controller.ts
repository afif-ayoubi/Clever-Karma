import { Body, Controller, Delete, Get, Post } from "@nestjs/common";
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
    @Get('')
    async getOrganizations(): Promise<OrganizationDetail[]> {
        return this.organizationService.getAllOrganizations();
    }
    @Delete(':id')
    async deleteOrganization(@Body() id: string): Promise<{message:string}> {
        await  this.organizationService.deleteOrganization(id);
        return {message: 'Organization deleted successfully'};
    }
 }