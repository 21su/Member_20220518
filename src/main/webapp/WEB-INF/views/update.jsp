<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-20
  Time: 오전 10:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script>
        const update = () =>{
            console.log("update 함수호출");
            const pwConfirm = document.getElementById("pwDonfirm").value;
            const pwDB = '${updateDTO.memberPassword}';
            console.log("pwConfirm : " +pwConfirm +" pwDB: " + pwDB)
            if (pwConfirm == pwDB){
                updateForm.submit(); // 해당 폼을 submit으로 하는 js 함수
            }else{
                alert("비밀번호가 틀립니다.")
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>update.jsp</h1>
            <form action="/update" method="post" name="updateForm">
            회원번호: <input class="form-control mb-2" type="text" name="id" value="${updateDTO.id}" readonly><br />
            아이디: <input class="form-control mb-2" type="text" name="memberId" value="${updateDTO.memberId}" readonly><br />
            비밀번호: <input class="form-control mb-2" type="password" name="memberPassword" id="pwDonfirm"><br />
            이름: <input class="form-control mb-2" type="text" name="memberName" value="${updateDTO.memberName}" readonly><br />
            나이: <input class="form-control mb-2" type="text" name="memberAge" value="${updateDTO.memberAge}" readonly><br />
            전화번호: <input class="form-control mb-2" type="text" name="memberPhone" value="${updateDTO.memberPhone}"><br />
            <input class="btn btn-primary" type="button" onclick="update()" value="정보수정">
        </form>
    </div>
</body>
</html>
