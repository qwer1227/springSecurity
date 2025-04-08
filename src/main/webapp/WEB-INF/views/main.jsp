<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
</head>
<body>
<div class="container">
    <H2>메인</H2>
    <c:choose>
        <c:when test="${empty username}">
            <a href="/user/login">로그인</a>
        </c:when>
        <c:otherwise>
            <a href="/user/logout">로그아웃</a>
            <a>환영합니다. ${username}</a>
        </c:otherwise>
    </c:choose>
    <a href="/hist/loginHistory">로그인 이력보기</a>
</div>
</body>
</html>
