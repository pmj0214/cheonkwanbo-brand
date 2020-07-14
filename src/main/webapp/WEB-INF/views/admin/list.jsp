<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>천관보 | 종근당건강</title>
    <link rel="shortcut icon" type="image/x-icon" href="/pc/images/favicon.png">
    <link type="text/css" rel="stylesheet" href="/admin/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="/admin/css/dataTables.bootstrap4.css" />
    <link type="text/css" rel="stylesheet" href="/admin/css/all.min.css" />
    <link type="text/css" rel="stylesheet" href="/admin/css/sb-admin.min.css" />
    <link type="text/css" rel="stylesheet" href="/admin/css/admin-list.css" />
    <link rel="stylesheet" href="/admin/css/bootstrap-datetimepicker.min.css">
    <script type="text/javascript" src="/common/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="/admin/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="/admin/js/jquery.easing.min.js"></script>
    <script type="text/javascript" src="/admin/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="/admin/js/dataTables.bootstrap4.js"></script>
    <script type="text/javascript" src="/admin/js/sb-admin.min.js"></script>
    <script type="text/javascript" src="/admin/js/moment.min.js"></script>
    <script type='text/javascript' src="/admin/js/bootstrap-datetimepicker.js"></script>
    <script type='text/javascript' src="/admin/js/searchForm.js"></script>

</head>
<body id="page-top">
<!-- Navbar -->
<%@ include file="/WEB-INF/views/common/navbar.jsp"%>
<div id="wrapper">
    <!-- Sidebar -->
    <%@ include file="/WEB-INF/views/common/sidebar.jsp"%>

    <div id="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item active">상담 DB</li>
            </ol>

            <form id="searchForm" name="searchForm" action="/admin" method="get">
                <div class="btn-container">
                    <div class='input-group date'>
                        <div class="from-date">
                            <label>From:</label>
                            <input type="text" id="dateFrom" value="${searchParam.dateFrom}">
                            <input type="hidden" name="dateFrom" value="${searchParam.dateFrom}">
                        </div>
                        <div class="to-date">
                            <label>To:</label>
                            <input type="text" id="dateTo" value="${searchParam.dateTo}">
                            <input type="hidden" name="dateTo" value="${searchParam.dateTo}">
                        </div>
                        <div class="search-btn">
                            <button type="submit" class="btn btn-primary date-range-btn" form="searchForm">확인</button>
                        </div>
                        <div class="day-search-btn">
                            <button type="button" id="dateToday" class="btn btn-warning date-range-btn" value="${nowDate}">오늘</button>
                            <button type="button" id="dateYesterday" class="btn btn-secondary date-range-btn" value="${yesterdayDate}">어제</button>
                        </div>
                        <div class="excel-down-btn">
                            <button type="button" class="btn btn-success float-right excel-btn">Excel</button>
                        </div>
                    </div>
                </div>
            </form>

            <!-- DataTables Example -->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fas fa-table"></i>
                    ${searchParam.dateFrom} ~ ${searchParam.dateTo}
                </div>
                <div class="card-body">
                    <div style="text-align: right;">총합계 : ${dbCount} | 중복제거합계 : ${noDplctCount}</div>
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <c:forEach var="headerName" items="${dataHeader}">
                                    <th>${headerName}</th>
                                </c:forEach>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <c:forEach var="headerName" items="${dataHeader}">
                                    <th>${headerName}</th>
                                </c:forEach>
                            </tr>
                            </tfoot>
                            <tbody>
                            <c:choose>
                                <c:when test="${dblist.size() > 0}">
                                    <c:forEach var="consultDb" items="${dblist}">
                                        <tr>
                                            <c:forEach var="headerName" items="${dataHeader}">
                                                <td>${consultDb.get(headerName)}</td>
                                            </c:forEach>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="${dataHeader.size()}" align="center">No data available in table.</td>
                                        <c:forEach begin="2" end="${dataHeader.size()}">
                                            <td style="display: none"></td>
                                        </c:forEach>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div> -->
            </div>
        </div>
        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
        <footer class="sticky-footer">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright © Your Website 2019</span>
                </div>
            </div>
        </footer>
    </div>
    <!-- /.content-wrapper -->
</div>
<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
