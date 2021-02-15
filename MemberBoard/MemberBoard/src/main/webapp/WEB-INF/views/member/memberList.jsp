<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!-- 윗부분을 추가 -->
<%@ include file="../includes/header.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">MemberList</h1>
                    <p class="mb-4">memberList.jsp</p>

                    <!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">MemberList</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th></th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th></th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="mList" items="${memdto }">
							<tr>
								<td>${mList.mid }</td>
								<td><a href="memberView?mid=${mList.mid }">${mList.mname }</a></td>
								<td>${mList.mphone }</td>
								<td>${mList.memail }</td>
								<td><a href="memberDelete?mid=${mList.mid }" class="btn btn-light">삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col-sm-12 col-md-5">
					<div class="dataTables_info" id="dataTable_info" role="status"
						aria-live="polite">
						<a href="/boardWriteForm" class="btn btn-light btn-icon-split">
							<span class="icon text-gray-600"> <i
								class="fas fa-arrow-right"></i>
						</span> <span class="text">글쓰기</span>
						</a>
					</div>
				</div>
				<div class="col-sm-12 col-md-7">
					<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate" style="float: right">
						<ul class="pagination">
						
						<c:choose>
							<c:when test="${pagedto.page <= 1 }"><!-- page가 1보다 작으면 활성화가 안됨disabled -->
								<li class="paginate_button page-item previous disabled">
									<a href="#" class="page-link">이전</a>
								</li>
							</c:when>
							
							<c:when test="${pagedto.page > 1 }"><!-- page가 1보다 크면 활성화됨 -->
								<li class="paginate_button page-item previous">
									<a href="memberList?page=${pagedto.page-1 }" class="page-link">이전</a>
								</li>
							</c:when>
						</c:choose>
						
						<c:forEach begin="${pagedto.startpage }" end="${pagedto.endpage }" step="1" var="pageNum"><!-- pageNum은 i인덱스 -->
							<c:choose>
								<c:when test="${pageNum == pagedto.page }">
									<li class="paginate_button page-item active"><!-- active 현재보고있는 페이지 번호의 배경색이 채워지는 -->
										<a href="#" class="page-link">${pageNum }</a>
									</li>
								</c:when>
								
								<c:otherwise>
									<li class="paginate_button page-item">
										<a href="memberList?page=${pageNum }" class="page-link">${pageNum }</a><!-- 페이지번호를 누르면 그 페이지로 이동을 해야되니깐 -->
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
							
						<c:choose>
							<c:when test="${pagedto.page < pagedto.maxpage }"><!-- page가 maxpage보다 작으면 활성화됨 -->
								<li class="paginate_button page-item next">
									<a href="memberList?page=${pagedto.page+1 }" class="page-link">다음</a>
								</li>
							</c:when>
							
							<c:when test="${pagedto.page >= pagedto.maxpage }"><!-- page가 maxpage보다 크면 활성화가 안됨disabled -->
								<li class="paginate_button page-item next disabled">
									<a href="#" class="page-link">다음</a>
								</li>
							</c:when>
						</c:choose>
						
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
                <!-- /.container-fluid -->


    

    
<!-- 아랫부분 추가 -->
<%@ include file="../includes/footer.jsp" %>
