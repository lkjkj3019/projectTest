<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!-- 윗부분을 추가 -->
<%@ include file="../includes/header.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">BoardListPaging</h1>
                    <p class="mb-4">boardListPaging.jsp</p>

                    <!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">BoardListPaging</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>NO</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>작성일자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>NO</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>작성일자</th>
							<th>조회수</th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="bList" items="${boardList }">
							<tr>
								<td>${bList.bno }</td>
								<td><a href="boardView?bno=${bList.bno }">${bList.btitle }</a>
									[${bList.commentCnt }]</td>
								<!-- 제목을 클릭시 boardView에 bno에 있는 번호 확인후 -->
								<td>
									<div class="dropdown no-arrow mb-0">
																	<!-- # : 아무것도 아님-손가락표시로 변경 -->
										<a class="dropdown-toggle" href="#"
											id="dropdownMenuButton" data-toggle="dropdown"
											aria-haspopup="true" aria-expanded="false">${bList.bwriter }</a>
										<div class="dropdown-menu"
											aria-labelledby="dropdownMenuButton">
											<a class="dropdown-item" href="memberView?mid=${bList.bwriter }">회원정보</a> 
											<a class="dropdown-item" href="boardListMember?bwriter=${bList.bwriter }">게시글 보기</a> 
										</div>
									</div>
								</td>
								<td>${bList.bdate }</td>
								<td>${bList.bhit }</td>
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
									<a href="boardListPaging?page=${pagedto.page-1 }" class="page-link">이전</a>
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
										<a href="boardListPaging?page=${pageNum }" class="page-link">${pageNum }</a><!-- 페이지번호를 누르면 그 페이지로 이동을 해야되니깐 -->
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
							
						<c:choose>
							<c:when test="${pagedto.page < pagedto.maxpage }"><!-- page가 maxpage보다 작으면 활성화됨 -->
								<li class="paginate_button page-item next">
									<a href="boardListPaging?page=${pagedto.page+1 }" class="page-link">다음</a>
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

<!-- Logout Modal-->
    <div class="modal fade" id="bwriteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">등록된다 너의 글이</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">내용</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
<script type="text/javascript">
	$(document).ready(function(){
   		var modalBno = '${bno}'; //${bno}넘겨주는 글번호
   		var message = '${message}';//${message}삭제등록 알림
   		
 		checkModal(modalBno);

   		function checkModal(modalBno){ //없으면 종료
			if(modalBno ===''){
   				return;
			}
     		if(parseInt(modalBno)>0){ //넘겨주는 글번호가 있으면 창이 뜬다.
				//삭제인지 등록인지 구분하는 if문 방식
         		/* if(deleteCheck == 'del') {
         				$(".modal-body").text("게시글"+parseInt(modalBno) + " 번이 삭제되었습니다.");
             		} else {
						$(".modal-body").text("게시글"+parseInt(modalBno) + " 번이 등록되었습니다.");
                 	} */
			$(".modal-body").text("게시글" + parseInt(modalBno) + " 번이 " + message + " 되었습니다.");
		}
		$("#bwriteModal").modal("show");
	}
});


	function memberView(){
		var mid = '${memdto.mid}';
		
		location.href = "mid/memberView";
	}
</script>
    
<!-- 아랫부분 추가 -->
<%@ include file="../includes/footer.jsp" %>
