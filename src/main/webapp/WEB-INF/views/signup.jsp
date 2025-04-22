<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <style>
        body {
            margin: 0;
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f5f5f5;
        }

        header {
            background-color: #333;
            color: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .nav-links a {
            color: white;
            margin-left: 1rem;
            text-decoration: none;
        }

        .container {
            max-width: 400px;
            margin: 3rem auto;
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 2rem;
            color: #333;
        }

        input[type="text"],
        input[type="password"],
        button {
            width: 100%;
            padding: 10px;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #555;
            color: white;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #444;
        }

        .alert-danger {
            color: red;
            margin-top: -10px;
            margin-bottom: 1rem;
        }

        p {
            text-align: center;
        }

        a {
            color: #555;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<header>
    <div>
        <a href="/" style="color:white; font-weight:bold; text-decoration: none;">MySite</a>
    </div>
    <div class="nav-links">
        <a href="/board/list">게시판</a>
        <c:choose>
            <c:when test="${empty username}">
                <a href="/user/login">로그인</a>
            </c:when>
            <c:otherwise>
                <a href="/user/logout">로그아웃</a>
                <a>환영합니다, ${username}</a>
            </c:otherwise>
        </c:choose>
        <sec:authorize access="hasRole('ADMIN')">
            <a href="/hist/loginHistory">로그인 이력</a>
        </sec:authorize>
    </div>
</header>

<div class="container">
    <h2>회원가입</h2>
    <form action="/user/insertUser" method="post">
        <input type="text" name="username" placeholder="아이디" required>
        <input type="password" name="password" placeholder="비밀번호" required>
        <input type="password" name="confirmPassword" placeholder="비밀번호 확인" required>
        <button type="submit">회원가입</button>
    </form>

    <c:if test="${not empty errorMsg}">
        <div class="alert-danger">${errorMsg}</div>
    </c:if>

    <p>이미 계정이 있으신가요? <a href="/user/login">로그인</a></p>
</div>

</body>
</html>
