<%@page import="signupPro.mgr.MemberMgr"%>
<%@ page import="static signupPro.mgr.MemberMgr.getInstance" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String[] hobby = request.getParameterValues("hobby");
    String hobbyString = "";
    for(String h : hobby) {
        hobbyString += h;
    }
%>
<jsp:useBean id="mbean" class="signupPro.bean.MemberBean" />
<jsp:setProperty property="*" name="mbean"/>
<%
    mbean.setHobby(hobbyString);

    MemberMgr mgr = getInstance();
    mgr.insertMember(mbean);

    response.sendRedirect("login.jsp");
%>
</body>
</html>