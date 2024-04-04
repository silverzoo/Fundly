# Fundly

## Fundly 소개
- 크리에이터들의 창작활동을 지원하기 위한 크라우드 펀딩 플랫폼 펀들리입니다.
- 웹개발의 전반적인 흐름을 이해하고 학습하기 위한 팀 프로젝트입니다.

### 개발 인원 및 기간

- 개발기간 : 2024/01/15 ~ 2024/03/15
- 개발 인원 : 7명


### 데모 영상

*추후 추가*

<br>

## 프로젝트 구조
<img width="303" alt="스크린샷 2024-04-04 오후 4 19 46" src="https://github.com/mulgoms2/Fundly/assets/77871865/b0067e5e-5a94-4f8a-b7e0-9dfd7999cf1d">


## 사용 기술 및 구현 기능


### 사용 기술 및 tools
> - Front-End : JS , HTML, CSS, JQuery
> - Back-End : Spring
> - Database : MySQL
> - Collab : GitHub, Notion

<img width="1859" alt="스크린샷 2021-06-18 오전 7 28 39" src="https://user-images.githubusercontent.com/8219812/122530429-6cbe2700-d059-11eb-98e9-bdb8eebd4d94.png">

[AQueryTool(pw:bup04w)](https://aquerytool.com:443/aquerymain/index/?rurl=5a275d62-5fd7-44b5-ad51-f9ba875ceb01)

### 구현 기능

#### Users app - 정민
- `bcrypt`를 이용한 비밀번호 암호화
- `JWT`를 이용한 User정보 토큰발행
- 상품을 좋아요 기능 및 제거
- user의 좋아요 상품리스트 제공

#### Products app - 태우
- 조건에 맞게 쿼리파라미터를 받아서 `Q객체`를 이용한 상품 필터링 및 정렬 (신상품, 인기상품, 검색, 카테고리, 캐릭터)
- 쿼리파라미터를 이용한 페이징 기능
- 한 개의 상품에 대한 상세 정보 제공

#### Orders app - 효진(담당)🙋‍♀️
- 장바구니 추가(post) 삭제(delete) 업데이트(patch) 기능
- user의 장바구니에 담긴 상품리스트 제공(get)
- 장바구니에서 결제(post) - 데이터 무결성을 위한 `transaction`처리<br>
  ##### 사용한 Model
  > Order - OrderStatus : Many-to-One<br>
  > Order - OrderItem : One-to-Many<br>
  > Order - RecipientInfo : One-to-One<br>
  
  구현 부분 : https://github.com/hyo-jin-jeong/21-1st-KaKa0Adult-backend/tree/main/orders<br>
<br>

## Reference

- 이 프로젝트는 [카카오 프렌즈삽](https://store.kakaofriends.com/kr/index) 사이트를 참조하여 학습목적으로 만들었습니다.
- 실무수준의 프로젝트이지만 학습용으로 만들었기 때문에 이 코드를 활용하여 이득을 취하거나 무단 배포할 경우 법적으로 문제될 수 있습니다.
- 이 프로젝트에서 사용하고 있는 사진 대부분은 위코드에서 구매한 것이므로 해당 프로젝트 외부인이 사용할 수 없습니다.
