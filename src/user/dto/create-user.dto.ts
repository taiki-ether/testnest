import { ApiProperty } from "@nestjs/swagger";

export class CreateUserDto {
    @ApiProperty({ example: 'Taiki Test'})
    username: string;
}
