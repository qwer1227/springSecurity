<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="container">
    <h2>로그인</h2>
    <form action="/login" method="post">
        <input type="email" name="email" placeholder="이메일" required>
        <input type="password" name="password" placeholder="비밀번호" required>
        <button type="submit">로그인</button>
    </form>
    <p>계정이 없으신가요? <a href="signup.jsp">회원가입</a></p>
</div>
</body>
</html>
