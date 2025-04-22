<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인 기록</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 40px;
            background-color: #f9f9f9;
        }

        h2, h3 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #f0f0f0;
        }

        form {
            margin-top: 30px;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"], input[type="datetime-local"] {
            padding: 8px;
            width: 250px;
        }

        button {
            padding: 8px 16px;
            background-color: #4CAF50;
            border: none;
            color: white;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

    </style>
</head>
<body>

<h2>로그인 기록</h2>

<a href="/">메인으로 돌아가기</a><br>

<button id="loadHistoryBtn">로그인 기록 불러오기</button>
<table id="historyTable">
    <thead>
    <tr>
        <th>ID</th>
        <th>USERNAME</th>
        <th>LOGIN_TIME</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
</table>


<script>
    // 로그인 기록 불러오기
    $("#loadHistoryBtn").click(function () {
        $.ajax({
            url: "/hist/getHistory",
            type: "POST",
            success: function (data) {
                let tbody = $("#historyTable tbody");
                tbody.empty(); // 기존 내용 비움
                data.forEach(row => {
                    tbody.append(
                        `<tr>
                            <td>\${row.id}</td>
                            <td>\${row.username}</td>
                            <td>\${row.login_TIME}</td>
                         </tr>`
                    );
                });
            }
        });
    });

</script>

</body>
</html>
