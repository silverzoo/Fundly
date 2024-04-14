package com.persistence.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CategoryDto {
    private String ctg_code;
    private String ctg_name;
}
