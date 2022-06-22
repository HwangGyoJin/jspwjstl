<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>join2.jsp</h3>
<form action="joinProc2.jsp">
	
	<p style="color: red;">
	<%
	if(request.getAttribute("errors")!=null){ //errors가 존재한다
		List<String> errors=(List)request.getAttribute("errors");
		for(int i=0;i<errors.size();i++){
		%>
			<%=errors.get(i) %> <br />
		<%
		}
	}
	%>	
	
	</p>
	
	
	아이디 : <input type="text" name="tid" />
	<input type="button" value="중복확인" /> <br />
	비밀번호 : <input type="text" name="tpwd" /> <br />
	비번확인 : <input type="text" name="tpwd2" /> <br />
	이름 : <input type="text" name="tname" /> <br />
	성별 : 
	<select name="tgender" id="tgender">
		<option value="남성">남성</option>
		<option value="여성">여성</option>
	</select> <br />
	생년월일 : 
	<input type="text" name="year" size="5" />년
	<input type="text" name="month" size="5" />월
	<input type="text" name="day" size="5" />일
	
	<input type="radio" name="tislunar" value="solar" checked /> 양력
	<input type="radio" name="tislunar" value="islunar" /> 음력 <br />
	핸드폰 번호 : <input type="tel" name="tcphone" /> 예) 010-1111-5555 <br />
	이메일 : <input type="email" name="temail" /> <br />
	취미 : 
	<input type="checkbox" name="thabit" value="music" /> 음악
	<input type="checkbox" name="thabit" value="movie" /> 영화
	<input type="checkbox" name="thabit" value="trip" /> 여행 <br />

	<input type="submit" value="확인" />



</form>
</body>
</html>