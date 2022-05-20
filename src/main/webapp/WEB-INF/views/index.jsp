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
    <title>index</title>
</head>
<body>
    <h1>Index</h1>
    세션에 담은 memberId: ${sessionScope.loginMemberId}<br />
    세션에 담은 Id: ${sessionScope.loginId}<br />
    <a href="save-form">회원가입 페이지</a><br />
    <a href="login-form">로그인 페이지</a><br />
    <a href="logout">로그아웃</a>
    <a href="findAll">회원 목록</a><br />
    <a href="response-test">responseTest</a><br />
    <a href="response-test2">responseTest2</a><br />
</body>
</html>
