SWAIG 프로젝트(가제)
=============
경기대학교 AI컴퓨터공학부 웹서버 프로젝트 (cshome 6기)

[홈페이지에서 확인하기(미오픈)](http://swaig.kyonggi.ac.kr)
🟥🟧🟨🟩🟦🟪🟫⬛⬜
>경기대학교 AI컴퓨터공학부
> >이은정 지도교수님
* * *
## SWAIG Developers
### ✔cs home 6기 (2021 여름방학)
- 윤주현(201713919) [Project Manager]
  > github@gabrielyoon7
- 김가영(201912021)
  > github@gykim0923
- 박선애(201912067)
  > github@SeonaePark
- 박소영(201912069)
  > github@soyoung125
- 박의진(201912072)
  > github@jinny-park

***
## Update Log
- 2021.07.17
  - [박의진]
    - 사이트맵 완성 및 디자인 수정 (카드형식 / 리스트 형식 /그리드 레이아웃으로)
- 2021.07.16
  - [박의진]
    - 연구실 페이지 연구실 데이터 수정 /추가하기 기능 버그 수정 완료
- 2021.07.15
  - [박의진]
    - 연구실 페이지 UI 개선 및 수정 기능을 Modal로 처리할 수 있도록 개선
  - [박소영]
    - admin_main의 하위 코드 전면 개편 및 최적화 (JS 전부 나눠버림 및 jQuery를 활용한 공동 Modal 사용으로 코드량 대폭 감소)
    - 일정 기능 추가, 수정을 Modal로 띄울 수 있게 개선. (동작은 미구현)
  - [윤주현]
    - page_stand_alone 레이아웃 추가 및 연관된 페이지 (위치, 사이트맵, 개발진) 추가.
    - 좀 더 효율적인 taglib 사용을 위한 작업(customAction에 json관련 코드 추가). 이제부터 일부 변수는 taglib에서 Java -> JSON 직접 접근이 가능해짐.
    - 동아리 페이지 개선
    - admin_main.jsp의 코드가 복잡해져 분리 시도
    - location.kgu에 지도 연동

- 2021.07.14
  - [김가영]
    - 교수 페이지 레이아웃 및 DB 연동(구현중)
  - [박선애]
    - 동아리 페이지 레이아웃 및 DB 연동(구현중)
  - [박의진]
    - 연구실 페이지 레이아웃 및 DB 연동
    - 연구실 수정/삭제(구현중)
  - [박소영]
    - 마이페이지 레이아웃 작성 및 개인정보 수정기능 추가
    - 비밀번호 변경 기능 추가
    - 개인 로그 레이아웃 작성
  - [윤주현]
    - 모바일 해상도 지원
    - 관리자가 전공을 추가/수정 기능 추가(삭제는 미구현)
    - 관리자 페이지에서 일정 DB 연동
  
- 2021.07.13
  - [윤주현]
    - offcanvas에 전공DB가 연동될 수 있도록 개선 (중간 텍스트는 임시로 넣어놓은 관계로 수정 필요)
    - 회원 삭제 기능 추가(추후에 회원 탈퇴에서도 메소드 재활용이 가능할 것으로 보임)
    - 부트스트랩 아이콘 css 적용(page.jsp에서 확인 가능)
  - [박소영]
    - 교육과정 기능 추가(이미지 업로드는 추후 구현)

- 2021.07.12
  - [공 동]
    - 프로젝트 전면 검토 및 각종 용어 통일 (header및 page 레이아웃에 관련된 용어 전면 수정)
    - 전공 간 이동 페이지 개선 (부트스트랩 offcanvas 도입)
    - information.kgu 관련 기능 완성 및 ckeditor 라이브러리 연동
    - 설계 ppt 완성

- 2021.07.10
  - [윤주현]
    - 회원가입 시 희망구분이 DB와 연동되도록 개선
    - 페이지 제어 주체를 헤더에서 page.jsp로 변경
    - 홈페이지 내 전공 개념 추가

- 2021.07.09
  - [윤주현]
    - 각 페이지에 따른 페이지 헤더, 페이지 메뉴가 뜰 수 있도록 DB 연동
    - 메인 화면에 그림자 적용
    - 손쉬운 레이아웃 관리를 위한 jsp 통합
    - 홈페이지 관리 페이지 추가
    - taglib 도입

- 2021.07.08
  - [윤주현]
    - 관리자용 헤더 구현, 회원별 테스트 계정 생성

- 2021.07.07
  - [박소영, 박의진, 박선애, 김가영]
    - 회원가입 기능 구현
  - [윤주현]
    - 모든 Action 클래스에서 상속받을 CustomAction 클래스의 개념을 추가함.(상속을 통해 모든 페이지가 공동으로 execute할 수 있는 역할을 함. 예를들어 Session에 저장할 핵심 정보를 어떤 페이지를 통해 접근하더라도 동일하게 적용할 수 있는 효과를 보일 수 있음. 기존에는 첫 페이지를 MainAction으로 시작해야만 이 모든것이 가능했음.)
    - 로그인에 성공 시 메인페이지로 이동할때 url이 login.kgu에서 main.kgu가 뜰 수 있도록 개선 (깔끔한 URL 정리를 위해 이걸로 대체함)
    - 헤더 디자인 개선 및 탭/페이지 DB 작성
- 2021.07.06
  - [박소영] 회원가입 레이아웃 수정
  - [윤주현]
    - 로그인 기능 활성화(form 방식, sha256 적용), Header에 로그인 정보 태우기
    - 로그아웃 시 발생하는 리다이렉트 문제 해결(Index -> /)
    - Header를 collapse 스타일로 변경, 메인 레이아웃 그리드형식으로 제작, Header 2단으로 분리 및 container 적용, 로그인 버튼 경계면 삭제로 너비 재조정, 정보 페이지 레이아웃 작성 및 페이지 연동, 프로젝트 구조 개선
  - [박의진] 중복확인버튼 수정이랑 생년월일 희망구분 성별 학과, 메인화면 레이아웃 수정
- 2021.07.05
  - [공 동] ERP으로 DB 계획 작성
  - [박선애, 김가영, 박의진, 박소영] 데이터베이스 테이블 생성<user, usertype, major, menu_pages, menu_tabs>
  - [윤주현] header 작성 및 탭 DB 연동, 로그인 관련 로직 제작 (기존 AI 관련 기능 전부 삭제. 버튼 연결은 하지 않음)
  - [박선애, 김가영] 로그인 페이지 레이아웃 작성 및 페이지 연결
  - [박의진, 박소영] 회원가입 레이아웃 작성 및 페이지 연결
- 2021.07.01
  - [윤주현] 연습용 페이지에 Bootstrap Table 예제 넣음
- 2021.06.30
  - [윤주현] 연습용 페이지에 각종 예제 탑재 (데이터 받아오기, 데이터 추가하기, 데이터 삭제하기, get방식으로 임시데이터 주고받기, 부트스트랩 모달페이지, 부트스트랩 탭전환)
- 2021.06.26
  - [윤주현] 연습용 페이지 및 DAO DTO 제작, 마리아 디비 연결
- 2021.06.24
  - [윤주현] 기본 프로젝트 핵심 코드 이식 및 작성, 각종 버전 Update 및 플랫폼 변경 (JavaEE6 -> JavaEE8, mysql -> mariaDB10.5, bootstrap4.0 -> bootstrap5.0), readme 작성, 프로젝트 github에 공개 (교수님 허락 받음.)
- 2021.06.23
  - [전 체] 프로젝트 인수 인계
  
* * *
## Rules of Project development
- 본인이 뭐 했는지 readme에 꼼꼼하게 업데이트 할 것. (문서화 안하면 내년에 시달릴 수 있음. + 추적이 필요함)
- Github 사용 시 Pull 먼저 하기
- 쓸 데 없는 파일 절대로 Push하지 않습니다. 제발!!
- 주석과 Commit 메시지 꼼꼼히 적기
- 변수명은 최대한 자세하게 적기
- 변수를 최대한 글자처리 하기
- 모르거나 막히면 토의 하기
- 일단 수정해보기 (잘 안되면 Rollback 기능으로 되돌리면 됨)
- 🚫 절대로 덤프된 db.sql 공유하지 않기(개인정보 유출 가능성 있음. 추후 서버 컴퓨터로부터 덤프된 sql 사용 시 별도로 관리 요망) 🚫
- 🚫 절대로 학과 로그인 관련 아이디 공유하지 않기(개인정보 유출 가능성 있음. 프로젝트를 위해 임시로 사용하는 db는 괜찮음) 🚫

* * *
## Project Structure

* .idea
  > IntelliJ 관련 설정. 컴퓨터마다 환경이 달라질 수 있습니다.
  > >❌❌❌절대로 Github에 전송하지 마세요.❌❌❌
* lib
  > 자바 프로젝트에서 사용 하는 외부 라이브러리(*.jar)를 모아 놓은 폴더입니다. 특정 클래스를 사용하려면 해당 라이브러리가 필요하며, 추가되는 경우 이 폴더에 등록해줘야 합니다. 최초 클론 시, 인텔리제이에 라이브러리 등록이 필요합니다.
* out
  >  컴파일 시 생성되는 임시 폴더로, 이 폴더를 기반으로 프로그램을 실행하게 됩니다. 예를들어 실행 후, 파일을 첨부하는 경우 이 폴더에 저장이 됩니다. run 할때마다 out 폴더가 새롭게 생성됩니다. WAR파일을 생성하는 경우에도 out폴더에 들어오게됩니다.
  > > ❌❌❌절대로 Github에 전송하지 마세요.❌❌❌
* ### src
  >  Web Server를 담당합니다. Java로 작성합니다.
  * kr.ac.kyonggi.swaig
    * common
      > 이 프로젝트의 뼈대를 잡고 있는 클래스들입니다. 절대로 수정하지 말아주세요.
      > >수정 시 반드시 수정 사유를 공유할 것
      * controller
        > 요청으로 인해 실행되는 클래스인 Controller가 들어있습니다. Tomcat과 직접 통신합니다. 또, Action Interface가 들어있어 Controller를 조금 더 쉽게 다룰 수 있도록 돕습니다.
      * filter
        > UTF-8설정 등을 담당합니다. 모든 페이지가 실행될 때 이 클래스가 영향을 끼치곤 합니다.
      * index
        > 레거시 코드
      * sql
        > sql 로그인을 대신 해주는 Config클래스가 있습니다.
    * handler
      > 이 패키지는 저희가 100% 구현해야하는 부분입니다.
      * action
        > Controller 클래스로부터 실행이 되는 Action 클래스들이 모여있습니다.
        ```java
        //action 코드 예시
        public class TestAction implements Action {
            @Override
            public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
                Gson gson = new Gson();
                request.setAttribute("getSomething", gson.toJson(TestDAO.getInstance().getSomething(1)));
                return "RequestDispatcher:test.jsp";
            }
        }
        ```
      * dao
        > 쿼리문을 직접 작성하는 클래스들 입니다.
        > > DBUtils 라이브러리를 사용하며, mariaDB와 직접 통신합니다.
           ```java
           //DAO클래스 예시
           public class TestDAO {
               public static TestDAO it;
               public static TestDAO getInstance() { //인스턴스 생성
                   if (it == null)
                        it = new TestDAO();
                   return it;
               }
           //테스트 메소드
           public ArrayList<TestDTO> getSomething(int num) {
               ArrayList<TestDTO> result = null;
               List<Map<String, Object>> list = null;
               Connection conn = Config.getInstance().sqlLogin();
               try {
               QueryRunner queryRunner = new QueryRunner();
               list = queryRunner.query(conn, "SELECT * FROM customer WHERE oid=?", new MapListHandler(), num);
               } catch (SQLException e) {
               e.printStackTrace();
               } finally {
               DbUtils.closeQuietly(conn);
               }
               Gson gson = new Gson();
               result = gson.fromJson(gson.toJson(list), new TypeToken<List<TestDTO>>() {
               }.getType());
               return result;
               }
           }
           ```
        * DTO
          > mariaDB로 부터 받은 DB를 자바 클래스에 태우기 위한 클래스입니다.
          > > DB 테이블 하나 당 DTO 한 개가 존재한다고 생각하시면 편합니다.
          ```java
          public class TestDTO {
              private String oid;
              private String name;
              private String phoneNumber;
              public String getOid() {return oid;}
              public void setOid(String oid) {this.oid = oid;}
              public String getName() {return name;}
              public void setName(String name) {this.name = name;}
              public String getPhoneNumber() {return phoneNumber; }
              public void setPhoneNumber(String phoneNumber) {this.phoneNumber = phoneNumber;}
          }
          ```


* ### web
  > View를 담당합니다. JSP로 작성합니다.
  * css
    > JSP에서 사용 할 css를 모아놓은 폴더입니다.
  * js
    > JSP에서 사용 할 js를 모아놓은 폴더입니다.
  * WEB-INF
    * jsp
      > JSP에서 *.kgu 형식으로 된 action클래스를 요청합니다.
      > > *.kgu 형식의 경로는 class.properties에서 찾을 수 있습니다.
      
      > 앞선 Action 클래스에서 정의된 DB를 받아와서 JS로 가공한 후, HTML에 삽입합니다.
      ```html
      //앞선 설정으로 setAttribute 된 자바 변수를 JSP에서 받는 예시 (JQuery와 JSP문법을 사용하여 데이터를 가공한 후, id에 넘겨서 삽입함.)
      <script> 
      $(document).ready(function(){
          makeinfo1();
      })
      function makeinfo1(){
          var data = <%=getSomething%>;
          var list = $('#testDataPrinter');
          var text = '';
          text+= '<div>'+'oid : '+data[0].oid+'/ name : '+data[0].name+'/ phoneNumber : '+data[0].phoneNumber+'</div>';
          list.append(text);
      }
      </script>
      ```
    * lib
      > 웹에서 사용할 라이브러리를 넣습니다.
* * *
## How To Deploy
- 프로젝트 생성 방법 (나중에 비슷한 방법으로 새 프로젝트로 독립하고 싶은 경우 참고)
  > https://leirbag.tistory.com/80
- 프로젝트 실행 방법
  > https://leirbag.tistory.com/81
- mariaDB 설치 방법
  > https://leirbag.tistory.com/46
  - db 적용 방법
    > https://leirbag.tistory.com/47
  - 컴파일러에서 db 오류 발생 시
    > https://leirbag.tistory.com/48
* * *
## How it works
- 메인화면이 뜨기까지의 동작과정
- 로그인
- ㅇㅇ


* * *
## Tools
- IntelliJ Ultimate 2021.1
- Tomcat 9.0.48
  > 현 시점의 Tomcat 10에서는 javax를 지원하지 않아 업데이트하면 안됩니다. server api를 인식하지 못하는 문제가 있음.
- JSP
- MariaDB 10.5
  > mysql과 다르게 대소문자를 확실히 지켜야 합니다.
- DBUtils  
- Java EE8
- Bootstrap 5.0
- JQuery
- Ajax
* * *
## References
- JSP와 Servlet(서블릿) 비교
  > https://m.blog.naver.com/acornedu/221128616501
- Ajax는 왜 필요한가?
  > https://www.youtube.com/watch?v=_Kh5Kdha3Ww
- js, jQuery, Ajax에 관한 설명
  > https://www.nextree.co.kr/p9521/
* * *