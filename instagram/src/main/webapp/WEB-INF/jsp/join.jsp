<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/egovframework/join.css" />
    <title>Instagram</title>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#btn_idchk").on('click', function() {
                fn_idChk();
            });
        });

        function fn_join() {
            var phone = $("#instaPhone").val();
            var instaId = $("#insta").val();
            var pwd = $("#instaPwd").val();
            var email = $("#email").val();
            var emailAddr = $("#emailAddr").val();

            if (phone == "") {
                alert("휴대폰 번호를 입력하세요.");
                return;
            } else if (instaId == "") {
                alert("사용자 이름을 입력하세요.");
                return;
            } else if (pwd == "") {
                alert("비밀번호를 입력하세요.");
                return;
            } else if (email == "" || emailAddr == "") {
                alert("이메일을 입력하세요.");
                return;
            } else {
                var frm = $("#frm").serialize();
                $.ajax({
                    url: '/member/insertMember.do',
                    method: 'post',
                    data: frm,
                    dataType: 'json',
                    success: function(data) {
                        if (data.resultChk > 0) {
                            alert("회원가입을 축하드립니다!");
                            location.href = "/login.do";
                        } else {
                            alert("회원가입에 실패하였습니다.");
                        }
                    },
                    error: function() {
                        alert("서버 오류가 발생했습니다.");
                    }
                });
            }
        }

        function fn_idChk() {
            var instaId = $("#insta").val();
            if (instaId === "") {
                alert("중복 검사할 사용자 이름을 입력해주세요.");
            } else {
                $.ajax({
                    url: '/member/idChk.do',
                    method: 'post',
                    data: { 'instaId': instaId },
                    dataType: 'json',
                    success: function(data) {
                        if (data.idChk > 0) {
                            alert("이미 등록된 사용자 이름입니다.");
                        } else {
                            alert("사용할 수 있는 사용자 이름입니다.");
                        }
                    },
                    error: function() {
                        alert("서버 오류가 발생했습니다.");
                    }
                });
            }
        }
    </script>
</head>
<body>
    <form id="frm" name="frm">
        <table>
            <tr>
                <td colspan="2"><h2>인스타그램 회원가입</h2></td>
            </tr>
            <tr>
                <td>휴대폰 번호</td>
                <td><input type="text" id="instaPhone" name="instaPhone" required /></td>
            </tr>
            <tr>
                <td>사용자 이름</td>
                <td>
                    <input type="text" id="insta" name="insta" required />
                    <input type="button" id="btn_idchk" value="중복검사" />
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" id="instaPwd" name="instaPwd" required /></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>
                    <input type="text" id="email" name="email" required /> @ 
                    <select id="emailAddr" name="emailAddr" required>
                        <option value="">--주소를 선택해주세요--</option>
                        <option value="naver.com">naver.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="nate.com">nate.com</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="button" onclick="fn_join();">가입하기</button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
