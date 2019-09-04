<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/css.css" rel="stylesheet"/>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.2.min.js" ></script>
</head>
<body>
<form action="#">
	
	商品分类：<select name="cid" id="cid">
			<option value="0">请选择</option>
		</select><br>
	
	商品品牌：<select name="bid" id="bid">
			<option value="0">请选择</option>
		</select><br>
	商品名称：<input type="gname" name="gname"><br>	
	描述品牌：<textarea rows="3" cols="30" name="gdesc"></textarea><br>
	
	商品价格：<input type="text" name="price"><br>
	
	<input type="button" value="提交" onclick="add()">
	<input type="reset" value="重置">
</form>
</body>
<script type="text/javascript">
	$(function (){
		$.post("listCate.do",function(data){
			var cstr="";
			for ( var i in data) {
				cstr+="<option value='"+data[i].cid+"'>"+data[i].cname+"</option>";
			}
			$("#cid").append(cstr);
		},"json")
		
		$("#cid").change(function(){
			var cid=$(this).val();
			$.post("listBrand.do",{"cid":cid},function(data){
				var bstr="";
				for ( var i in data) {
					bstr+="<option value='"+data[i].bid+"'>"+data[i].bname+"</option>";
				}
				$("#bid").append(bstr);
			},"json")
		})
	})
	
	$(function (){
		$.post("listBrand.do",function(data){
			var bstr="";
			for ( var i in data) {
				bstr+="<option value='"+data[i].bid+"'>"+data[i].bname+"</option>";
			}
			$("#bid").append(bstr);
		},"json")
	})
	
	
	function add(){
		$.post("addGoods.do",$("form").serialize(),function(data){
			if (data) {
				alert("添加成功")
				location.href="listGoods.do";
			}else {
				alert("添加失败")
			}
		},"json")
	}
</script>
</html>