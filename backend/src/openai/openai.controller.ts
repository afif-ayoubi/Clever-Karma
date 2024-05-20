import { Body, Controller, HttpCode, Post } from '@nestjs/common';
import { IChatRequest, IChatResponse, OpenaiService } from './openai.service';

@Controller('openai')
export class OpenaiController {
  constructor(private openaiService: OpenaiService) {}

  @Post('/chat')
  @HttpCode(200)
  async getChatOpenai(@Body() request: IChatRequest = {}): Promise<IChatResponse> {
    const accidentData = request.accidentData || {};

    try {
      const aiResponse = await this.openaiService.getAIResponse(accidentData);
      return aiResponse;
    } catch (error) {
      console.error('Error in OpenaiController:', error);
      return {
        success: false,
        result: 'Failed to generate AI response',
      };
    }
  }
}
