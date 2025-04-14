<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h2>회원가입</h2>
    <form action="/user/insertUser" method="post">
        <input type="text" name="username" placeholder="아이디" required>
        <input type="password" name="password" placeholder="비밀번호" required>
        <input type="password" name="confirmPassword" placeholder="비밀번호 확인" required>
        <button type="submit">회원가입</button>
    </form>
    <c:if test="${not empty errorMsg}">
        <div class="alert alert-danger">
                ${errorMsg}
        </div>
    </c:if>
    <p>이미 계정이 있으신가요? <a href="/user/login">로그인</a></p>
</div>
</body>
</html>