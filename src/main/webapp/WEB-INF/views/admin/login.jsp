<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>천관보 | 종근당건강 관리자 로그인</title>
    <link rel="shortcut icon" type="image/x-icon" href="/pc/images/favicon.png">
    <link type="text/css" rel="stylesheet" href="/admin/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="/admin/css/all.min.css" />
    <link type="text/css" rel="stylesheet" href="/admin/css/sb-admin.min.css" />
    <link type="text/css" rel="stylesheet" href="/admin/css/admin-login.css" />
    <script type="text/javascript" src="/common/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="/admin/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="/admin/js/jquery.easing.min.js"></script>
    <script type="text/javascript" src="/admin/js/login.js"></script>
</head>
<body>
<body class="bg-dark">
    <div class="container">
        <div class="card card-login mx-auto mt-5">
            <div class="card-header">CheonKwanBo Brand Admin Login</div>
            <div class="card-body">
                <form id="loginForm" method="post" action="/admin/login">
                    <div class="form-group">
                        <div class="form-label-group">
                            <input type="text" id="adminID" name="adminID" class="form-control" placeholder="Email address" required autofocus="autofocus">
                            <label for="adminID">Admin ID</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-label-group">
                            <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required>
                            <label for="inputPassword">Password</label>
                        </div>
                    </div>
                    <div class="form-group warning-alert">
                        <div class="alert alert-danger"></div>
                    </div>
                    <button class="btn btn-primary btn-block" type="submit">Login</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
