<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        header {
            background-color: #333;
            color: white;
            padding: 1rem;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin-right: 15px;
            font-weight: bold;
        }

        nav a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 400px;
            margin: 50px auto;
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        input[type="text"],
        input[type="password"],
        button {
            width: 100%;
            padding: 10px;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box; /* ✅ 핵심 포인트 */
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #555;
        }

        .alert {
            color: red;
            margin-top: 10px;
        }

        p {
            text-align: center;
            margin-top: 1rem;
        }

        a {
            color: #007BFF;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<header>
    <nav>
        <a href="/">홈</a>
        <a href="/user/register">회원가입</a>
        <a href="/user/login">로그인</a>
    </nav>
</header>

<div class="container">
    <h2>로그인</h2>
    <form action="/loginCheck" method="post">
        <input type="text" name="username" placeholder="아이디" required>
        <input type="password" name="password" placeholder="비밀번호" required>
        <button type="submit">로그인</button>

        <c:if test="${not empty sessionScope.errorMsg}">
            <div class="alert alert-danger">
                    ${sessionScope.errorMsg}
            </div>
            <%
                // 세션에서 errorMsg 삭제
                session.removeAttribute("errorMsg");
            %>
        </c:if>
    </form>
    <p>계정이 없으신가요? <a href="/user/register">회원가입</a></p>
    <p><a href="/">메인으로 돌아가기</a></p>
</div>

</body>
</html>
