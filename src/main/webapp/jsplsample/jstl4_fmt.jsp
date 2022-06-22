<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Locale"%>
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
<h3>fmt2</h3>
<fmt:formatNumber value="1000000" type="currency"/> <br />
<fmt:formatNumber value="1000000" type="currency" pattern="#원"/> <br />
<fmt:formatNumber value="1000000" type="currency" pattern="###,###원"/> <br />
<fmt:formatNumber value="1000000" type="currency" pattern="###,###"/>원 <br />
<fmt:formatNumber value="1000000.1235" type="currency" pattern="###,###.##"/>원 <br />

<hr />
locale <br />
<c:set var="now" value="<%=new java.util.Date() %>"></c:set>
<fmt:setLocale value="en_us"/>
<fmt:formatDate value="${now }" type="both" dateStyle="short" pattern="YY-MM-dd"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="medium" pattern="YY-MM-dd [a] hh:mm:ss"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="short" /> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="medium" /> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="long" /> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="full" /> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="full" pattern="YYYY-MM-dd[E]" /> <br />

<hr />
timeZone <br />
<fmt:setLocale value="en_us"/>
<fmt:formatDate value="${now }" type="both" dateStyle="short" pattern="YY-MM-dd"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="medium" pattern="YY-MM-dd [a] hh:mm:ss "/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="long" timeZone="America/Los_Angeles"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="long" pattern="YY-MM-dd"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="full" pattern="YY-MM-dd [a] hh:mm:ss "/> <br />
<hr />

<fmt:setLocale value="ru_RU"/>
<fmt:formatDate value="${now }" type="both" dateStyle="short" pattern="YY-MM-dd"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="medium" pattern="YY-MM-dd [a] hh:mm:ss"/> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="short" /> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="medium" /> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="long" /> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="full" /> <br />
<fmt:formatDate value="${now }" type="both" dateStyle="full" pattern="YYYY-MM-dd[E]" /> <br />
<hr />
국가코드 알아보기 <br />
<c:set var="ics" value="<%=Locale.getAvailableLocales() %>"></c:set>
<c:forEach items="${ics }" var="lo">
	${lo } &nbsp;&nbsp;
</c:forEach>

</body>
</html>