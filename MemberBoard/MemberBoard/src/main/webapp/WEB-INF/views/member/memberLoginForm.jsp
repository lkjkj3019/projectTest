<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp" %>
            <!-- Begin Page Content -->
            <div class="container-fluid">

               <!-- Page Heading -->
               <h1 class="h3 mb-2 text-gray-800">MemberLoginForm</h1>
               <p class="mb-4">memberLoginForm.jsp</p>
<div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <!-- <div class="col-lg-6 d-none d-lg-block bg-login-image"></div> -->
                            <div class="col-lg-6"  style="margin-left: auto; margin-right: auto;">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">로그인해.</h1>
                                    </div>
                                    <form class="user" action="memberLogin" method="post">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                name="mid" placeholder="ㅇrㅇiㄷl">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                               	name="mpassword" placeholder="ㅂi밀번호">
                                        </div>
                                        <button type="submit" class="btn btn-primary btn-user btn-block">로그인</button>
                                        
                                        <hr>
                                        
                                        <a href="index.html" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> 뭐.
                                        </a>
                                        <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> 왜.
                                        </a>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="memberJoinForm">회원가입</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    </div>
</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->

<!-- Modal -->
    <div class="modal fade" id="memberJoinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">가입되었다 너의 아이디는</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" id="joinMsg">내용</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
         
<script type="text/javascript">
	$(document).ready(function(){

   		var msg = '${msg}';
 		checkModal(msg);

   		function checkModal(msg){ //없으면 종료
			if(msg ===''){
   				return;
			}
     		$("#joinMsg").text(msg);
			$("#memberJoinModal").modal("show");
      		}
		});
</script>





<%@ include file="../includes/footer.jsp" %>

