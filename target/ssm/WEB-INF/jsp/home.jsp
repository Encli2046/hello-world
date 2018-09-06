<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%@ page isELIgnored="false" %>--%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生表单</title>
    <jsp:include page="/WEB-INF/jsp/common.jsp"></jsp:include>
</head>
<body>

<div class="heading" style="text-align: center;">
    <h1><b style="color: #007AFF;">学生列表</b></h1>
</div>

<div class="container">

    <table class="table table-striped table-bordered table-hover ">

        <thead>
        <tr>
            <th style="text-align: center;">学号</th>
            <th style="text-align: center;">姓名</th>
            <th style="text-align: center;">年龄</th>
            <th style="text-align: center;">操作</th>
        </tr>
        </thead>

        <tbody>

        <%--<c:forEach items="${studentPageInfo.list}" var="student">--%>
        <c:forEach begin="0" step="1" items="${studentList}" var="student" varStatus="studentList">
            <tr style="text-align: center;">
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.age}</td>
                <td>
                    <button class="btn btn-danger" id=${student.id }   onclick="del(this)" name="up">删除</button>
                    <button class="btn btn-primary" id=${student.id }   onclick="update(this)" name="up">修改</button>
                </td>
            </tr>
        </c:forEach>


        <div style="text-align: center; margin-top: 100px">
            <p>
                <label class="input-group-lg">姓名:</label> <input type="text" id="stuName">
                <label class="input-group-lg">年龄:</label> <input type="text" id="stuAge">
                <button id="add" onclick="add()" class="btn btn-info" name="up">增加</button>
            </p>
        </div>
        </tbody>

    </table>

    <div style="text-align: center;;position: absolute;top:600px;left:41% " >
        <p>共${page.pages}页</p>
        <a href="student?page=${page.firstPage}" class="btn btn-default">第一页</a>
        <a href="student?page=${page.prePage}" class="btn btn-default">上一页</a>
        <a href="student?page=${page.nextPage}" class="btn btn-default">下一页</a>
        <a href="student?page=${page.lastPage}" class="btn btn-default">最后页</a>
    </div>


</div>

<script type="text/javascript">





    //增加
    function add() {

        var student = {};
        student.name = $("#stuName").val();
        student.age = $("#stuAge").val();

        $.ajax({
            type: "post",
            url: "/student/add",
            data: student,
            success: function (data) {
                if (data.status == 200) {
                location.href = "/student";
                }
                if (data.status == 400) {
                    alert("增加学生失败");
                }
         },
            error: function () {
                alert("请求失败");
            }
        });
    }

    //删除
    function del(obj) {
        var id = $(obj).attr("id");
        //alert(id)

        $.ajax({
            type: "post",
            url: "/student/delete",
            data: {
                id: id
            },
            success: function (data) {
                if (data.status == 200) {
                        location.href = "/student";
                }
                if (data.status == 400) {
                    alert("删除学生失败");
                }
            },
            error: function () {
                alert("请求失败");
            }
        });
    }


    //修改,跳转到修改页面
    function update(obj) {
        var id = $(obj).attr("id");
        location.href = "/student/toUpdatePage?id="+id;

    }


</script>


</body>
</html>