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
    <h1>Main</h1>
    로그인 회원 정보: ${modelDTO}
    <h3>${modelDTO.memberId}님 환영합니다.</h3>
    <a href="findAll">회원목록 보기</a>
    <a href="/">index로 이동</a>
</body>
</html>
