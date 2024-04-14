<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Document</title>--%>
<%--</head>--%>
<%--<!-- 모든 input에 같은 클래스 적용 (outline, required 등 속성 적용 위해) ex. pjInput-->--%>
<%--<body>--%>

<%-- basicInfo 라는 이름으로 작성중인 프로젝트 기본 정보를 내려받는다.--%>
<div class="pjWrap">
    <div class="pjCont">
        <!-- 카테고리 -->
        <div class="pjBox cat">
            <dl class="pjInfo none">
                <dt class="pjInfoTit">프로젝트 카테고리
                    <span class="icon">
                        <i class="fas fa-solid fa-asterisk"></i>
                    </span>
                </dt>
                <dd class="pjInfoDscpt">프로젝트 성격과 가장 일치하는 카테고리를 선택해주세요.
                    <br>
                    적합하지 않을 경우 운영자에 의해 조정될 수 있습니다.
                </dd>
            </dl>
            <div class="pjForm none">
                <div class="formBx">
                    <div class="left">
                        <p>카테고리</p>
                        <form:form modelAttribute="basicInfo">
                            <form:select path="ctg" items="${ctg}" itemValue="ctg_code" itemLabel="ctg_name"
                                         cssClass="category"/>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <!-- 프로젝트 제목 -->
        <div class="pjBox tit">
            <dl class="pjInfo none">
                <dt class="pjInfoTit">프로젝트 제목
                    <span class="icon">
                        <i class="fas fa-solid fa-asterisk"></i>
                    </span>
                </dt>
                <dd class="pjInfoDscpt">프로젝트의 주제, 창작물의 특징이 드러나는 멋진 제목을 붙여주세요.
                </dd>
            </dl>
            <div class="pjForm none">
                <div class="titBox">
                    <div class="pjLongTit">
                        <div class="pjTitle">긴 제목</div>
                        <div class="pjImage">
                            <img src="" alt="">
                        </div>
                        <div class="pjInputWrap">
                            <div>
                                <input type="text" id="longTitle" class="pjInput" value="${projectDto.pj_long_title}"
                                       placeholder="긴 제목을 입력해주세요."/>
                            </div>
                            <c:set var="longCount"
                                   value="${empty projectDto.pj_long_title ? 0 : projectDto.pj_long_title.length()}"/>
                            <p id="longTitleCounter">${longCount}/32</p>
                        </div>
                    </div>

                    <div class="pjShortTit">
                        <div class="pjTitle">짧은 제목</div>
                        <div class="pjImage">
                            <img src="" alt="">
                        </div>
                        <div class="pjInputWrap">
                            <div>
                                <input type="text" id="shortTitle" class="pjInput" value="${projectDto.pj_short_title}"
                                       placeholder="짧은 제목을 입력해주세요.">
                            </div>
                            <c:set var="shortCount"
                                   value="${empty projectDto.pj_short_title ? 0 : projectDto.pj_short_title.length()}"/>
                            <p id="shortTitleCounter">${shortCount}/7</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--프로젝트 요약-->
        <div class="pjBox sum">
            <dl class="pjInfo none">
                <dt class="pjInfoTit">프로젝트 요약
                    <span class="icon">
                        <i class="fas fa-solid fa-asterisk"></i>
                    </span>
                </dt>
                <dd class="pjInfoDscpt">후원자 분들이 프로젝트를 빠르게 이해할 수 있도록
                    명확하고 간략하게 소개해주세요.
                </dd>
            </dl>
            <div class="pjForm none">
                <div class="pjTitle"></div>
                <div class="pjImage">
                    <img src="" alt="">
                </div>
                <div class="pjInputWrap">
                    <div class="pjInputBx">
                        <textarea id="pjIntro" class="pjTxt">${projectDto.pj_short_intro}</textarea>
                    </div>
                    <div class="notice">
                        <c:set var="introCount"
                               value="${empty projectDto.pj_short_intro ? 0 : projectDto.pj_short_intro.length()}"/>
                        <p>필수 항목입니다.</p>
                        <p id="introCounter">${introCount}/50</p>
                    </div>
                </div>
            </div>
        </div>

        <!--프로젝트 대표이미지-->
        <div class="pjBox thumb">
            <dl class="pjInfo none">
                <dt class="pjInfoTit">프로젝트 대표이미지
                    <span class="icon">
                        <i class="fas fa-solid fa-asterisk"></i>
                    </span>
                </dt>
                <dd class="pjInfoDscpt">후원자들이 프로젝트의 내용을 쉽게 파악하고 좋은 인상을 받을 수 있도록 이미지 가이드라인을 따라 주세요
                </dd>
                <div class="pjNotice">
                    <i class="fas fa-solid fa-circle-info"></i>
                    <p class="pjNoticeTit">
                        1개 이상의 이미지를 등록하면 이미지 슬라이더 형식으로 제공됩니다.</p>
                    <p class="pjNoticeCont">푸시 메시지 등 이미지가 1개만 제공되는 상황에서 대표 이미지가 활용됩니다.</p>
                </div>
            </dl>
            <div class="pjForm none">
                <div class="pjTitle"></div>
                <div class="pjImage">
                    <img src="" alt="">
                </div>
                <label class="pjImgUp">
                    <span><i class="fa-solid fa-arrow-up-from-bracket"></i>이미지 업로드</span>
                    <%--                    <p>최소 1개, 최대 5개까지 업로드 가능</p>--%>
                    <p>파일 형식: jpg 또는 png / 사이즈: 가로 1,240px, 세로 930px 이상</p>
                    <input type="file" id="thumbnail_input" accept="image/*">
                    <strong>※ 이미지를 등록하면 즉시 반영됩니다.</strong>
                </label>
                <div class="imgBx">
                    <img id="thumbnail_img" class="thumbnail_img" src="${projectDto.pj_thumbnail_url}">
                </div>
            </div>
        </div>
        <!-- 프로젝트 해시태그 -->
        <div class="pjBox tag">
            <dl class="pjInfo none">
                <dt class="pjInfoTit">검색태그
                    <span class="icon">
                        <i class="fas fa-solid fa-asterisk"></i>
                    </span>
                </dt>
                <dd class="pjInfoDscpt">잠재 후원자의 관심사를 고려한 검색 태그를 입력해주세요.
                    <br>
                    외부 검색엔진이나 텀블벅에서 해당 태그로 검색한 후원자가 프로젝트를 발견할 수 있습니다.
                </dd>
                <div class="pjNotice">
                    <i class="fas fa-solid fa-circle-info"></i>
                    <p class="pjNoticeTit">
                        무관한 태그는 후원자의 불편을 초래합니다!</p>
                    <p class="pjNoticeCont">반드시 프로젝트에 관련된 태그만 사용해 주세요. 프로젝트와 무관한 태그 설정으로 후원자 신고가 누적될 시 프로젝트에 제재가 가해질 수
                        있습니다.</p>
                </div>
            </dl>
            <div class="pjForm none">
                <div class="pjInputWrap">
                    <div>
                        <input type="text" id="searchTagIpt" class="pjInput"
                               placeholder="Enter를 눌러서 핵심 키워드를 등록해주세요.(최대 5개)">
                    </div>
                    <div class="notice">
                        <p>필수 항목입니다.</p>
                    </div>
                    <div id="tagContainer" class="tagContainer">
                        <c:forEach var="tag" items="${basicInfo.tags}">
                            <span class="searchTag">${tag}
                                <button id="eraseBtn" class="eraseBtn"><i
                                        class="fa-solid fa-x fa-2xs"></i></button></span>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/static/project/js/basicInfo.js"></script>