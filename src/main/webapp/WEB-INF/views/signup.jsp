<%@ page contentType="text/html; charset=UTF-8" %>
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
    <form action="/signup" method="post">
        <input type="email" name="email" placeholder="이메일" required>
        <input type="password" name="password" placeholder="비밀번호" required>
        <input type="password" name="confirmPassword" placeholder="비밀번호 확인" required>
        <button type="submit">회원가입</button>
    </form>
    <p>이미 계정이 있으신가요? <a href="login.jsp">로그인</a></p>
</div>
</body>
</html>