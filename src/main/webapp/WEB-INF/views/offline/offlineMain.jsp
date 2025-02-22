<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- 헤더 적용 문구 -->
<%@include file="/WEB-INF/views/offHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Offline</title>
<style>
	*{margin:0;}
	@font-face{
    font-family: 'BMHANNAAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.0/BMHANNAAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	body{
		margin:0 auto;
		width:1800px;
    	height: 1000px;
    	font-family: 'BMHANNAAir';
	}
	table{width:1400px; margin:auto;}
	#header{margin-top:10px; height:100px; border-top: 1px solid black; background-color:#6DCEF520; }
	.category{height:400px;}
	#btnBox{text-align:center; padding-bottom:30px;background-color:#6DCEF520;}
	td{margin:auto; background-color: white}
	img{width:300px; height:300px; margin:40px}
	h2,h4{text-align:center; margin-top:10px;}
	.contentBox{width:100%; height:100%;}
	a{text-decoration-line: none;
	color:black;}
</style>
</head>
<body>
	<table>
		<thead>
		<c:if test="${loginSession.type==2}">
			<tr id="header">
				<th colspan="4"><h2>1:1 요청 보기</h2></th>
			</tr>
			<tr>
				<th colspan="4" id="btnBox">
					<c:forEach items="${ExpertCategory}" var="ex">
					<button type="button" class="btn btn-dark btn-lg toList" value="${ex.PARENT_GROUP }">${ex.PARENT_GROUP }</button>
					</c:forEach>
				</th>	
			</tr>
		</c:if>
		</thead>
		<tbody>
			<tr id="header">
				<td colspan="4"><h2>전문가에게 요청하기</h2></td>
			</tr>
			<tr class="category">
				<td>	
					<a href="${pageContext.request.contextPath}/offlinePost/toWrite.do?parent_group=운동">
						<img src="/resources/img/health.png">
						<h4><b>운동</b></h4>
					</a>
				</td>
				
				<td>
					<a href="${pageContext.request.contextPath}/offlinePost/toWrite.do?parent_group=요리">	
						<img src="/resources/img/cook.png">
						<h4><b>요리</b></h4>
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/offlinePost/toWrite.do?parent_group=외국어">
						<img src="/resources/img/speaking.png">
						<h4><b>외국어</b></h4>
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/offlinePost/toWrite.do?parent_group=IT">	
						<img src="/resources/img/IT.png">
						<h4><b>IT</b></h4>
					</a>
				</td>
			</tr>
			<tr class="category">
				<td>
					<a href="${pageContext.request.contextPath}/offlinePost/toWrite.do?parent_group=라이프">
						<img src="/resources/img/life.png">
						<h4><b>라이프</b></h4>
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/offlinePost/toWrite.do?parent_group=드로잉">
						<img src="/resources/img/drawing.png">
						<h4><b>드로잉</b></h4>
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/offlinePost/toWrite.do?parent_group=공예">
						<img src="/resources/img/crafts.png">
						<h4><b>공예</b></h4>
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/offlinePost/toWrite.do?parent_group=아동교육">	
						<img src="/resources/img/baby.png">
						<h4><b>아동교육</b></h4>
					</a>
				</td>
			</tr>
		</tbody>
	</table>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	$(".toList").click(function(e){
		let text = e.target.value;
		let id = '${loginSession.user_id}'
		console.log(text)
		location.href="${pageContext.request.contextPath}/offlinePost/toList.do?parent_group="+text+"&expert_id="+id;
	})
</script>
</body>
</html>