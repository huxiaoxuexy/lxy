<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/css.css" rel="stylesheet"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.2.min.js" ></script>
</head>
<body>
<table>
	<tr>
		<td>商品名称</td>
		<td>商品价格</td>
		<td>商品分类名称</td>
		<td>商品品牌名称</td>
		<td>操作
			<a href="add.jsp"><input type="button" value="添加"></a>
		</td>
	</tr>
	<c:forEach items="${page.list }" var="g">
		<tr>
		<td>${g.gname }</td>
		<td>${g.price }</td>
		<td>${g.cname }</td>
		<td>${g.bname }</td>
		<td>
			<a href="update.jsp?gid=${g.gid }"><input type="button" value="修改"></a>
		</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="10">
			当前${page.pageNum }页/共${page.pages }页
			<a href="?pageNum=1">首页</a>
			<a href="?pageNum=${page.pageNum-1 <1 ? page.pageNum:page.pageNum-1 }">上一页</a>
			<a href="?pageNum=${page.pageNum+1 >page.pages ? page.pageNum:page.pageNum+1 }">下一页</a>
			<a href="?pageNum=${page.pages }">尾页</a>
		</td>
	</tr>
</table>
</body>
</html>