<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:url var="root" value="/"/>

<%@ include file="../common/top.jsp" %>

<c:set var="game" value="${game}"/>

<body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <form id="f" method="get">
            <!-- Header-->
            <input type="hidden" id="No" name="No" value="${game.no}"/>
            <header class="bg-dark py-5">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                    	<div style="text-align: center;"><h2 style="color: #FFFFFF;">${game.title}</h2></div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><iframe width="600" height="400" src="${game.link}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"></iframe></div>
                        <div class="col-lg-8 col-xl-7 col-xxl-4">
                            <div class="my-5 text-center text-xl-start">
                            	<div class="fw-normal text-white mb-2">
	                                <span class="lead">판매가</span>
	                                <span>${game.price}</span>                       
                            	</div>                         
                                <hr style="color: #FFFFFF">
                                <div class="fw-normal text-white mb-3">
	                                <span class="lead" style="width: 100px;">출시일</span>
                             		<span>${game.launching }</span>
                                </div>
                                <div class="fw-normal text-white mb-3">
	                                <span class="lead">장르</span>
                             		<span>${game.genre}</span>
                                </div>
                                <div class="fw-normal text-white mb-3">
	                                <span class="lead">퍼블리셔</span>
                             		<span>${game.publisher}</span>
                                </div>
                                <div class="fw-normal text-white mb-3">
	                                <span class="lead">개발사</span>
                             		<span>${game.developer}</span>
                                </div>
                                <div class="fw-normal text-white mb-3">
	                                <span class="lead">플랫폼</span>
                             		<span>${game.platform}</span>
                                </div>
                                <div class="fw-normal text-white mb-3">
	                                <span class="lead">언어</span>
                             		<span>${game.language}</span>
                                </div>                           
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <a class="btn btn-lg px-4 me-sm-3" style="background-color: #FFBB00; border-color: #FFBB00;" href="#features">구매하기</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="#!">장바구니</a>                             
                                </div>
                            </div>
                        </div>
                    </div>                
                </div>
                <div style="text-align: center;">
                <button formaction="${root}gameModification" class="btn btn-lg px-4 me-sm-3" style="background-color: #FFFFFF; border-color: #FFFFFF;">내용 수정</button>
              	 <%--  <a class="btn btn-lg px-4 me-sm-3" style="background-color: #FFFFFF; border-color: #FFFFFF;" href="${root}gameModification">내용 수정</a> --%>
                </div>
            </header>
           
            <!-- Testimonial section-->
            <div class="py-5 bg-light">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-10 col-xl-7">
                            <div class="text-center">
                                <div class="fs-4 mb-4 fst-italic">${game.explanation}</div>
                                <div class="d-flex align-items-center justify-content-center">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </form>
            <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2>이 게임과 유사한 게임</h2>
                                <br>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
                    <div class="col mb-5">
                        <div class="card h-100 w-75">
                           
                            <!-- Product image-->
                           	<a href="${root }gameDetail"><img class="card-img-top" src="${path}/resources/img/card1.jpg" alt="..." /></a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">배틀그라운드</h5>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100 w-75">
                           
                            <!-- Product image-->
                           	<a href="${root }gameDetail"><img class="card-img-top" src="${path}/resources/img/card1.jpg" alt="..." /></a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">배틀그라운드</h5>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col mb-5">
                        <div class="card h-100 w-75">
                           
                            <!-- Product image-->
                           	<a href="${root }gameDetail"><img class="card-img-top" src="${path}/resources/img/card1.jpg" alt="..." /></a>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">배틀그라운드</h5>
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                            </div>
                        </div>
                    </div>
                            
                    </div>
                </div>
            </section>
        </main>
    </body>
</html>

<%@ include file="../common/footer.jsp" %>     