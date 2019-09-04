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
	<input type="hidden" name="gid" id="gid">
	
	商品分类：<select name="cid" id="cid">
			<option value="0">请选择</option>
		</select><br>
	
	商品品牌：<select name="bid" id="bid">
			<option value="0">请选择</option>
		</select><br>
	商品名称：<input type="gname" name="gname" id="gname"><br>	
	描述品牌：<textarea rows="3" cols="30" name="gdesc" id="gdesc"></textarea><br>
	
	商品价格：<input type="text" name="price" id="price"><br>
	
	<input type="button" value="提交" onclick="update()">
	<input type="reset" value="重置">
</form>
</body>
<script type="text/javascript">

$(function(){
	$.post("findgid.do",{"gid":"${param.gid}"},function(data){
		var da=data.goods;
		$("#gid").val(da.gid);
		$("#gname").val(da.gname);
		$("#gdesc").val(da.gdesc);
		$("#price").val(da.price);
		
		
		var c=data.listCate;
		var cstr="";
		for ( var i in c) {
			cstr+="<option value='"+c[i].cid+"'>"+c[i].cname+"</option>";
		}
		$("#cid").append(cstr);
		$("#cid").val(da.cid);
		
		var b=data.listBrand;
		var bstr="";
		for ( var i in b) {
			bstr+="<option value='"+b[i].bid+"'>"+b[i].bname+"</option>";
		}
		$("#bid").append(bstr);
		$("#bid").val(da.bid);
	},"json")
})

	function update(){
		$.post("updateGoods.do",$("form").serialize(),function(data){
			if (data) {
				alert("修改成功")
				location.href="listGoods.do";
			}else {
				alert("修改失败")
			}
		},"json")
	}
</script>
</html>