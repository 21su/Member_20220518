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
</head>
<body>
    <h1><a href="index">MAIN</a> </h1>
    <h1>로그인</h1>
    <form action="login" method="post">
        아이디: <input type="text" name="memberId" placeholder="UserName"><br />
        비밀번호: <input type="password" name="memberPassword" placeholder="Password"><br />
        <input type="submit" value="로그인"> <a href="/save-form">회원가입</a>
    </form>
</body>
</html>
