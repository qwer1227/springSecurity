<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 수정</title>
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
            max-width: 900px;
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

        form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        label {
            font-size: 1rem;
            color: #333;
        }

        input[type="text"], textarea {
            padding: 0.8rem;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 100%;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #555;
            color: white;
            padding: 0.8rem 2rem;
            font-size: 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
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
    <h2>글 수정</h2>
    <form action="/board/update" method="post">
        <input type="hidden" name="postNo" value="${board.postNo}">

        <label for="title">제목:</label>
        <input type="text" name="title" id="title" value="${board.title}" required>

        <label for="content">내용:</label>
        <textarea name="content" id="content" rows="10" cols="50" required>${board.content}</textarea>

        <input type="submit" value="수정">
    </form>
</div>

</body>
</html>
