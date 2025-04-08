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
<%--        <c:if test="${not empty sessionScope.errorMsg}">--%>
<%--            <script>--%>
<%--                alert("${sessionScope.errorMsg}");--%>
<%--            </script>--%>
<%--            <c:remove var="errorMsg" scope="session"/>--%>
<%--        </c:if>--%>
        <c:if test="${not empty param.error and param.error ne ''}">
            <script>
                alert("${param.error}");
            </script>
        </c:if>
    </form>
    <p>계정이 없으신가요? <a href="/user/register">회원가입</a></p>
</div>
</body>
</html>
