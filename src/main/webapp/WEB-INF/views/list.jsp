<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-05-18
  Time: 오후 3:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List</title>
</head>
<body>
    <h2>회원 목록</h2>
    <c:forEach var="Member" items="${memberList}">
        아이디: ${Member.memberId} <br />
        이름:${Member.memberName} 나이:${Member.memberAge} 전화번호:${Member.memberPhone}<br /><br />
    </c:forEach>
</body>
</html>