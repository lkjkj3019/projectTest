<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp" %>






<script type="text/javascript">

	var loginId = '${sessionScope.loginId}';
	var path = '${pageContext.request.contextPath}';
	boardLoginCheck('${pageContext.request.contextPath}',loginId);
	//boardLoginCheck(path,loginId);
	
	
	/* if(loginId ==''){
		alert("로그인 후 이용해.");
		location.href = "${pageContext.request.contextPath}"+"/memberLoginForm";
	} */
	
</script>







            <!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">MemberView</h1>
	<p class="mb-4">memberView.jsp</p>
	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-7"
						style="margin-left: auto; margin-right: auto;">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">${memdto.mid}님 의 회원정보</h1>
							</div>

							<form action="memberJoin" method="post">

								<!-- 아이디 -->
								<div class="form-row">
									<div class="form-group col-md-6">
										<label class="small mb-1" for="inputid">아이디</label>
										<input type="text" class="form-control" id="inputid"
												value="${memdto.mid }" readonly="readonly">
									</div>

									<!-- 비밀번호-->
									<div class="form-group col-md-6">
										<label class="small mb-1" for="Checkpw">비밀번호</label> 
										<input type="password" class="form-control" id="Checkpw"
												value="${memdto.mpassword }" readonly="readonly">
									</div>
								</div>
								<hr>

								<!-- 이름 -->
								<div class="form-row">
									<div class="form-group col-md-6">
										<label class="small mb-1" for="inputMname">이름</label> 
										<input type="text" class="form-control" id="inputMname"
												value="${memdto.mname }" readonly="readonly">
									</div>

									<!-- 전화번호 -->
									<div class="form-group col-md-6">
										<label class="small mb-1" for="inputMphone" id="mphoneLabel">전화번호</label> 
											<a href="#" class="badge badge-primary me-3" onclick="mphoneUpdate()"  id="mphoneUpdateBtn"> 수정</a>
										<input type="text" class="form-control form-control-user"
												value="${memdto.mphone }" id="inputMphone" readonly="readonly">
									</div>
								</div>

								<!-- 이메일 -->
								<div class="form-row">
									<div class="form-group col-md-6">
										<label class="small mb-1" for="inputMemail" id="memailLabel">이메일</label> 
											<a href="#" class="badge badge-primary me-3" onclick="memailUpdate()" id="memailUpdateBtn">수정</a>
										<input type="text" class="form-control" id="inputMemail"
												value="${memdto.memail }" readonly="readonly">
									</div>

									<!-- 생년월일 -->
									<div class="form-group col-md-6">
										<label class="small mb-1" for="inputMbirth">생년월일</label> 
										<input type="date" class="form-control" id="inputMbirth"
												value="${memdto.mbirth }" readonly="readonly">
									</div>
								</div>
								<hr>

								<!-- 주소 -->
								<div class="form-group">
									<label class="small mb-1" for="madd">주소</label> 
									<input type="text" class="form-control" id="madd"
											value="${memdto.madd }" readonly="readonly">
								</div>
								<hr>
								
								<button type="button" class="btn btn-primary" onclick="toggleprofile()">프로필</button>

							</form>
							<hr>
							
					<!-- 프로필 -->
				<form action="fileUpdate" method="post" enctype="multipart/form-data" style="display: none;" id="profileUploadForm">
					<!-- 프로필(이미지) -->
					<div class="form-row">
						<div class="form-group col-md-6">
							<!-- 프로필 이미지 출력부분 -->
							<img class="img-profile rounded-circle" src="/resources/profileUpload/${memdto.mfilename }" style="max-width: 50%;">
						</div>

						<!-- 프로필(파일선택) -->
						<div class="form-group col-md-6">
							<label class="small mb-1" for="mfile">이미지</label> 
							<input type="hidden" name="mid" value="${memdto.mid }">
							<!-- hidden : 사용자에게는 보이지 않는 숨겨진 입력 필드를 정의
									(form을 submit할때 name의 속성값이 파라미터로 넘어가게 됨 ) -->
							<input type="file" class="form-control" id="mfile" name="mfile"><br>
							<button type="submit" class="btn btn-primary btn-user btn-block">확인</button>
						</div>
					</div>
				</form>
					<!-- 프로필 -->
					
						<div class="text-center">
                            <a class="btn btn-warning" href="memberList">뒤로가기</a>
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
       
       
<script type="text/javascript">

	//프로필 이미지 업로드
	function toggleprofile(){
		$("#profileUploadForm").toggle();
	}












	//전화번호
	//수정버튼
	function mphoneUpdate(){
		console.log("mphoneUpdate() 실행.");
		/*
		<button type="button" class="badge badge-primary me-3" onclick="">확인</button>
		<button type="button" class="badge badge-primary me-3" onclick="">취소</button>
		*/

		var output = "<a href='#' class='badge badge-primary me-3 mphoneBtn' onclick='mphoneUpdateCheck(true)'>확인</a>";
		output += "  <a href='#' class='badge badge-primary me-3 mphoneBtn' onclick='mphoneUpdateCancel(false)'>취소</a>";
		
		$("#inputMphone").removeAttr("readonly").after(output);
		$("#mphoneUpdateBtn").remove();
	}

	
	//전화번호수정후 - 확인버튼 - 수정완료
	function mphoneUpdateCheck(check){
		console.log("mphoneUpdateCheck() 실행::" + check);

		if(check){
			//.ajax를 통한 update 수행
			var mid = '${memdto.mid }'; //수정할때 정보확인을 위한 아이디변수
			var newphone = $("#inputMphone").val(); //수정할 아이
			console.log(mid+"::"+newphone);

			var mphone = '${memdto.mphone }';//원래번호
			$.ajax({
					type : "post",
					url : "updateMphone", //수정경로
					data : { //변수를 가져와
						"mid" : mid,
						"mphone" : newphone,
					},
					dataType : "text",
					success : function(updateResult){
						if(updateResult=="OK"){
							alert("전화번호 변경성공.");
						} else {
							alert("변경실패.");
							$("#inputMphone").val(mphone);//이부분을 넣으면 수정에 실패를 하면 원래번호로 되돌아간다.
						}
					},
					error : function(){
						alert("mphoneUpdate 연결 실패.");
						$("#inputMphone").val(mphone);//이부분을 넣으면 수정에 실패를 하면 원래번호로 되돌아간다.
					}
			});
		}

		var output = "<a href='#' class='badge badge-primary me-3' onclick='mphoneUpdate()' id='mphoneUpdateBtn'>수정</a>";

		$("#inputMphone").attr("readonly","readonly");
		$("#mphoneLabel").after(output);
		$(".mphoneBtn").remove();
	}

	//취소버튼
	function mphoneUpdateCancel(check){
		console.log("mphoneUpdateCancel() 실행::" + check);

		var output = "<a href='#' class='badge badge-primary me-3' onclick='mphoneUpdate()' id='mphoneUpdateBtn'>수정</a>";

		$("#inputMphone").attr("readonly","readonly");
		$("#mphoneLabel").after(output);
		$(".mphoneBtn").remove();
	}



	
	//이메일
	//수정버튼
	function memailUpdate(){
		console.log("memailUpdate() 실행.");

		var output = "<a href='#' class='badge badge-primary me-3 memailBtn' onclick='memailUpdateCheck(true)'>확인</a>";
		output += "  <a href='#' class='badge badge-primary me-3 memailBtn' onclick='memailUpdateCheck(false)'>취소</a>";
		
		$("#inputMemail").removeAttr("readonly").after(output);
		$("#memailUpdateBtn").remove();
	}


	//이메일수정후 - 확인버튼 - 수정완료
	function memailUpdateCheck(check){
		console.log("memailUpdateCheck() 실행::" + check);

		if(check){
			//.ajax를 통한 update 수행
			var mid = '${memdto.mid }'; //수정할때 정보확인을 위한 아이디변수
			var newemail = $("#inputMemail").val(); //수정할 아이
			console.log(mid+"::"+newemail);

			var memail = '${memdto.memail }';//원래 이메일
			$.ajax({
					type : "post",
					url : "updateMemail", //수정경로
					data : { //변수를 가져와
						"mid" : mid,
						"memail" : newemail,
					},
					dataType : "text",
					success : function(updateResult){
						if(updateResult=="OK"){
							alert("이메일 변경성공.");
						} else {
							alert("변경실패.");
							$("#inputMemail").val(mphone);//이부분을 넣으면 수정에 실패를 하면 원래번호로 되돌아간다.
						}
					},
					error : function(){
						alert("memailUpdate 연결 실패.");
						$("#inputMemail").val(memail);//이부분을 넣으면 수정에 실패를 하면 원래번호로 되돌아간다.
					}
			});
		}

		var output = "<a href='#' class='badge badge-primary me-3' onclick='memailUpdate()' id='memailUpdateBtn'>수정</a>";

		$("#inputMemail").attr("readonly","readonly");
		$("#memailLabel").after(output);
		$(".memailBtn").remove();
	}
			
</script>  
	
         

<%@ include file="../includes/footer.jsp" %>

