import { Body, Controller, Delete, Get, Param, Post } from "@nestjs/common";
import { OrganizationService } from "./organization.service";
import { OrganizationDto } from "./dto/organization.dto";
import { OrganizationDetail } from "src/schemas/organization_detail.schema";
import { SUCCESS_METHODS } from "src/core/constants/success_message";

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
    async deleteOrganization(@Param('id') id: string): Promise<{message:string}> {
        await  this.organizationService.deleteOrganization(id);
        return {message: SUCCESS_METHODS.ORGANIZATION_DELETED};
    }
 }