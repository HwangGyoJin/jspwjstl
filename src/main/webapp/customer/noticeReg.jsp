<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>noticeReg.jsp</h3>

<form action="noticeRegProc.do" method="post">
	<dl>
		<dt>제목</dt>
		<dt>
			<input type="text" name="title" />
		</dt>
	</dl>
	<dl>
		<dt>첨부파일</dt>
		<dt>
			<input type="file" name="txtFile" />
		</dt>
	</dl>
	<div>
		<textarea name="content" id="txtcontent" class="txtcontent">내용</textarea>
	</div>
	<input type="submit" value="save" />
	<input type="button" value="cancel" class="cancel" />
	

</form>
</body>
</html>