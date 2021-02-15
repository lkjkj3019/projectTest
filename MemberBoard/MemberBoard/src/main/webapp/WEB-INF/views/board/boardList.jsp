<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <!-- 윗부분을 추가 -->
<%@ include file="../includes/header.jsp" %>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">BoardList</h1>
                    <p class="mb-4">boardList.jsp</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">BoardList</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                                            <td> <a href="boardView?bno=${bList.bno }">${bList.btitle }</a> [${bList.commentCnt }] </td>
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
																					<!-- mid=bwriter 참조되어 있어야됨 -->
														<a class="dropdown-item" href="boardListMember?bwriter=${bList.bwriter }">게시글 보기</a>
														<a class="dropdown-item" onclick="showMsgModal('${bList.bwriter}','${sessionScope.loginId}')" href="#">쪽지보내기</a> 
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
                            <a href="/boardWriteForm" class="btn btn-light btn-icon-split">
                                        <span class="icon text-gray-600">
                                            <i class="fas fa-arrow-right"></i>
                                        </span>
                                        <span class="text">글쓰기</span>
                            </a>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

<!-- 글 등록 Modal-->
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
    
<!-- 메세지 보내기 부분 Modal -->
    <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">메시지보내기</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                보내는 사람: <span id="msg_sendid"></span><br>
                받는 사람:  <span id="msg_receiveid"></span>님에게 메시지<br>
                <!-- <input type="text" value= 이러케도 가능 위에꺼  -->
                <input type="text" id="msg_content" placeholder="메시지 내용...">
                </div>
                <div class="modal-footer">
                    <button class="btn btn-warning" type="button" onclick="sendMsg()">보내기</button>
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
     				$(".modal-body").text("게시글"+parseInt(modalBno) +" 번이 "+ message +" 되었습니다.");
         		}
				$("#bwriteModal").modal("show");
      		}
		});


		/* 메시지 보내기 */
		function showMsgModal(msg_receiveid, msg_sendid) {//받는, 보내는
		    console.log("showMsgModal() 실행");
		    console.log(msg_receiveid, msg_sendid);
		      $("#msg_receiveid").text(msg_receiveid);
		      $("#msg_sendid").text(msg_sendid);
		      $("#messageModal").modal("show");
		      
		 }
		 
		/* 메시지를 보내고 나서 나오는 성공여부 안내문 */
		 function sendMsg(){
		     console.log("sendMsg() 실행");
		     //보내는 사람
	         var msg_sendid = $("#msg_sendid").text();//text : 이미 위에서 있는값을 가져오기때문에 그걸 문자로 가져온다 이런뜻인가봄
		     //받는 사람
		     var msg_receiveid = $("#msg_receiveid").text();
		     //메시지 내용
	       	 var msg_content = $("#msg_content").val();
		     console.log(msg_sendid+":"+msg_receiveid+":"+ msg_content);

		     //ajax를 이용 - data:보낼내용
		     $.ajax({
		          type : "post",
		          url : "sendMsg",
		          data : {
		             "msg_sendid" : msg_sendid,
		             "msg_receiveid" : msg_receiveid,
		             "msg_content" : msg_content
		          },
		          dataType :"text",
		          async: false,
		          success : function(content){
		             console.log(content);

		             if(content=="OK") {
		             	alert("쪽지보내기 성공");
		             	$("#msg_content").val("");
		             } else {
		             	alert("쪽지보내기 실패");
		            	 $("#msg_content").val("");
		             }
		             }, 
		             error: function() {
		                alert("연결실패");
		             }   
		        });
		        $("#messageModal").modal("hide");//hide:숨겨주는 기능(messageModal을 숨겨주는)
		     }        	
				
</script>         
    
    
            <!-- 아랫부분 추가 -->
            <%@ include file="../includes/footer.jsp" %>
