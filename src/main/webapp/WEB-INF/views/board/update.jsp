<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>글 수정</title></head>
<body>
<h2>글 수정</h2>
<form action="update.do" method="post">
    <input type="hidden" name="postNo" value="${post.postNo}">
    제목: <input type="text" name="title" value="${post.title}"><br>
    내용:<br>
    <textarea name="content" rows="10" cols="50">${post.content}</textarea><br>
    <input type="submit" value="수정">
</form>
</body>
</html>
