<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <script src="/js/common.js"></script>
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f7f7f7;
            color: #333;
        }

        td a {
            text-decoration: none;
            color: #007bff;
        }

        td a:hover {
            text-decoration: underline;
        }

        .write-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #555;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 1rem;
        }

        .write-btn:hover {
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
        <a href="#" onclick="checkLogin('<%=(String)session.getAttribute("username")%>', '/user/login', '/board/list')">게시판</a>
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
    <h2>게시판 목록</h2>
    <a href="/board/write" class="write-btn">글쓰기</a>

    <table>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        <c:forEach var="post" items="${boardList}">
            <tr>
                <td>${post.postNo}</td>
                <td><a href="detail?postNo=${post.postNo}">${post.title}</a></td>
                <td>${post.memberNm}</td>
                <td>${post.createdAt}</td>
            </tr>
        </c:forEach>
    </table>

    <!-- Pagination -->
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">

            <!-- "이전" 버튼 -->
            <c:if test="${pagination.first}">
                <li class="page-item disabled">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:if test="${!pagination.first}">
                <li class="page-item">
                    <a class="page-link"
                       href="?page=${pagination.prevPage}&opt=${param.opt}&keyword=${param.keyword}"
                       aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>

            <!-- 페이지 번호 -->
            <c:forEach var="pageNum" begin="${pagination.beginPage}" end="${pagination.endPage}">
                <li class="page-item ${pageNum == pagination.page ? 'active' : ''}">
                    <a class="page-link"
                       href="?page=${pageNum}&opt=${param.opt}&keyword=${param.keyword}">
                            ${pageNum}
                    </a>
                </li>
            </c:forEach>

            <!-- "다음" 버튼 -->
            <c:if test="${pagination.last}">
                <li class="page-item disabled">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
            <c:if test="${!pagination.last}">
                <li class="page-item">
                    <a class="page-link"
                       href="?page=${pagination.nextPage}&opt=${param.opt}&keyword=${param.keyword}"
                       aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>

        </ul>
    </nav>
</div>
</body>
</html>
