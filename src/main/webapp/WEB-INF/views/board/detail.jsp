<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 상세</title>
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
            max-width: 800px;
            margin: 3rem auto;
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 1rem;
            color: #333;
        }

        p {
            font-size: 1rem;
            color: #555;
            line-height: 1.6;
        }

        .post-info {
            margin-bottom: 2rem;
            font-size: 0.9rem;
            color: #777;
        }

        .actions a {
            display: inline-block;
            padding: 10px 20px;
            margin: 0.5rem 0;
            background-color: #555;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        .actions a:hover {
            background-color: #444;
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
    </div>
</header>

<div class="container">
    <h2>${board.title}</h2>
    <div class="post-info">
        <p>작성자: ${board.memberNm}</p>
        <p>작성일: ${board.createdAt}</p>
    </div>
    <p>${board.content}</p>

    <div class="actions">
        <a href="update.jsp?postNo=${board.postNo}">수정</a>
        <a href="/board/list">목록으로</a>
    </div>
</div>

</body>
</html>
