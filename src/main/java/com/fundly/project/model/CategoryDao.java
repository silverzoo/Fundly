package com.fundly.project.model;

import com.persistence.dto.CategoryDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryDao {
    // 카테고리 DTO 필요
    List<CategoryDto> getList();
}
