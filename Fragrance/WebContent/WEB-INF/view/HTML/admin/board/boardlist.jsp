<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../../../css/admin/reset.css" type="text/css" rel="stylesheet">
    <link href="../../../css/admin/prd_list_style.css" type="text/css" rel="stylesheet">
    <title>Bon Parfum 관리자 페이지</title>
</head>

<body>
	<section class="content-container">
		<div id="body">
			<main class="main">
			                <!-- -------------aside------------------------------- -->
                <aside id="aside">
                    <div class="left_area">
                        <h1> 관리자 홈 </h1>

                        <div class="left-menu">
                            <section>
                                <h2 class="titmenu">페이지관리</h2>
                                <ul class="submenu">
                                    <li><a href="../item/prdlist"> → 제품목록</a></li>
                                    <li><a href="../board/boardlist"> → 게시글목록</a></li>
                                </ul>
                            </section>
                            <section> 
                                <h2 class="titmenu">회원관리</h2>
                                <ul class="submenu">
                                    <li><a href="../user/userlist"> → 회원목록</a></li>

                                </ul>
                            </section>    
                        </div>
                    </div>
                </aside>    
 
    <!-- -------------main------------------------------- -->
                <div class="main-prdlist">
                    <section class="prdlist">
                        <h1>< 게시글 목록 ></h1>
                        
                        <div class="admin-btn">
                            <div class="rightbtn-gohome">
                                <a href="/index"><button type="submit">메인으로</button></a>  
                            </div>
                        </div>
					<form action="userlist" method="post">
                            
                                <input class="leftbtn3" type="submit" name="cmd" value="선택삭제">
                            

					    <table class="prdlist-table">

						 <thead>
                                <tr>
                                    <td>선택</td>
                                    <td>No.</td>
                                    <td>작성자</td>
                                    <td>작성일</td>
                                    <td>제목</td>
                                    <td>좋아요</td>
                                    <td>조회수</td>
                                    <td>샐럽</td>              
                                </tr>
                            </thead>
                        
						    <tbody>

                                <c:forEach var="n"   items="${admin}">
                                    
                                    <tr>
                                        <td> 
                                            <input type="checkbox" name="del-id" value="${n.titleNums}">
                                        </td>
                                        <td>${n.titleNums}</td>
                                        <td>${n.writerId}</td>
                                        <td>${n.regDate}</td>
                                        <td>${n.title}</td>
                                        <td>${n.like}</td>
                                        <td>${n.hit}</td>
                                        <td>${n.celeb}</td>
                                       
                                    
                                
                                    </tr>
                                </c:forEach>
                            </tbody>

					    </table>
					</form>
				</section>
			</div>

			</main>

                    <section class="pager">
                        <h1 class="d-none">페이지</h1>
                            <div>
                                    <c:set var="page" value="${(param.p==null)?1:param.p }"/>
                                    <c:set var="startNum" value="${page-(page)%5}"/>
                                    <c:set var="lastNum" value="${fn: substringBefore(Math.ceil(count/10), '.')}"/>
                                <ul>
                                
                                		<c:if test="${startNum<=0 }">
                                        <div class="btn-prev" onclick="alert('처음 페이지 입니다');"><a href="">이전</a></div>
                                    </c:if>
                                    <c:if test="${startNum>0 }">
                                        <div class="btn-prev"><a href="?p=${startNum-1}">이전</a></div>
                                    </c:if>
                                  
                                    
                                    <c:forEach var="p" begin="1" end="5">
                                        
                                        <c:if test="${(startNum+p)<=lastNum }">
                                            <li><a  href="?p=${startNum+p}">${startNum+p}</a></li>
                                        </c:if>
                                    </c:forEach>
                                    
                                    <c:if test="${startNum+5<=lastNum }">
                                        <div class="btn-next"><a href="?p=${startNum+6}">다음</a></div>
                               	   </c:if>
                               	   <c:if test="${ startNum+5>lastNum }">
                                        <div class="btn-next" onclick="alert('마지막 페이지 입니다');"><a href="">다음</a></div>
                                    </c:if>
                                   
                                    
                                </ul>
                            </div>
                    </section>
                   
		</div>
	</section>
</body>
</html>