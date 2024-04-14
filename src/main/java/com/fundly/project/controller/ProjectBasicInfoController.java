package com.fundly.project.controller;

import com.fundly.project.exception.ImageSaveFailureException;
import com.fundly.project.exception.ProjectAddFailureException;
import com.fundly.project.exception.ProjectNotFoundException;
import com.fundly.project.exception.ProjectUpdateFailureException;
import com.fundly.project.service.CategoryService;
import com.fundly.project.service.ProjectService;
import com.fundly.project.util.FileUploader;
import com.persistence.dto.ProjectAddRequest;
import com.persistence.dto.ProjectDto;
import com.persistence.dto.ProjectInfoUpdateRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;

@Slf4j
@Controller
@RequestMapping("/project/editor")
@SessionAttributes("projectDto")
public class ProjectBasicInfoController {
    ProjectService projectService;
    CategoryService categoryService;

    @Autowired
    public ProjectBasicInfoController(ProjectService projectService, CategoryService categoryService) {
        this.projectService = projectService;
        this.categoryService = categoryService;
    }

    @ModelAttribute("projectDto")
//    비로그인시 로그인페이지. 로그인시 기존 프로젝트 확인 후 존재하면 세션에 저장. 없으면 저장 x
    ProjectDto initProjectEditor(@SessionAttribute String user_email) {
        try {
            return projectService.getEditingProject(user_email);
        } catch (ProjectNotFoundException e) {
            return null;
        }
    }

    @GetMapping("/start")
//   프로젝트 에디터 시작페이지. 이어작성, 새로작성 구분
    public String getStartPage(@ModelAttribute ProjectDto projectDto) {

        return "project/start";
    }

    @GetMapping("/info")
//    프로젝트 기본정보 탭을 불러온다.
    public String getBasicInfo(@ModelAttribute ProjectDto projectDto, Model model) {
//       프로젝트 기본 정보를 모델에 담는다.
        model.addAttribute("basicInfo", ProjectDto.toBasicInfo(projectDto));

//        프로젝트 카테고리를 모델에 담는다.
        model.addAttribute("ctg", categoryService.getList());

        return "project.basicInfo";
    }

    @PostMapping("/info")
//    프로젝트를 생성한다.
    public String makeProject(@ModelAttribute ProjectAddRequest addRequest, Model model) {
        ProjectDto pj = projectService.add(addRequest);

        model.addAttribute("projectDto", pj);

//        중복 제출 막기위한 리다이렉트
        return "redirect:/project/editor/info";
    }

    @PostMapping("/infoUpdate")
//    멀티파트 요청을 받아 업데이트를 처리한다.
    public ResponseEntity<Boolean> updateBasicInfo(@Valid ProjectInfoUpdateRequest updateRequest, ProjectDto project) {
        project.updateBasicInfo(updateRequest);
        projectService.update(project);

        return ResponseEntity.ok(true);
    }

    @PostMapping(value = "/info/image", produces = "text/plain; charset=UTF-8")
    public ResponseEntity<String> updateThumbnailImage(MultipartFile image, ProjectDto projectDto) {
        String tagSrcUrl = FileUploader.uploadFile(image);

        projectDto.updateThumbnailImage(tagSrcUrl);

        projectService.update(projectDto);

        return ResponseEntity.ok(tagSrcUrl);
    }

    @PostMapping("/submit")
    public String submitProject(ProjectDto projectDto, SessionStatus sessionStatus) {
//        프로젝트 발리데이션을 한다.

//        프로젝트 상태를 심사대기중으로 업데이트 한다.
        String status = "심사대기중";
        projectDto.setPj_status(status);

        projectService.update(projectDto);

//        세션에서 프로젝트dto를 제거한다.
        sessionStatus.setComplete();

        log.debug("{}", sessionStatus.isComplete());
//        완료 메시지 & 홈으로 리다이렉트
        return "redirect:/";
    }

    @ExceptionHandler(ImageSaveFailureException.class)
    private void failToSaveImage(ImageSaveFailureException e) {
        log.error("{}\n\n\n{}", e.getMessage(), e.getStackTrace());
    }

    @ExceptionHandler(ProjectUpdateFailureException.class)
    private ResponseEntity<Boolean> failToUpdate(ProjectUpdateFailureException e) {
        log.error("{}\n{}", e.getMessage(), e.getStackTrace());
        return ResponseEntity.badRequest()
                .body(false);
    }

    @ExceptionHandler(ProjectAddFailureException.class)
    private String projectAddFail(Model model, ProjectUpdateFailureException e) {
        log.error("{}\n{}", e.getMessage(), e.getStackTrace());
        model.addAttribute("errorMsg", "프로젝트 생성에 실패하였습니다. 다시 시도해주세요");
        return "project/clientError";
    }

    @ExceptionHandler(Exception.class)
    private String handleCommonError(Model model, Exception e) {
        log.error("{}\n {}\n", e.getCause(), e.getStackTrace());
        model.addAttribute("errorMsg", "잘못 된 접근입니다. 다시 시도해주세요.");
        return "project/clientError";
    }
}
