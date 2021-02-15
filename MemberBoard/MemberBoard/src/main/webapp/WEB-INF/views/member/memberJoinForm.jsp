<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp" %>
            <!-- Begin Page Content -->
            <div class="container-fluid">

               <!-- Page Heading -->
               <h1 class="h3 mb-2 text-gray-800">MemberJoinForm</h1>
               <p class="mb-4">memberJoinForm.jsp</p>
<div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <!-- <div class="col-lg-5 d-none d-lg-block bg-register-image"></div> -->
                    <div class="col-lg-7" style="margin-left: auto; margin-right: auto;">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입 해.</h1>
                            </div>
                            
                            <form action="memberJoin" method ="post">
                            
                            <!-- 아이디 -->
                                <div class="form-group">
                                <label class="small mb-1" for="inputMid">아이디 <span id="idCheckMsg"></span></label>
                                    <input type="text" class="form-control" id="inputMid" name="mid" placeholder="아이디 입력">
                                </div>
                                
                            <!-- 비밀번호 -->
                                <div class="form-row">
                                    <div class="form-group col-sm-6">
                                    <label class="small mb-1" for="inputMpassword">비밀번호 <span id="pwCheckMsg"></span></label>
                                        <input type="text" class="form-control" id="inputMpassword" name="mpassword" placeholder="비밀번호 입력">
                                    </div>
                                    
                             <!-- 비밀번호 확인 -->    
                                    <div class="form-group col-sm-6">
                                    <label class="small mb-1" for="Checkpw">비밀번호 확인<span id="pwConFirmMsg"></span></label>
                                        <input type="password" class="form-control" id="Checkpw" placeholder="비밀번호 확인">
                                    </div>
                                </div>
                                <hr>
                                
                             <!-- 이름 -->
                                <div class="form-row">
                                <div class="form-group col-sm-6">
                                	<label class="small mb-1" for="inputMname">이름</label>
                                    <input type="text" class="form-control" id="inputMname" name="mname" placeholder="이름 입력">
                                </div>
                                
                             <!-- 전화번호 -->
                                 <div class="form-group col-sm-6">
                                    <label class="small mb-1" for="inputMname">전화번호</label>
                                    <input type="text" class="form-control form-control-user" id="inputMname" name="mphone" placeholder="전화번호 입력">
                                 </div>
                                    
                             <!-- 이메일 -->
                                 <div class="form-row">
                                	<div class="form-group col-md-4">
                                		<label class="small mb-1" for="inputMemail">이메일</label>
                                    	<input type="text" class="form-control" id="inputMemail" name="memailid" placeholder="이메일 입력">
                                	</div> 
                                	
                                	<div class="form-group col-md-1">
                                    	<label class="small mb-1" for="inputMemail"></label>
                                    	<span class="form-control" style="border: none;"> @</span>
                                    </div>
                                    
                                   	<div class="form-group col-md-4">
                                    	<label class="small mb-1" for="inputlDomain">도메인</label>
                                        <input type="text" class="form-control" id="inputlDomain" name="mdomain" placeholder="도메인 입력">
                                    </div>
                                    <div class="form-group col-md-3">
                                    	<label class="small mb-1"></label>
                                    	<select id="domainSel" class="form-control">
                                    		<option class="form-control" value="직접입력">직접입력</option>
                                    		<option class="form-control" value="naver.com">naver.com</option>
                                    		<option class="form-control" value="gmail.com">gmail.com</option>
                                    		<option class="form-control" value="doum.net">doum.net</option>
                                    	</select>
                                    </div>
                                </div>
                                </div>
                                
                                <!-- 생년월일 -->
                                <div class="form-row">
                                <div class="form-group col-sm-6">
                                	<label class="small mb-1" for="inputMbirth">생년월일</label>
                                    <input type="date" class="form-control" id="inputMbirth" name="mbirth">
                                </div>
                                </div>
								<hr>
								
								<!-- 주소 -->                                
                                <div class="form-row">
                                <!-- 우편번호 -->
                                	<div class="form-group col-sm-6">
                                		<label class="small mb-1" for="sample6_postcode">우편번호</label>
                                		<input class="form-control" type="text" id="sample6_postcode" name="mpost" placeholder="우편번호">
                                	</div>
                                	<div class="form-group col-sm-6">
                                		<label class="small mb-1">우편번호 찾기</label>
                                		<input class="form-control btn btn-light btn-icon-split" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                                	</div>
                                	
                                	<!-- 주소입력되는 -->
                                	<div class="form-group col-sm-6">
                                		<label class="small mb-1" for="sample6_address">주소</label>
                                		<input class="form-control" type="text" id="sample6_address" name="maddr" placeholder="주소">
                                	</div>
                                	
                                	<!-- 참고항목 -->
                                	<div class="form-group col-sm-6">
                                		<label class="small mb-1" for="sample6_extraAddress">참고항목</label>
                                		<input class="form-control" type="text" id="sample6_extraAddress" name="mexadd" placeholder="참고항목">
                                	</div>
                                	
                                </div>
                                	<!-- 상세주소 -->
                                	<div class="form-group">
                                		<label class="small mb-1" for="sample6_detailAddress">상세주소</label>
                                    	<input type="text" class="form-control" id="sample6_detailAddress" name="mdetail" placeholder="상세주소">
                                	</div>
                                
                                <!-- Basic Card Example -->
                            
                            <input type="submit" class="btn btn-primary btn-user btn-block" value="회원가입">
                            
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
         
	<script type="text/javascript">
			$(document).ready(function(){

				/* 이메일(도메인) 선택을 누르면 입려창에 들어가지게하는 */
				$("#domainSel").change(function(){
					var domain = $("#domainSel").val();
					$("#inputlDomain").val(domain);
				});

				
				/* 비밀번호 확인 */
				$("#Checkpw").keyup(function(){
					var Checkpw = $("#Checkpw").val();
					var inputMpassword = $("#inputMpassword").val();

					if(inputMpassword=='') {
						alert("비밀번호가 입력되지 않았어.");
						$("#Checkpw").val("");
						$("#inputMpassword").focus();
						return;
					}
					
					if(Checkpw == inputMpassword) {
						/* 일치 */
						$("#pwConFirmMsg").css("color","green").text(" 비밀번호 일치함");
					}else{
						/* 불일치 */
						$("#pwConFirmMsg").css("color","red").text(" 비밀번호 불일치함");
					}
				});


				/* 아이디 사용가능 여부 확인 */
				$("#inputMid").keyup(function(){
					var inputMid = $("#inputMid").val();

					$.ajax({
						type : "post",
						url : "idCheck",
						data : {
								"inputMid":inputMid
						},
						dataType : "text",
						success : function(result){
							console.log("result : " + result);
							if(result=="OK"){
								$("#idCheckMsg").css("color","green").text(" 사용가능함");
							} else {
								$("#idCheckMsg").css("color","red").text(" 사용불가능함");
							}
						},
						error : function(){
							alert("idCheck 연결실패.");
						}
					});
				});
				
			});
         
	</script>
         

<%@ include file="../includes/footer.jsp" %>

