<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-18
  Time: 오후 3:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <script src="/resources/js/jquery.js"></script>
    <script>
        function idchek(){
            const memberId = document.getElementById("username").value;
            const idchek = document.getElementById("idchek");
            const exp = /^[a-z]+[a-z0-9]{5,19}$/g;
            $.ajax({
               type: "post", // http requesu method
                url: "duplicate-check", // 요청주소
                data: {"memberId": memberId}, //전송하는 파라미터
                dataType: "text", // 리턴받을 데이터 형식
                success: function (result){
                   if(result == "ok"){
                       if(memberId==""){
                           idchek.innerHTML = "필수입력입니다.";
                           idchek.style.color = "red";
                       }
                       else if(memberId.match(exp)){
                           idchek.innerHTML = "사용가능한 아이디입니다.";
                           idchek.style.color = "green";
                       }else{
                           idchek.innerHTML = "영문자로 시작하는 영문자 또는 숫자 6~20자 ";
                           idchek.style.color = "red";
                       }
                   }else{
                       idchek.innerHTML = "사용 불가능한 아이디입니다.";
                       idchek.style.color = "red";
                   }
                },
                error: function (){
                   alert("오타체크");
                }
            });
        }
        function passwordchek(){
            const password = document.getElementById("password").value;
            const exp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
            if(password== ""){
                document.getElementById("passchek").innerHTML = "필수입력입니다";
                document.getElementById("passchek").style.color = "red";
            }
            else if(password.match(exp)){
                document.getElementById("passchek").innerHTML = "사용가능한 비밀번호입니다.";
                document.getElementById("passchek").style.color = "green";
            }else{
                document.getElementById("passchek").innerHTML = "8 ~ 16자 영문, 숫자 조합";
                document.getElementById("passchek").style.color = "red";
            }
        }
        function numberchek(){
            const number = document.getElementById("number").value;
            const exp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
            if(number == ""){
                document.getElementById("numberchek").innerHTML = "필수 정보입니다.";
                document.getElementById("numberchek").style.color = "red";
            }
            else if(number.match(exp)){
                document.getElementById("numberchek").innerHTML = "확인되었습니다.";
                document.getElementById("numberchek").style.color = "green";
            }else{
                document.getElementById("numberchek").innerHTML = "000-0000-0000";
                document.getElementById("numberchek").style.color = "red";
            }
        }

    </script>
    <style>
        .chk{
            font-size: 5px;
        }
    </style>
</head>
<body>
<h1><a href="/">MAIN</a> </h1>
    <h1>회원가입</h1>
    <form action="save" method="post">
        아이디: <input type="text" onblur="idchek()" id="username" name="memberId" placeholder="Id"> <br />
        <p id="idchek" class="chk"></p>
        비밀번호: <input type="password" onblur="passwordchek()" id="password" name="memberPassword" placeholder="Pw"> <br />
        <p id="passchek" class="chk"></p>
        이름: <input type="text" name="memberName" placeholder="Name"> <br />
        나이: <input type="text" name="memberAge" placeholder="Age(00)"> <br />
        전화번호: <input type="text" id="number" onblur="numberchek()" name="memberPhone" placeholder="000-0000-0000"> <br />
        <p id="numberchek" class="chk"></p>
        <input type="submit" value="전송"> <br />
        <p style="color:red">${logMs}</p>

    </form>
</body>
</html>
