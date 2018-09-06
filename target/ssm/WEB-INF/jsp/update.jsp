<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="java.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%@ page isELIgnored="false" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>学生信息修改</title>

	<jsp:include page="/WEB-INF/jsp/common.jsp"></jsp:include>

</head>


<body>

<% String id = request.getParameter("id");%>

<%--<h1><%=id%></h1>--%>

<div class="heading" style="text-align: center;padding: 100px 100px">
	<h1><b style="color: #007AFF;">学生信息修改</b></h1>
</div>

	<form action="" method="get" class="form-horizontal" role="form" >

		 <!-- 隐藏框,用来在地址栏存option=update2 -->
		<input type="hidden" name="option"  value="update2" >

		  <div class="form-group">
			<label for="stuId" class="col-sm-5 control-label">学号:</label>
			<div class="col-sm-2">
				<input type="text" id="stuId" name="stuId" value="${studentInfo.id}" disabled="disabled" class="form-control">
			</div>
		 </div>

		 <div class="form-group">
			<label for="stuName" class="col-sm-5 control-label">姓名:</label>
			<div class="col-sm-2">
				<input type="text" id="stuName" name="stuName" value="${studentInfo.name}"  class="form-control" >
			</div>
		 </div>

		 <div class="form-group">
		 	<label for="stuAge" class="col-sm-5 control-label">年龄:</label>
			<div class="col-sm-2">
				<input type="text" id="stuAge" name="stuAge" value="${studentInfo.age}"  class="form-control">
			</div>
		 </div>


		 <div  style="text-align: center">
			 	<input type="button" onclick="update()"  value="提交"  class="btn btn-success">
		 </div>
	</form>



<script type="text/javascript">


	function update() {

	    var id = $("#stuId").val();
        var name = $("#stuName").val();
        var age = $("#stuAge").val();

        var student = {};
        student.id = id;
        student.name = name;
        student.age = age;


        $.ajax({
            type: "post",
            url: "/student/update",
            data:student,
            success: function (data) {
				if (data.status == 200){
                    location.href = "/student";
				}
				if (data.status ==400 ){
				    alert("修改学生信息失败")
				}
            },
            error: function () {
                alert("请求失败");
            }

        });

    }






</script>


</body>


</html>