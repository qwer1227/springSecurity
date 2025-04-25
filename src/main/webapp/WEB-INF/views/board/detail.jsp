<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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

        .pagination {
            display: flex;
            justify-content: center; /* 중앙 정렬 */
            align-items: center;
            list-style: none; /* 기본 점 제거 */
            padding-left: 0;
        }

        .pagination .page-item {
            margin: 0 4px; /* 페이지 간격 */
        }

        .pagination .page-link {
            color: #007bff;
            border: 1px solid #dee2e6;
            padding: 6px 12px;
            border-radius: 4px;
            transition: background-color 0.2s ease-in-out;
        }

        .pagination .page-link:hover {
            background-color: #e9ecef;
            text-decoration: none;
        }

        .pagination .page-item.active .page-link {
            background-color: #007bff;
            color: white;
            border-color: #007bff;
        }

        .pagination .page-item.disabled .page-link {
            color: #6c757d;
            pointer-events: none;
            background-color: #fff;
            border-color: #dee2e6;
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
<%--        <c:forEach var="comment" items="${commentList}">--%>
<%--            <div class="comment-item">--%>
<%--                <div class="comment-text">--%>
<%--                    <p>${comment.commentText}</p>--%>
<%--                    <span class="comment-author">${comment.memberNm}</span>--%>
<%--                </div>--%>
<%--                <button class="reply-btn btn btn-secondary" onclick="showReplyForm(${comment.commentNo})">답글 달기</button>--%>

<%--                <!-- 답글 작성 폼 (기본으로 숨기기) -->--%>
<%--                <div class="reply-form" id="reply-form-${comment.commentNo}" style="display:none;">--%>
<%--                    <form action="addReply" method="post">--%>
<%--                        <input type="hidden" name="parentCommentNo" value="${comment.commentNo}">--%>
<%--                        <textarea name="replyText" rows="2" placeholder="답글을 작성하세요..." class="form-control"></textarea>--%>
<%--                        <button type="submit" class="btn btn-primary">답글 작성</button>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
</div>

    <nav aria-label="댓글 페이지 네비게이션">
        <ul class="pagination justify-content-center">
            <!-- 페이지 버튼들이 여기에 들어감 -->
        </ul>
    </nav>

<%--    <!-- Pagination -->--%>
<%--    <nav aria-label="Page navigation example" style="margin-top: 2rem;">--%>
<%--        <ul class="pagination justify-content-center">--%>


<%--            <!-- "이전" 버튼 -->--%>
<%--            <c:if test="${pagination.first}">--%>
<%--                <li class="page-item disabled">--%>
<%--                    <a class="page-link" href="#" aria-label="Previous">--%>
<%--                        <span aria-hidden="true">&laquo;</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </c:if>--%>
<%--            <c:if test="${!pagination.first}">--%>
<%--                <li class="page-item">--%>
<%--                    <a class="page-link"--%>
<%--                       href="?page=${pagination.prevPage}&opt=${param.opt}&keyword=${param.keyword}"--%>
<%--                       aria-label="Previous">--%>
<%--                        <span aria-hidden="true">&laquo;</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </c:if>--%>

<%--            <!-- 페이지 번호 -->--%>
<%--            <c:forEach var="pageNum" begin="${pagination.beginPage}" end="${pagination.endPage}">--%>
<%--                <li class="page-item ${pageNum == pagination.page ? 'active' : ''}">--%>
<%--                    <a class="page-link"--%>
<%--                       href="?page=${pageNum}&opt=${param.opt}&keyword=${param.keyword}">--%>
<%--                            ${pageNum}--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </c:forEach>--%>

<%--            <!-- "다음" 버튼 -->--%>
<%--            <c:if test="${pagination.last}">--%>
<%--                <li class="page-item disabled">--%>
<%--                    <a class="page-link" href="#" aria-label="Next">--%>
<%--                        <span aria-hidden="true">&raquo;</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </c:if>--%>
<%--            <c:if test="${!pagination.last}">--%>
<%--                <li class="page-item">--%>
<%--                    <a class="page-link"--%>
<%--                       href="?page=${pagination.nextPage}&opt=${param.opt}&keyword=${param.keyword}"--%>
<%--                       aria-label="Next">--%>
<%--                        <span aria-hidden="true">&raquo;</span>--%>
<%--                    </a>--%>
<%--                </li>--%>
<%--            </c:if>--%>

<%--        </ul>--%>
<%--    </nav>--%>
</div>
</body>
</html>

<script>

    //편하게쓰기위한
    const postNo = document.getElementById("postNo").value;
    const userNo = document.getElementById("userNo").value;


    document.addEventListener('DOMContentLoaded', function () {
        getCommentList(postNo, 1); // 첫 페이지 댓글 로드
    });


    function showReplyForm(commentNo) {
        var replyForm = document.getElementById('reply-form-' + commentNo);
        if (replyForm.style.display === "none") {
            replyForm.style.display = "block";
        } else {
            replyForm.style.display = "none";
        }
    }

    function getCommentList(postNo, page) {
        axios.get('/comment/list', {params: {postNo, page}})
            .then(response => {
                const {data, paging} = response.data; // 서버 응답 구조에 맞게 조정
                renderCommentList(data);
                renderPagination(paging);
            })
            .catch(err => console.error('댓글 불러오기 오류:', err));
    }

    function renderCommentList(commentList) {
        const commentContainer = document.querySelector('.comment-list');
        commentContainer.innerHTML = ''; // 기존 댓글 초기화

        commentList.forEach(comment => {

            // 댓글 작성 시간 포맷 (예: YYYY-MM-DD HH:MM)
            const formattedDate = new Date(comment.createdDate).toLocaleString();

            // 로그인한 사용자가 작성한 댓글일 경우 삭제/수정 버튼을 표시
            const isUserComment = comment.userNo == userNo;

            let commentHtml = `
             <div class="comment-item" id="comment-\${comment.commentNo}">
            <div class="comment-header">
                <span class="comment-author">\${comment.memberNm}</span>
                <span class="comment-date">\${formattedDate}</span>
            </div>
             <div class="comment-text" id="comment-text-\${comment.commentNo}">
                <p>\${comment.commentText}</p>
            </div>

            <button class="reply-btn btn btn-secondary" onclick="showReplyForm(\${comment.commentNo})">답글 달기</button>

            <!-- 답글 작성 폼 -->
            <div class="reply-form" id="reply-form-\${comment.commentNo}" style="display:none;">
                <form action="addReply" method="post">
                    <input type="hidden" name="parentCommentNo" value="\${comment.commentNo}">
                    <textarea name="replyText" rows="2" placeholder="답글을 작성하세요..." class="form-control"></textarea>
                    <button type="submit" class="btn btn-primary">답글 작성</button>
                </form>
            </div>
        `;

            // 수정/삭제 버튼 추가
            if (isUserComment) {
                commentHtml += `
            <div class="comment-actions">
                <button class="btn btn-warning" id="edit-btn-\${comment.commentNo}" onclick="editComment(\${comment.commentNo})">수정</button>
                <button class="btn btn-danger" onclick="deleteComment(\${comment.commentNo})">삭제</button>
            </div>
            `;
            }

            commentHtml += '</div>'; // comment-item div 닫기

            commentContainer.insertAdjacentHTML('beforeend', commentHtml);
        });
    }

    function renderPagination(pagination) {
        const paginationContainer = document.querySelector('.pagination');
        paginationContainer.innerHTML = ''; // 기존 페이징 초기화

        // 이전 버튼
        const prevBtn = pagination.first
            ? `<li class="page-item disabled"><a class="page-link">&laquo;</a></li>`
            : `<li class="page-item"><a class="page-link" href="#" onclick="getCommentList(postNo, \${pagination.prevPage})">&laquo;</a></li>`;
        paginationContainer.insertAdjacentHTML('beforeend', prevBtn);

        // 페이지 번호들
        for (let i = pagination.beginPage; i <= pagination.endPage; i++) {
            const activeClass = i === pagination.page ? 'active' : '';
            const pageBtn = `
        <li class="page-item \${activeClass}">
            <a class="page-link" href="#" onclick="getCommentList(postNo, \${i})">\${i}</a>
        </li>`;
            paginationContainer.insertAdjacentHTML('beforeend', pageBtn);
        }

        // 다음 버튼
        const nextBtn = pagination.last
            ? `<li class="page-item disabled"><a class="page-link">&raquo;</a></li>`
            : `<li class="page-item"><a class="page-link" href="#" onclick="getCommentList(postNo, \${pagination.nextPage})">&raquo;</a></li>`;
        paginationContainer.insertAdjacentHTML('beforeend', nextBtn);
    }

    function addComment() {

        const commentText = document.getElementById("commentText").value;

        if (!commentText.trim()) {
            alert("댓글 입력");
            return;
        }

        axios.post('/comment/post', {postNo, userNo, commentText})
            .then(() => {
                document.querySelector("#commentText").value = "";
                getCommentList(postNo); //다시부르기 ㅋㅋ
            })
            .catch(err => console.error(err));
    }

    // 수정 버튼 클릭 시 실행될 함수
    function editComment(commentNo) {
        const commentTextElement = document.querySelector(`#comment-text-\${commentNo}`);
        const currentText = commentTextElement.innerText; // 현재 댓글 텍스트 가져오기

        // 댓글 텍스트를 수정할 수 있는 텍스트 입력란으로 변환
        commentTextElement.innerHTML = `<textarea id="edit-text-\${commentNo}" class="form-control">\${currentText}</textarea>`;

        // 수정 버튼을 저장 버튼으로 변경
        const editButton = document.querySelector(`#edit-btn-\${commentNo}`);
        editButton.innerHTML = '저장';
        editButton.setAttribute('onclick', `saveComment(\${commentNo})`);
    }

    // 댓글 수정 후 저장 함수
    function saveComment(commentNo) {
        const newText = document.querySelector(`#edit-text-\${commentNo}`).value;

        axios.post('/comment/update', {newText,postNo,commentNo,userNo})
            .then(() => {
                getCommentList(postNo); //다시부르기 ㅋㅋ
        })
            .catch(err => console.error(err));

    }

    // 댓글 삭제 함수 (예시)
    function deleteComment(commentNo) {
        const newText = document.querySelector(`#comment-text-\${commentNo}`).value;
        // 서버에서 삭제 처리 후 댓글 삭제
        axios.post('/comment/delete', {newText, commentNo,userNo,postNo})
            .then(() => {
                getCommentList(postNo);
        })
            .catch(err => console.error(err))
    }


</script>
