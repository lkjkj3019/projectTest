<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp" %>







<script type="text/javascript">

	var loginId = '${sessionScope.loginId}';

	if(loginId ==''){
		alert("로그인 후 이용해.");
		location.href ="/memberLoginForm";
	}

</script>






            <!-- Begin Page Content -->
            <div class="container-fluid">

               <!-- Page Heading -->
               <h1 class="h3 mb-2 text-gray-800">BoardWriteFileForm</h1>
               <p class="mb-4">boardWriteFileForm.jsp</p>
<div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">게시글을 작성하세요</h1>
                            </div>
                            <form class="user" action="boardWriteFile" method ="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="exampleInputEmail"
                                        name="btitle" placeholder="글제목">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" style="font-weight: bold; font-size: large;"
                                           name="bwriter" value="${sessionScope.loginId }" readonly="readonly">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="exampleLastName"
                                            name="bpassword" placeholder="비밀번호">
                                    </div>
                                </div>
                                <div class="form-group">
                                
                                <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold">글내용</h6>
                                </div>
                                <textarea rows="8" class="card-body form-control" name="bcontent"></textarea>
                                    </div>
                                </div>
                            <div class="form-group">
                                <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold">파일업로드</h6>
                                </div>
                            		<input type="file" name="bfile" class="card-body form-control">
                                    </div>
                                </div>
                                <input type="submit" class="btn btn-primary btn-user btn-block" value="글등록">
                            </form>
                            <hr>
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
<%@ include file="../includes/footer.jsp" %>