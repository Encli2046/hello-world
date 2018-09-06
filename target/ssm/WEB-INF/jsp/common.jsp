<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="" />
<meta name="viewport"
      content="initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=0,width=device-width"/>


<link href="<%=basePath %>css/bootstrap.css" rel="stylesheet"/>
<script type="text/javascript" src="<%=basePath %>js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="<%=basePath %>js/bootstrap.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jqPaginator.js"></script>
<script type="text/javascript" src="<%=basePath %>js/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.tmpl.js"></script>

