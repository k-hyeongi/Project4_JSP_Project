<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.dao.MemberDAO"%>
<%@ page import="com.member.common.FileUpload" %>
<%@ page import="com.member.bean.MemberVO" %>

<% request.setCharacterEncoding("utf-8"); %>

<%--<jsp:useBean id="u" class="com.member.bean.MemberVO" />--%>
<%--<jsp:setProperty property="*" name="u"/>--%>

<%
	MemberDAO memberDAO = new MemberDAO();

	FileUpload upload = new FileUpload();
	MemberVO u = upload.uploadPhoto(request);

	int i = memberDAO.insertMember(u);

	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
	alert('<%=msg%>');
	location.href='members.jsp';
</script>