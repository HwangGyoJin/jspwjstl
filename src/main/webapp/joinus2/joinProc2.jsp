<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<%
String tid=request.getParameter("tid");
String tpwd=request.getParameter("tpwd");
String tpwd2=request.getParameter("tpwd2");
String tname=request.getParameter("tname");
String tgender=request.getParameter("tgender");
String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
String tbirth=String.format("%s-%s-%s", year, month, day);
String tislunar=request.getParameter("tislunar");
String tcphone=request.getParameter("tcphone");
String temail=request.getParameter("temail");
//String habit=request.getParameter("habit");
String[] thabits=request.getParameterValues("thabit"); //선택사항이 2개이상도 가능해서 배열처리
String thabit="";
if(thabits!=null){ //null처리, 체크가 없을때
	for(int i=0;i<thabits.length;i++){
		thabit+=thabits[i];
		if(thabits.length>i+1) //구분 ,콤마		
			thabit+=", ";
	}
}

//id가 null인지, 패스워드가 일치하는지..

List<String> errors=new ArrayList();
if(tid==null || tid.equals(""))
	errors.add("아이디없음");
if(!tpwd.equals(tpwd2))
	errors.add("비번불일치");

if(errors.size()>0){ //에러가 존재할때
	//에러를 가지고 (request에 담아서) join.jsp
	request.setAttribute("errors", errors);
	request.getRequestDispatcher("join2.jsp").forward(request, response);
	
}else{
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="hr";
	String pw="123456";
	
	Class.forName(driver);
	Connection conn=DriverManager.getConnection(url,user,pw);
	//접속성공
	String sql="insert into nmember2(tid,tpwd,tname,tgender,tbirth,tis_lunar,tcphone,temail,thabit,tregdate) "
	+"values(?,?,?,?,?,?,?,?,?,sysdate)";
	
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, tid);
	pstmt.setString(2, tpwd);
	pstmt.setString(3, tname);
	pstmt.setString(4, tgender);
	pstmt.setString(5, tbirth);
	pstmt.setString(6, tislunar);
	pstmt.setString(7, tcphone);
	pstmt.setString(8, temail);
	pstmt.setString(9, thabit);
	pstmt.executeUpdate();
	
	//main페이지로 이동
	response.sendRedirect("../index.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>joinProc2.jsp</h3>

tid : <%=tid %> <br />
tgender : <%=tgender %> <br />
thirth : <%=tbirth %> <br />
temail : <%=temail %> <br /> 
thabit : <%=thabit %> <br />

</body>
</html>