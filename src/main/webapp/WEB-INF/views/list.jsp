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
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <script src="/resources/js/jquery.js"></script>
    <script>
        function findDetail(id){
            console.log(id)
            $.ajax({
                type: "post", // http requesu method
                url: "find-detail", // 요청주소
                data: {"id": id}, //전송하는 파라미터
                dataType: "json", // 리턴받을 데이터 형식
                success: function (result) {
                    let ld = "<table class='table table-striped'>" + "<tr>" +
                        "<th>Id</th><th>memberId</th><th>memberPassword</th> <th>memberName</th> <th>memberAge</th> <th>memberPhone</th>" + "</tr>";
                    ld += "<tr>" +
                        "<td>"+result.Id+"</td>" +
                        "<td>"+result.memberId+"</td>"+
                        "<td>"+result.memberPassword+"</td>"+
                        "<td>"+result.memberName+"</td>"+
                        "<td>"+result.memberAge+"</td>"+
                        "<td>"+result.memberPhone+"</td>";

                    document.getElementById("detail").innerHTML = ld;
                }
            });
        }
    </script>
</head>
<body>
    <h2>회원 목록</h2>
    <table class="table table-striped">
        <tr>
            <th>Id</th>
            <th>memberId</th>
            <th>memberName</th>
            <th>memberAge</th>
            <th>memberPhone</th>
            <th>조회</th>
            <th>삭제</th>
            <th>상세조회</th>
        </tr>
        <c:forEach var="Member" items="${memberList}">
            <tr>
                <td>${Member.id}</td>
                <td>${Member.memberId}</td>
                <td>${Member.memberName}</td>
                <td>${Member.memberAge}</td>
                <td>${Member.memberPhone}</td>
                <td><a href="/detail?id=${Member.id}">조회</a> </td>
                <%-- 클릭한 회원의 정보를 DB에서 가져와서 detail.jsp에 출력 --%>
                <td><a href="delete?id=${Member.id}">삭제</a></td>
                <td><button onclick="findDetail('${Member.id}')">상세조회</button></td>
            </tr>
        </c:forEach>
    </table>
    <p id="detail"></p>
</body>
</html>
