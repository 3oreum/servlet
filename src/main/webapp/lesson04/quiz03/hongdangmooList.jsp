<%@page import="java.sql.ResultSet"%>
<%@page import="com.test.common.MysqlService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HONG당무 마켓</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<style>
#wrap {height:1000px;}
header {height:150px;}
nav {height:80px;}
.contents {min-height:500px;}
footer {height:200px;}
</style>
</head>
<body>
<%
	// DB 연결
	MysqlService ms = MysqlService.getInstance();
	ms.connect();
	
	// DB select
	String selectQuery = "select A.*, B.* from seller as A join used_goods as B on A.`id` = B.`sellerId`";
	ResultSet res = ms.select(selectQuery);
	
%>
	<div class="container bg-secondary" id="wrap">
		<header class="bg-danger d-flex justify-content-center align-items-center">
			<h1>HONG당무 마켓</h1>
		</header>
		<nav class="bg-info d-flex align-items-center">
			<ul class="nav nav-fill w-100">
				<li class="nav-item"><a href="" class="nav-link">리스트</a></li>
				<li class="nav-item"><a href="" class="nav-link">물건 올리기</a></li>
				<li class="nav-item"><a href="" class="nav-link">마이 페이지</a></li>
			</ul>
		</nav>
		<section class="bg-success contents">		
			<div class="d-flex">
			<%
				while(res.next()){
			%>
				<div class="border p-3 mr-2">
						<div>
							<a href="#"><img alt="사진" width="300" height="200" src="<%= res.getString("pictureUrl") %>"></a>
							<b>[<%= res.getString("title") %>]</b>
							<div class="text-secondary"><%= res.getInt("price") %>원</div>
							<div><%= res.getString("nickname") %></div>
						</div>
				</div>
			
			<%
				}
			%>
			</div>
		</section>
		<footer class="bg-warning">
			<small class="text-secondary">Copyright 2019. HONG All Rights Reserved.</small>
		</footer>
	</div>
<%
	// DB 연결 해제
	ms.disconnect();
%>
</body>
</html>