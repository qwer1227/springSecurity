<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
</head>
<body>
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
    <p>메인으로 돌아가기 <a href="/user/main">메인</a> </p>
</div>
</body>
</html>
