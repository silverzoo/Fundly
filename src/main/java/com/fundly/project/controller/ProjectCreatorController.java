package com.fundly.project.controller;

import com.fundly.project.exception.ProjectNofFoundException;
import com.fundly.project.exception.ProjectUpdateFailureException;
import com.fundly.project.service.ProjectService;
import com.persistence.dto.ProjectCreatorUpdateRequest;
import com.persistence.dto.ProjectDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

@Slf4j
@Controller
@SessionAttributes("projectDto")
@RequestMapping("/project/editor")
public class ProjectCreatorController {
    @Autowired
    ProjectService projectService;

    @ModelAttribute("projectDto")
    ProjectDto initProjectEditor(@SessionAttribute String user_email, HttpSession session) {
        try {
            ProjectDto projectDto = projectService.getEditingProject(user_email);
            session.setAttribute("pj_id", projectDto.getPj_id());
            return projectDto;
        } catch (ProjectNofFoundException e) {
            return null;
        }
    }

    @GetMapping("/creator")
    public String creatorInfo (ProjectDto projectDto, Model model) {
        model.addAttribute("creator", ProjectDto.toCreatorDto(projectDto));

        return "project.creator";
    }

    @PostMapping("/creator")
    public ResponseEntity<Boolean> updateCreatorInfo(ProjectCreatorUpdateRequest request, ProjectDto projectDto) {
//        요청객체로부터 파일이 담겨오는 이를 저장하고 url로 처리해서 projectDto에 넘겨주어야 한다.
        projectDto.updateCreatorInfo(request);

        projectService.update(projectDto);

        return ResponseEntity.ok(true);
    }

//    js 응답객체가 text를 꺼낼때 인코딩이 깨지는 문제를 produces 로 해결 할 수 있다.
    @PostMapping(value = "/creator/image", produces = "text/plain; charset=UTF-8")
    public ResponseEntity<String> updateProfileImage(MultipartFile image, ProjectDto projectDto, HttpServletRequest request) throws UnsupportedEncodingException {
//        프로필 이미지를 서버에 저장한다.
//        저장된 url을 담는다.
//        db에 변경된 프로젝트를 반영한다.
        String tagSrcUrl = saveImgFile(image, request);
        projectDto.updateProfileImage(tagSrcUrl);

        projectService.update(projectDto);

        return ResponseEntity.ok(tagSrcUrl);
    }

    private String saveImgFile(MultipartFile file, HttpServletRequest request) {
        String save_loacation = request.getContextPath() + "/Users/dobigulbi/fundly/project/img/";
        String file_name =  UUID.randomUUID() + file.getOriginalFilename();
        String tag_src_url = "/fundly/project/img/" + file_name;

        try {
            file.transferTo(new File(save_loacation + file_name));
        } catch (IOException e) {
            log.error("saveImgFIle(file) : {} \n{}",e.getCause(), e.getStackTrace());
            throw new RuntimeException(e);
        }
        return tag_src_url;
    }

    @ExceptionHandler(ProjectUpdateFailureException.class)
    private ResponseEntity<Boolean> failToUpdate() {
        return ResponseEntity.badRequest().body(false);
    }
}

