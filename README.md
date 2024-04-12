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

## 📊 ERD 
📎 https://www.erdcloud.com/d/8TcNeth4NEGRfXgtt
![erd](https://github.com/mulgoms2/Fundly/assets/77871865/ec739dd8-a32b-450c-b606-4d8da6b85d83)


## 프로젝트 구조
<img width="303" alt="스크린샷 2024-04-04 오후 4 19 46" src="https://github.com/mulgoms2/Fundly/assets/77871865/b0067e5e-5a94-4f8a-b7e0-9dfd7999cf1d">


## 사용 기술 및 구현 기능


### 사용 기술 및 tools
> - Front-End : JS , HTML, CSS, JQuery
> - Back-End : Java, Spring
> - Database : MySQL, myBatis
> - Collab : GitHub, Notion, ERDCloud

### 구현 기능

#### Users app - 전임경
- `bcrypt`를 이용한 비밀번호 암호화
- `JWT`를 이용한 User정보 토큰발행
- 프로필 `Image` 등록

#### Like app - 이은주
- 상품을 좋아요 기능 및 제거
- user의 좋아요 상품리스트 제공
- 결제 상세 페이지 작성

#### Project editor app - 박문주
- 프로젝트 등록 파트 뷰 구현(HTML, CSS, JS, Tiles)
- `datepicker`와 공휴일api를 이용해 제 7영업일 구하는 로직 구현
- 프로젝트에 포함되는 상품(아이템 및 선물) CRUD 
- 위즈윅 에디터를 활용한 상품 이미지 업로드 및 상품 설명 CRUD

#### Chat app - 한윤재
- `stomp` 프로토콜을 활용한 소켓 채팅 프로그램 작성

#### Payment app - 이지윤
- 카드 결제수단 CRUD(등록, 조회, 기본결제수단으로 지정, 삭제) 및 결제 기능 구현
- 통합 결제 솔루션 PortOne `REST API` 연동
- 주문 및 결제 로직 `Transaction` 처리
- 회원 마이페이지의 결제수단 뷰 구현
- 주문페이지 뷰 구현

#### Product app - 이한수

#### admin app - 김태민

#### Orders app - 
- 장바구니 추가(post) 삭제(delete) 업데이트(patch) 기능
- user의 장바구니에 담긴 상품리스트 제공(get)
- 장바구니에서 결제(post) - 데이터 무결성을 위한 `transaction`처리<br>


## Reference

- 이 프로젝트는 [텀블벅](https://tumblbug.com/) 사이트를 참고하여 학습목적으로 만들었습니다.
