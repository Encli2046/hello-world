<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆页面</title>
	<jsp:include page="/WEB-INF/jsp/common.jsp"></jsp:include>
</head>
<body>

	<div  style="text-align: center; padding: 100px 100px">
		<h1><b style="color: #3971ff;">用 户 登 陆</b></h1>
	</div>

	<form method="post" class="form-horizontal" role="form">
		<div  class="form-group">
			<label for="username" class="col-sm-5 control-label">账 号：</label>
			<div class="col-sm-2">
				<input type="text" name="username" id="username" class="form-control">
			</div>
		</div>

		<div  class="form-group">
			<label for="password" class="col-sm-5 control-label" >密 码：</label>
			<div class="col-sm-2">
				<input type="password" name="password" id="password" class="form-control">
			</div>
		</div>

		<div  style="text-align: center; margin-top: 20px">
			<input type="button" onclick="loginCheck()" value="登陆" class="btn btn-success">
		</div>

	</form>

</body>

<script type="text/javascript">


	function loginCheck() {

        var user = {};
	    var userNameVal = $("#username").val();
		var passwordVal = $("#password").val();
        user.username = userNameVal;
        user.password = passwordVal;


		$.ajax({
			type : 'post',
			url : '/login/check',
			dataType : 'json',
			data :user,
			success : function(data) {
			    //JSON.stringify(result)

				if (data.status == 200) {
					//alert(data.msg);
                    location.href = "/student";

				}
				if (data.status == 400){
                    alert("账号或者密码错误!");
                    location.href = "/login";
				}
			},
			error:function(){
				alert("请求失败");
			}
		})
	}
</script>


</html>