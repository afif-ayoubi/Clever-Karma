import { Types } from 'mongoose';
import { OrganizationDetail } from 'src/schemas/organization_detail.schema';
import { User } from "src/schemas/user.schema";

export type OrganizationAuthResponseType = Omit<User, 'password'> & {
  id: Types.ObjectId,
  organizationDetail: OrganizationDetail 
};
