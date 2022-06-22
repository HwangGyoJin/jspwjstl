<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<%
String id=request.getParameter("id");
String password=request.getParameter("password");

String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Class.forName(driver);
Connection conn=DriverManager.getConnection(url,user,pw);
//접속성공

String sql="select * from nmember where id=?";
PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs=pstmt.executeQuery();
/* 검사진행 일치판단 */

String ypass="";
int x=-1;
String msg="";

if(rs.next()){//아이디가 존재한다
	ypass=rs.getString("pwd"); // 아이디ok, dbpwd ok
	if(ypass.equals(password)) // 아이디ok, jsp password ok = x=1
		x=1;
	else // 아이디ok, jsp password 틀이면 = x=0
		x=0;
}else{//아이디가 존재하지않는다
	x=-1;
}
System.out.println("x value : "+x);
if(x==1){
	//로그인성공 세선에 저장 go MainForm.jsp
	session.setAttribute("sessionID", id);
	msg="../MainForm.jsp";
	
}else if(x==0){
	msg="loginform.jsp?msg=0";
}else{
	msg="loginform.jsp?msg=-1";
}
response.sendRedirect(msg);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>loginproc.jsp</h3>


</body>
</html>