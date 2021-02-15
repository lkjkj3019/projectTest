<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp" %>
            <!-- Begin Page Content -->
            <div class="container-fluid">

               <!-- Page Heading -->
               <h1 class="h3 mb-2 text-gray-800">BoardModifyForm</h1>
               <p class="mb-4">boardModifyForm.jsp - action="boardModifyProcess"</p>
<div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">게시글 수정</h1>
                            </div>
                            <form class="user boardView" action="boardModifyProcess" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user"
                                         name="btitle" readonly="readonly" value="${dto.btitle }">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"
                                           name="bno" readonly="readonly" value="${dto.bno }">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"
                                           name="bwriter" readonly="readonly" value="${dto.bwriter }">
                                    </div>
                                </div>
                                <div class="form-group">
                                
                                <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold">글내용</h6>
                                </div>
                                <textarea rows="8" class="card-body form-control" name="bcontent">${dto.bcontent }</textarea>
                                    </div>
                                </div>
                                <input type="submit" class="btn btn-success" value="글수정 완료">
                                <button type="button" class="btn btn-danger" onclick="location.href='boardDelete?bno=${dto.bno }'">글삭제</button>
                                <button type="button" class="btn btn-info" onclick="location.href='boardList'">글목록</button>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
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
<%@ include file="../includes/footer.jsp" %>