<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 페이지에서 한글깨짐 수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>


<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Home</h1>
    <p class="mb-4">home.jsp</p>
	<div class="container">

		<P>  The time on the server is ${serverTime}. </P>
		<h2>로그인 아이디 : ${sessionScope.loginId }</h2>
	</div>
</div>


<%@ include file="includes/footer.jsp" %>