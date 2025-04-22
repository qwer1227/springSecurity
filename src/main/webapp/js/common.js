function checkLogin(username, loginUrl, targetUrl) {
    if (!username) {  // 로그인하지 않은 상태
        var confirmLogin = confirm("로그인 해야 합니다. 로그인 페이지로 이동하시겠습니까?");
        if (confirmLogin) {
            window.location.href = loginUrl;  // 로그인 페이지로 이동
        } else {
            return false;  // 아무런 동작을 하지 않음
        }
    } else {
        window.location.href = targetUrl;  // 게시판 페이지로 이동
    }
}