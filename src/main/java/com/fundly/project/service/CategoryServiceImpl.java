package com.fundly.project.service;

import com.fundly.project.exception.CategoryNotFoundException;
import com.fundly.project.model.CategoryDao;
import com.persistence.dto.CategoryDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryDao categoryDao;

    @Override
    public List<CategoryDto> getList() {
        try {
            return categoryDao.getList();
        } catch (CategoryNotFoundException e) {
            e.printStackTrace();
            throw e;
        }
    }
}
