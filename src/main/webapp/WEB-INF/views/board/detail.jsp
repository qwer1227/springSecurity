<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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

        .actions button {
            display: inline-block;
            padding: 10px 20px;
            margin: 0.5rem 0;
            background-color: #555;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .actions button:hover {
            background-color: #444;
        }

        .comments-section {
            margin-top: 2rem;
            border-top: 1px solid #ddd;
            padding-top: 1rem;
        }

        .comment-form textarea {
            width: 100%;
            margin-bottom: 1rem;
            padding: 0.5rem;
            font-size: 1rem;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .comment-actions {
            display: flex;
            justify-content: flex-end;
        }

        .comment-actions button {
            padding: 0.5rem 1rem;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .comment-actions button:hover {
            background-color: #0056b3;
        }

        .comment-list {
            margin-top: 2rem;
        }

        .comment-item {
            margin-bottom: 1rem;
            padding: 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f9f9f9;
        }

        .comment-item .comment-text {
            margin-bottom: 1rem;
        }

        .comment-item .reply-btn {
            background-color: #6c757d;
            color: white;
            border: none;
            padding: 0.3rem 1rem;
            border-radius: 4px;
            cursor: pointer;
        }

        .comment-item .reply-btn:hover {
            background-color: #5a6268;
        }

        .reply-form {
            margin-top: 1rem;
        }

        .reply-form textarea {
            width: 100%;
            margin-bottom: 1rem;
            padding: 0.5rem;
            font-size: 1rem;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .reply-form button {
            padding: 0.5rem 1rem;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .reply-form button:hover {
            background-color: #218838;
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

    <c:set var="loginUser" value="${sessionScope.user}" />

    <div class="actions">
        <c:if test="${board.memberNo == loginUser}">
        <a href="update?postNo=${board.postNo}">수정</a>
        <form action="delete" method="post">
            <input type="hidden" name="postNo" value="${board.postNo}">
            <button type="submit">삭제</button>
        </form>
        </c:if>
        <a href="/board/list">목록으로</a>
    </div>
</div>
<div class="comments-section">
    <h3>댓글</h3>

    <!-- 댓글 작성 입력란 -->
    <div class="comment-form">
        <input type="hidden" id="postNo" name="postNo" value="${board.postNo}">
        <input type="hidden" id="userNo" name="userNo" value="${sessionScope.user}">
        <textarea id="commentText" name="commentText" rows="4" placeholder="댓글을 작성하세요..." class="form-control"></textarea>
        <div class="comment-actions">
            <button onclick="addComment()" class="btn btn-primary" >댓글 작성</button>
        </div>
    </div>



    <!-- 댓글 목록 -->
    <div class="comment-list">
        <c:forEach var="comment" items="${commentList}">
            <div class="comment-item">
                <div class="comment-text">
                    <p>${comment.commentText}</p>
                    <span class="comment-author">${comment.memberNm}</span>
                </div>
                <button class="reply-btn btn btn-secondary" onclick="showReplyForm(${comment.commentNo})">답글 달기</button>

                <!-- 답글 작성 폼 (기본으로 숨기기) -->
                <div class="reply-form" id="reply-form-${comment.commentNo}" style="display:none;">
                    <form action="addReply" method="post">
                        <input type="hidden" name="parentCommentNo" value="${comment.commentNo}">
                        <textarea name="replyText" rows="2" placeholder="답글을 작성하세요..." class="form-control"></textarea>
                        <button type="submit" class="btn btn-primary">답글 작성</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>

<script>

    //편하게쓰기위한
    const postNo = document.getElementById("postNo").value;
    const userNo = document.getElementById("userNo").value;


    function showReplyForm(commentNo) {
        var replyForm = document.getElementById('reply-form-' + commentNo);
        if (replyForm.style.display === "none") {
            replyForm.style.display = "block";
        } else {
            replyForm.style.display = "none";
        }
    }

    function getCommentList(postNo) {
        axios.get('/comment/list', { params: { postNo } })
            .then(response => {
                const commentList = response.data;
                const commentContainer = document.querySelector('.comment-list');
                commentContainer.innerHTML = ''; // 기존 댓글 제거

                commentList.forEach(comment => {
                    const commentHtml = `
                    <div class="comment-item">
                        <div class="comment-text">
                            <p>\${comment.commentText}</p>
                            <span class="comment-author">\${comment.memberNm}</span>
                        </div>
                        <button class="reply-btn" onclick="showReplyForm(\${comment.commentNo})">답글 달기</button>
                        <div class="reply-form" id="reply-form-\${comment.commentNo}" style="display:none;">
                            <form action="addReply" method="post">
                                <input type="hidden" name="parentCommentNo" value="\${comment.commentNo}">
                                <textarea name="replyText" rows="2" placeholder="답글을 작성하세요..."></textarea>
                                <button type="submit">답글 작성</button>
                            </form>
                        </div>
                    </div>
                `;
                    commentContainer.insertAdjacentHTML('beforeend', commentHtml);
                });
            })
            .catch(err => console.error('댓글 불러오기 오류:', err));
    }

    function addComment(){

        const commentText = document.getElementById("commentText").value;

        if(!commentText.trim()){
            alert("댓글 입력");
            return;
        }

        axios.post('/comment/post',{postNo,userNo,commentText})
            .then(() => {
                document.querySelector("#commentText").value ="";
                getCommentList(postNo); //다시부르기 ㅋㅋ
            })
            .catch(err => console.error(err));
    }


</script>
