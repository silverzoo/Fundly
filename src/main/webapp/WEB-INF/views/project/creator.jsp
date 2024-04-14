<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<div class="pjWrap">
    <div class="pjCont">
        <!-- 창작자 이름 -->
        <div class="pjBox cName">
            <dl class="pjInfo">
                <dt class="pjInfoTit">창작자 이름
                    <span class="icon">
                        <i class="fas fa-solid fa-asterisk"></i>
                    </span>
                </dt>
                <dd class="pjInfoDscpt">창작자 개인이나 팀을 대표할 수 있는 이름을 써주세요.
                </dd>
            </dl>
            <div class="pjForm none">
                <div class="pjInputWrap">
                    <div>
                        <input type="text" id="selName" class="pjInput" placeholder="창작자님의 이름을 입력해주세요."
                               value="${creator.pj_sel_name}">
                    </div>
                    <div class="notice">
                        <p>필수 항목입니다.</p>
                        <c:set var="nameCount" value="${empty creator.pj_sel_name ? 0 : creator.pj_sel_name.length()}"/>
                        <p id="nameCount">${nameCount}/20</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- 프로필 이미지 -->
        <div class="pjBox cProf">
            <dl class="pjInfo">
                <dt class="pjInfoTit">프로필 이미지
                    <span class="icon">
                        <i class="fas fa-solid fa-asterisk"></i>
                    </span>
                </dt>
                <dd class="pjInfoDscpt">창작자 개인이나 팀의 사진을 올려주세요.
                </dd>
            </dl>
            <div class="pjForm none">
                <div class="profBx">
                    <div class="imgBx">
                        <img id="profImg" src="${creator.pj_prof_image_url}">
                        <%--                        <img src="<c:url value='/static/project/img/lemon.jpg'/>">--%>
                    </div>
                    <div class="upBx">
                        <label for="pjImgUp"><i class="fa-solid fa-arrow-up-from-bracket"></i>이미지 파일 업로드
                            <input id="pjImgUp" accept="image/*" type="file">
                        </label>
                        <p>
                            파일 형식은 jpg 또는 png 또는 gif,
                            <br>사이즈는 가로 200px, 세로 200px 이상으로 올려주세요.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <!--창작자 소개-->
        <div class="pjBox intro">
            <dl class="pjInfo">
                <dt class="pjInfoTit">창작자 소개
                    <span class="icon">
                        <i class="fas fa-solid fa-asterisk"></i>
                    </span>
                </dt>
                <dd class="pjInfoDscpt">2~3문장으로 창작자님의 이력과 간단한 소개를 써주세요.
                </dd>
            </dl>
            <div class="pjForm none">
                <div class="pjTitle"></div>
                <div class="pjImage">
                    <img src="" alt="">
                </div>
                <div class="pjInputWrap">
                    <div class="pjInputBx">
                        <textarea id="selIntro" class="pjTxt"
                                  placeholder="간단한 이력과 소개를 써주세요.">${creator.pj_sel_short_intro}</textarea>
                    </div>
                    <div class="notice">
                        <p>필수 항목입니다.</p>
                        <c:set var="countIntro"
                               value="${empty creator.pj_sel_short_intro ? 0 : creator.pj_sel_short_intro.length()}"/>
                        <p id="introCount">${countIntro}/50</p>
                    </div>
                </div>
            </div>
        </div>
        <!--입금계좌-->
        <%--        <div class="pjBox acc">--%>
        <%--            <dl class="pjInfo">--%>
        <%--                <dt class="pjInfoTit">프로젝트 대표이미지--%>
        <%--                    <span class="icon">--%>
        <%--                        <i class="fas fa-solid fa-asterisk"></i>--%>
        <%--                    </span>--%>
        <%--                </dt>--%>
        <%--                <dd class="pjInfoDscpt">후원자들이 프로젝트의 내용을 쉽게 파악하고 좋은 인상을 받을 수 있도록 이미지 가이드라인을 따라 주세요--%>
        <%--                </dd>--%>
        <%--            </dl>--%>
        <%--            <div class="pjForm">--%>
        <%--                <ul>--%>
        <%--                    <li>--%>
        <%--                        <p>계좌 종류</p>--%>
        <%--                        <div class="btnWrap">--%>
        <%--                            <button type="button"><i class="fas fa-solid fa-user"></i>--%>
        <%--                                <div>개인</div>--%>
        <%--                            </button>--%>
        <%--                            <button type="button"><i class="fas fa-solid fa-briefcase"></i>--%>
        <%--                                <div>사업자</div>--%>
        <%--                            </button>--%>
        <%--                        </div>--%>
        <%--                    </li>--%>
        <%--                    <li>--%>
        <%--                        <div>--%>
        <%--                            <p>예금주 생년월일</p>--%>
        <%--                            <div class="birth">--%>
        <%--                                <input type="text">--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </li>--%>
        <%--                    <li>--%>
        <%--                        <div class="bank">--%>
        <%--                            <div class="half">--%>
        <%--                                <p>거래은행</p>--%>
        <%--                                <select id="bank" class="category">--%>
        <%--                                    <option value="IBK">기업은행</option>--%>
        <%--                                    <option value="KB">국민은행</option>--%>
        <%--                                    <option value="NH">농협은행</option>--%>
        <%--                                    <option value="SH">신한은행</option>--%>
        <%--                                    <option value="WR">우리은행</option>--%>
        <%--                                </select>--%>
        <%--                                <span>케이뱅크와 카카오뱅는 계좌등록이 불가합니다</span>--%>
        <%--                            </div>--%>
        <%--                            <div class="half">--%>
        <%--                                <p>예금주명</p>--%>
        <%--                                <div class="inputWrp">--%>
        <%--                                    <input type="text" placeholder="예금주명을 정확히 입력해주세요.">--%>
        <%--                                </div>--%>
        <%--                                <span>( 펀들리 ) 처럼 공백과 괄호까지 정확히 입력해주세요</span>--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </li>--%>
        <%--                    <li>--%>
        <%--                        <div class="accNum">--%>
        <%--                            <p>계좌번호</p>--%>
        <%--                            <div class="pjInputWrap">--%>
        <%--                                <div>--%>
        <%--                                    <input type="number" class="pjInput" placeholder="숫자로만 입력해주세요.">--%>
        <%--                                </div>--%>
        <%--                                <div class="notice">--%>
        <%--                                    <p>필수 항목입니다.</p>--%>
        <%--                                    <p>0/20</p>--%>
        <%--                                </div>--%>
        <%--                            </div>--%>
        <%--                        </div>--%>
        <%--                    </li>--%>
        <%--                    <li>--%>
        <%--                        <div class="accUp">--%>
        <%--                            <p>통장 사본 첨부</p>--%>
        <%--                            <label for="accImg">--%>
        <%--                                <i class="fa-solid fa-arrow-up-from-bracket"></i><span>파일 업로드</span>--%>
        <%--                                <input id="accImg" accept="image/*" type="file">--%>
        <%--                            </label>--%>
        <%--                        </div>--%>
        <%--                    </li>--%>
        <%--                    <li>--%>
        <%--                        <div class="btnWrp">--%>
        <%--                            <button type="button" class="cancel">취소</button>--%>
        <%--                            <button type="button" class="save">등록</button>--%>
        <%--                        </div>--%>
        <%--                    </li>--%>
        <%--                </ul>--%>
        <%--            </div>--%>
        <%--        </div>--%>
    </div>
</div>
<script src="/static/project/js/creator.js"></script>