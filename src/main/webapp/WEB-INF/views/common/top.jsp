<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:url var="root" value="/"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        
        <title>DYS GAMES</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${path}/resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${path}/resources/css/styles.css" rel="stylesheet" />
        <!-- Swiper JS -->
   		<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
   		<!-- Link Swiper's CSS -->
   		<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
   		
   		<link href="${path}/resources/css/swiper.css" rel="stylesheet" />
   		
   		<link href="${path}/resources/css/styles_gameDetail.css" rel="stylesheet" />
   		
   		
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${root}index">DYS GAMES</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4" >
                    	<li class="nav-item"><a class="nav-link" href="${root}about">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Notice</a></li>
                        <li class="nav-item"><a class="nav-link" href="${root}gameProc">Games</a></li>
                        <!-- <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#!">GAMES</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="#!">Popular</a></li>
                                <li><a class="dropdown-item" href="#!">New</a></li>
                            </ul>
                        </li> -->
                    </ul>
                    <form class="d-flex me-auto">
                    	<input class="form-control me-2" type="search" placeholder="검색" aria-label="Search" style="width: 400px" >
     					<button class="btn btn-outline-dark" type="submit"><i class="bi bi-search"></i></button>
                    </form>
                    <ul class="navbar-nav mb-2 mb-lg-0 justify-content-end">
                    	<c:choose>
                    		<c:when test="${empty sessionScope.id }">
		                    	<li class="nav-item"><a class="nav-link" href="${root}member">회원가입</a></li>
		                    	<li class="nav-item"><a class="nav-link" href="${root}login">로그인</a></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li class="nav-item"><a class="nav-link" href="#!">회원정보</a></li>
                    			<li class="nav-item"><a class="nav-link" href="#!">로그아웃</a></li>
                    		</c:otherwise>
                    	</c:choose>
                    </ul>
                    <form class="d-flex">
                        <button class="btn btn-outline-dark" type="submit">
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                        </button>
                    </form>
                </div>
            </div>
        </nav>