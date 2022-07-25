<%--
  Created by IntelliJ IDEA.
  User: wooris
  Date: 2021-07-05
  Time: 오후 6:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String img_login_logo = "img/cs_logo.png";
    String main_url = "main.kgu";
    String getAllMajor = (String) request.getAttribute("getAllMajor");
    String getAllType = (String) request.getAttribute("getAllType");
%>
<html>
<head>
    <meta name="viewport"
          content="width=device-width, height=device-height, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0">
    <%--    Bootstrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <%--    jQuery--%>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <%--    Bootstrap Table--%>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.css">
    <script src="https://unpkg.com/bootstrap-table@1.18.3/dist/bootstrap-table.min.js"></script>
    <script src='js/sha256.js'></script>
</head>
<body class="bg-light ">
<div class="">
    <div class="w-100 d-block py-5 m-auto" tabindex="-1">
        <div class="modal-dialog" role="document">
            <div class="modal-content shadow" style="border-radius: 30px;">
                <div class="modal-header p-5 pb-4 border-bottom-0">
                    <!-- <h5 class="modal-title">Modal title</h5> -->
                    <h2 class="fw-bold mb-0">회원가입</h2>
                    <button type="button" class="btn-close" onclick="window.location.href='main.kgu';"></button>
                </div>

                <div class="modal-body p-5 pt-0">
                    <div class="row justify-content-md-center">
                        <div class="text-center">
                                <div class="my-5">
                                    <div class="my-2">
                                        <img class="img-fluid w-50" onclick="window.location.href='main.kgu';"
                                             src="/img/logo/kgu_logo(500x300).png"/>
                                    </div>
                                    <div>
                                        <h4 class="fw-bold ">경기대학교 SWAIG</h4>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <a href="#" class="btn btn-outline-primary" onclick="registerInit()">경기인 회원가입</a>
                                    </div>
                                    <div class="col">
                                        <a href="#" class="btn btn-outline-primary" onclick="registerReset()">외부인 회원가입</a>
                                    </div>
                                </div>
                        </div>
                    </div>
                    <hr class="my-5"/>
                    <div class="row justify-content-md-center" id="registerReset"><!--class="row g-5"-->
                        <h4 class="mb-3">회원가입(경기인)</h4>
                        <div class="">
                            <div class="needs-validation" novalidate>
                                <div class="row g-3">
                                    <div class="col-12">
                                        <div class="">
                                            <label for="id" class="form-label">학번(교번)</label><span id="warningID"></span>
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control" id="id"
                                                       placeholder="학번이나 교번을 입력해주세요."
                                                       value="" required>
                                                <button class="btn btn-outline-primary" onclick="checkID()">중복확인
                                                </button>
                                            </div>
                                        </div>
                                        <div class="invalid-feedback">
                                            학번을 입력해 주세요.
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="pwd"
                                               class="form-label">비밀번호<span> (가능한 특수문자: !,@,#,$,%,^,&,*,(,) )</span></label>
                                        <div class="input-group has-validation">
                                            <input type="password" class="form-control" id="pwd"
                                                   placeholder="8 글자 이상으로 해주세요."
                                                   required>
                                            <div class="invalid-feedback">
                                                비밀번호를 입력해주세요
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label for="pwdCheck" class="form-label">비밀번호 확인</label><span
                                            id="warningPwd"></span>
                                        <div class="input-group has-validation">
                                            <input type="password" class="form-control" id="pwdCheck"
                                                   onkeyup="checkPassword()"
                                                   placeholder="똑같이 입력해주세요." required>
                                            <div class="invalid-feedback">
                                                비밀번호를 확인해 주세요.
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="name" class="form-label">이름</label>
                                        <input type="email" class="form-control" id="name" placeholder="이름을 입력해주세요">
                                        <div class="invalid-feedback">
                                            이름을 입력해주세요
                                        </div>
                                    </div>
                                    <%--<h4 class="mb-3">성별</h4> --%>

                                    <div class="my-3">
                                        <label for="gender" class="form-label">성별</label>
                                        <div id="gender">
                                            <div class="form-check">
                                                <input id="male" name="gender" type="radio" class="form-check-input"
                                                       value="남"
                                                       checked required>
                                                <label class="form-check-label" for="male">남</label>
                                            </div>
                                            <div class="form-check">
                                                <input id="female" name="gender" type="radio" class="form-check-input"
                                                       value="여"
                                                       required>
                                                <label class="form-check-label" for="female">여</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label for="birth">생년월일<span> (비밀번호 초기시 생년월일로 초기화됩니다.)</span></label>
                                        <div class="form-floating mb-3">
                                            <input type="date" class="form-control" id="birth" placeholder="date">
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="email" class="form-label">E-mail</label>
                                        <input type="email" class="form-control" id="email" placeholder="이메일을 입력해주세요.">
                                        <div class="invalid-feedback">
                                            이메일을 입력해주세요.
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="phone" class="form-label">전화번호</label>
                                        <input type="text" class="form-control" id="phone" placeholder="-포함해서 적어주세요."
                                               required>
                                        <div class="invalid-feedback">
                                            전화번호를 입력해주세요.
                                        </div>
                                    </div>

                                    <div class="col-md-8">
                                        <label for="hope_type"
                                               class="form-label">희망구분<span> (관리자 승인후 변경됩니다.)</span></label>
                                        <select class="form-select" id="hope_type" required></select>
                                        <div class="invalid-feedback">
                                            희망구분을 선택해 주세요.
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <label for="major" class="form-label">학과</label>
                                        <select class="form-select" id="major" required></select>
                                        <div class="invalid-feedback">
                                            학과를 선택해 주세요
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-4">
                                <div class="w-100 btn btn-primary btn-lg" type="submit" onclick="LetsRegisterBig()">
                                    가입하기
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<br>
</body>
</html>
<script>

    $(document).ready(function () {
        makeTypeList();
        makeMajorList();
    })

    function makeMajorList() {
        var major = $('#major');
        var majorList =<%=getAllMajor%>;
        var text = '';
        for (var i = 0; i < majorList.length; i++) {
            text += '<option>' + majorList[i].major_name + '</option>';
        }
        text += '<option>기타</option>';
        major.append(text);
    }

    function makeTypeList() {
        var type = $('#hope_type');
        var typeList =<%=getAllType%>;
        var text = '';
        for (var i = 0; i < typeList.length; i++) {
            text += '<option>' + typeList[i].type_name + '</option>';
        }
        type.append(text);
    }
</script>

<script>
    var ischeckID = 0;
    var ischeckPassword = 0;
    var isSafePassword = 0;
    var pattern = [];
    var pattern1 = '0123456789';
    pattern2 = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    pattern3 = '!@#$%^&*()';
    pattern.push(pattern1);
    pattern.push(pattern2);
    pattern.push(pattern3);

    function checkPattern(password) { //
        isSafePassword = 0;
        var isOK1 = 0;
        var isOK2 = 0;
        var isOK3 = 0;
        for (var i = 0; i < password.length; ++i) {
            if (pattern[0].indexOf(password[i]) >= 0)
                isOK1 = 1;
            if (pattern[1].indexOf(password[i]) >= 0)
                isOK2 = 1;
            if (pattern[2].indexOf(password[i]) >= 0)
                isOK3 = 1;
        }
        if (isOK1 == 1 && isOK2 == 1 && isOK3 == 1)
            isSafePassword = 1;
    }

    function checkID() { //중북확인
        var id = $('#id').val();
        $.ajax({
            url: "ajax.kgu",
            type: "post",
            data: {
                req: "checkId",
                data: id
            },
            success: function (data) {
                var result = data;
                if (data == 'dup') {
                    ischeckID = 0;
                    $('#warningID').html('*중복된 ID입니다');
                    $('#warningID').css('color', 'red');
                    $('#warningID').css('font-size', '11px');
                    $('#warningID').css('margin-left', '10px');

                } else {
                    ischeckID = 1;
                    $('#warningID').html('*사용가능한 ID입니다');
                    $('#warningID').css('color', 'blue');
                    $('#warningID').css('font-size', '11px');
                    $('#warningID').css('margin-left', '10px');
                }
            }
        })
    }

    function checkPassword() {
        checkPattern($('#pwd').val());
        if ($('#pwd').val().length < 8 || isSafePassword != 1) {
            ischeckPassword = 0;
            $('#warningPwd').html('8자 이상, 영문과 숫자, 특수문자의 조합');
            $('#warningPwd').css('color', 'red');
            $('#warningPwd').css('font-size', '11px');
            $('#warningPwd').css('margin-left', '10px');
        } else if ($('#pwd').val() == $('#pwdCheck').val()) {
            ischeckPassword = 1;
            $('#warningPwd').html('비밀번호가 일치합니다');
            $('#warningPwd').css('color', 'blue');
            $('#warningPwd').css('font-size', '11px');
            $('#warningPwd').css('margin-left', '10px');
        } else {
            ischeckPassword = 2;
            $('#warningPwd').html('비밀번호가 일치하지 않습니다');
            $('#warningPwd').css('color', 'red');
            $('#warningPwd').css('font-size', '11px');
            $('#warningPwd').css('margin-left', '10px');
        }
    }

    function LetsRegisterBig() {
        if (ischeckID == 1) {
            if (ischeckPassword == 1) {
                var id = $('#id').val();
                var password = $('#pwd').val();
                var forsha = id + password;
                var name = $('#name').val();
                var gender = $('input[name=gender]:checked').val();
                var birth = $('#birth').val();
                var email = $('#email').val();
                var phone = $('#phone').val();
                var hopetype = $('#hope_type').val();
                var major = $('#major').val();
                var perID = id;

                if (name != '' && gender != '' && birth != '' && email != '' && phone != '') {
                    var update = id + "-/-/-" + SHA256(forsha) + "-/-/-" + name + "-/-/-" + gender + "-/-/-" + birth + "-/-/-" + hopetype + "-/-/-" +
                        email + "-/-/-" + phone + "-/-/-" + major + "-/-/-" + perID;
                    $.ajax({
                        url: "ajax.kgu",
                        type: "post",
                        data: {
                            req: "registerBig",
                            data: update
                        },
                        success: function (data) {
                            if (data == 'success') {
                                alert("회원가입 성공");
                                window.location.href = "loginPage.kgu";

                            } else
                                alert('SERVER ERROR, Please try again later');
                        }
                    })
                } else {
                    alert("빈칸을 채워주세요");
                }
            } else {
                if (ischeckPassword == 0)
                    alert("8자 이상으로 영문,숫자,특수문자를 모두 사용하여 입력해주세요.")
                else
                    alert("비밀번호를 일치시켜주세요.");
            }
        } else
            alert("아이디 중복확인을 해주세요");
    }

    function LetsRegisterSmall() {
        if (ischeckID == 1) {
            if (ischeckPassword == 1) {
                var id = $('#id').val();
                var password = $('#pwd').val();
                var forsha = id + password;
                var name = $('#name').val();
                var gender = $('input[name=gender]:checked').val();
                var birth = $('#birth').val();
                var email = $('#email').val();
                var phone = $('#phone').val();
                var hopetype = $('#hope_type').val();
                if (name != '' && gender != '' && birth != '' && email != '' && phone != '') {
                    var update = id + "-/-/-" + SHA256(forsha) + "-/-/-" + name + "-/-/-" + gender + "-/-/-" + birth + "-/-/-" + hopetype + "-/-/-" + email + "-/-/-" + phone;
                    $.ajax({
                        url: "ajax.kgu",
                        type: "post",
                        data: {
                            req: "registerSmall",
                            data: update
                        },
                        success: function (data) {
                            if (data == "success") {
                                alert("회원가입 성공");
                                window.location.href = "loginPage.kgu";
                            } else {
                                alert('SERVER ERROR, Please try again later');
                            }
                        }
                    })
                } else {
                    alert("빈칸을 채워주세요");
                }
            } else {
                alert("비밀번호를 일치시켜주세요.");
            }
        } else
            alert("아이디 중복확인을 해주세요");
    }

    function registerReset() {
        var list = $('#registerReset');
        var text = '';
        text += '<div class="row justify-content-md-center"  id="registerReset">'
            + '<div class="" > <h4 class="mb-3">외부인</h4>'
            + '<div class="needs-validation" novalidate> <div class="row g-3">'
            + '<div class="">'
            + '<label for="id" class="form-label">아이디</label><span id="warningID"></span>'
            + '<div class="row align-items-md-stretch"><div class="col-8">'
            + '<input type="text" class="form-control" id="id" placeholder="아이디를 입력해주세요." value="" required>'
            + '</div><div class="col-4"> <div class="btn btn-primary" onclick="checkID()">중복확인</div> </div> </div> <div class="invalid-feedback">아이디를 입력해 주세요. </div> </div>'
            + '<div class="col-12"> <label for="pwd" class="form-label">비밀번호<span > (가능한 특수문자: !,@,#,$,%,^,&,*,(,) )</span></label>'
            + '<div class="input-group has-validation"><input type="password" class="form-control" id="pwd" placeholder="8 글자 이상으로 해주세요." required>'
            + '<div class="invalid-feedback">비밀번호를 입력해주세요</div></div></div><div class="col-12">'
            + '<label for="pwdCheck" class="form-label">비밀번호 확인</label><span id="warningPwd"></span><div class="input-group has-validation">'
            + '<input type="password" class="form-control" id="pwdCheck" onkeyup="checkPassword()" placeholder="똑같이 입력해주세요." required>'
            + '<div class="invalid-feedback">비밀번호를 확인해 주세요. </div> </div> </div> <div class="col-12"> <label for="name" class="form-label">이름</label>'
            + '<input type="email" class="form-control" id="name" placeholder="이름을 입력해주세요"> <div class="invalid-feedback">이름을 입력해주세요 </div> </div>'
            + '<div class="my-3"><label for="gender" class="form-label">성별</label><div id="gender"><div class="form-check">'
            + '<input id="male" name="gender" type="radio" class="form-check-input" value="남" checked required><label class="form-check-label" for="male">남</label>'
            + '</div> <div class="form-check"> <input id="female" name="gender" type="radio" class="form-check-input" value="여" required> <label class="form-check-label" for="female">여</label> </div> </div> </div>'
            + '<div class="col-12"><label for="birth">생년월일<span> (비밀번호 초기시 생년월일로 초기화됩니다.)</span></label><div class="form-floating mb-3">'
            + '<input type="date" class="form-control" id="birth" placeholder="date"></div></div><div class="col-12"><label for="email" class="form-label">E-mail</label>'
            + '<input type="email" class="form-control" id="email" placeholder="이메일을 입력해주세요."><div class="invalid-feedback">이메일을 입력해주세요.</div></div><div class="col-12">'
            + '<label for="phone" class="form-label">전화번호</label><input type="text" class="form-control" id="phone" placeholder="-포함해서 적어주세요." required><div class="invalid-feedback">전화번호를 입력해주세요.</div></div>'
            + '<div class="col-md-12"> <label for="hope_type" class="form-label">희망구분<span> (관리자 승인후 변경됩니다.)</span></label> <select class="form-select" id="hope_type" required> <option value="학부모">학부모</option> <option>기타</option>'
            + ' </select> <div class="invalid-feedback">희망구분을 선택해 주세요. </div> </div> </div> <hr class ="my-4"> <div class="w-100 btn btn-primary btn-lg" type="submit" onclick="LetsRegisterSmall()">가입하기</div></div>'
            + ' </div> </div>';
        list.html(text);// 외부인,경기대 선택시 내용이 바뀜
    }

    function registerInit() {
        window.location.href = "register.kgu";
    }
</script>