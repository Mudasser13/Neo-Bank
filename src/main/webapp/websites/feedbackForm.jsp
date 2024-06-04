<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/DetailDataCollection" method="Post">
CustomerId : <br>
<input type = "text" name="customerId"> <br>		

Contact Number: <br>
<input type = "text" name="contactno"> <br>
Feedback: <br>
<textarea name="feedback" rows="5" cols="5"></textarea>
<input type = "submit" name="Submit" value="Submit">
</form>
</body>
</html>