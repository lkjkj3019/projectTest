<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp" %>
            <!-- Begin Page Content -->
            <div class="container-fluid">

               <!-- Page Heading -->
               <h1 class="h3 mb-2 text-gray-800">BoardView</h1>
               <p class="mb-4">boardView.jsp</p>
<div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <!-- <div class="col-lg-8" style="margin-left: auto; margin-left: auto;"></div> -->
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">게시글 상세페이지</h1>
                            </div>
                            <form class="user boardView">
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="exampleInputEmail"
                                         readonly="readonly" value="제목 : ${dto.btitle }">
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                           readonly="readonly" value="${dto.bno }번 글">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user" id="exampleLastName"
                                            readonly="readonly" value="작성자 : ${dto.bwriter }">
                                    </div>
                                </div>
                                <div class="form-group">
                                
                                <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold">글내용</h6>
                                </div>
                                <!-- 파일이 보이는 부분 -->
                                <img alt="사진 - 이미지" style="max-width: 100%; height: auto;" src="/resources/fileUpload/${dto.bfilename }">
                                <textarea rows="8" class="card-body form-control" readonly="readonly">${dto.bcontent }</textarea>
                                    </div>
                                </div>
                                <button type="button" class="btn btn-success" onclick="location.href='boardModify?bno=${dto.bno }'">글수정</button>
                                <button type="button" class="btn btn-info" onclick="location.href='boardList'">글목록</button>
                            </form>
                            <hr>
                            
                            <!-- 댓글 목록창 -->
                            <!-- commentList -->
                            <div id="commentArea">
                            	<%-- <c:forEach var="cList" items="${commentList }">
                            	<div class="form-group">
                                	<!-- Basic Card Example -->
                            	<div class="card shadow mb-4">
                                	<div class="card-header py-3">
                                    	<input type="text" class="form-control form-control-user col-sm-4" readonly="readonly" value="${cList.cwriter }">
                                	</div>
                                	<textarea rows="2" class="card-body form-control" readonly="readonly">${cList.ccontent }</textarea>
                                    	</div>
                                	</div>
                            	</c:forEach> --%>
                            </div>
                            <hr>
                            
                            <!-- 댓글 입력창 -->
                            <c:if test="${sessionScope.loginId != null }">
                            <div class="form-group">
                                <!-- Basic Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <input type="text" id="cwriter" class="form-control form-control-user col-sm-4" 
                                    		value="${sessionScope.loginId }" readonly="readonly">
                                </div>
                                <textarea rows="2" class="card-body form-control" id="ccontent" name="ccontent"></textarea>
                                    <button type="button" class="btn btn-info" id="commentsWriteBtn">댓글달기</button>
                                    </div>
                                </div>
                            </c:if>
                            
                            <div class="text-center">
                                <a class="small" href="memberLoginForm">로그인</a>
                                  <a class="small" href="memberJoinForm">회원가입</a>
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
		$(document).ready(function() {

         	printCommentList();

        	 /* 댓글 입력 */
				$("#commentsWriteBtn").click(function(){//아이디를 가진곳이 클릭이되면
					
					var cwriter = $("#cwriter").val();//다 아이디를 변수로 가져와
					if(cwriter=='') {
						alert("작성자를 입력해라.");
						$("#cwriter").focus();
						return;//아래내용을 확인도 안하고 종료시키는 것임ㅇㅇ
					}
					var ccontent = $("#ccontent").val();
					if(ccontent=='') {
						alert("내용을 입력해라.");
						$("#ccontent").focus();
						return;//아래내용을 확인도 안하고 종료시키는 것임ㅇㅇ
					}					

					var cbno = '${dto.bno }'; //어떤글에 댓글을 다는지 그 값을 가져와
					
					console.log(cwriter+"::"+ccontent+"::"+cbno);
					$.ajax({ //ajax는 비동기 처리모델 - 하나의 브라우저
						type : "post",
						url : "commentWrite",//주소 - 아래 데이터들을 이리로 전송
						data : {//insert작업후 모두 다 select를 진행해서 아래의 객체들을 검색
								"cwriter" : cwriter,//"dto",속성,키:var이부분,값,value
								"ccontent" : ccontent,
								"cbno" : cbno
								},
						dataType : "json",//이걸 사용할려면 pom에서 2가지 추가해줘야됨
						//JSON 데이터는 자바스크립트를 이용하여 데이터를 자바스크립트 객체로, 
						//자바스크립트 객체는 JSON 데이터로 손쉽게 변환할 수 있습니다.
						//서버로 부터 JSON 데이터가 전송되면 이 데이터는 문자열입니다.
						success : function(result){//입력처리 한번, 검색처리 한번을 할꺼다라는 뜻이래 씨벌
							//json으로 변환해서 전송
							console.log(result);

							//댓글달기를 누른후 댓글목록이 새로고침되서 출력되게
							commentList(result);
							$("#cwriter").val("");//댓글입력한게 댓글달기를 누르면 초기화를 시켜주는 아이
							$("#ccontent").val("");
						},
						error : function() {
							alert("실패");
						}
					});
				});		
			});

			
			/* 댓글 출력 */
			//댓글달기를 누른후 댓글목록이 새로고침되서 출력되게
			function commentList(result){
				console.log("commentList");
				var output = ' ';//내용이 없는 문자형식의 변수로 만들어서
				var loginId = '${sessionScope.loginId}';//삭제버튼을 위한 변수

				//위에 댓글목록을 위해
				for(var i in result){//위에 c태그와 같음
					var cwriter = result[i].cwriter;//cwrite는 result에 담겨있는 i객체에 cwriter를 가져온다.
					var ccontent = result[i].ccontent;
					var cno = result[i].cno;
					var profileImg = getImgName(cwriter);//작성자는 회원아이디랑 일치하니깐
					console.log("profileImg : " + profileImg);
					
					//위에꺼를 output에 쌓아주고 새로운 HTML객체로 보여주는거임ㅇㅇ
					output += "<div class='form-group'>";
					output += "<div class='card shadow mb-4'>";
					output += "<div class='card-header py-3'>";

					//댓글을 작성한 사람의 프로필이미지를 띄우기 위한 img 태그
					output += "<img class='img-profile rounded-circle' src='/resources/profileUpload/"+profileImg+"' style='max-width: 35px; max-height:35px;'>";
					output += "  <input type='text' style='display:inline-block' class='form-control form-control-user col-sm-4' readonly='readonly' value='"+cwriter+"'>";

					if(loginId == cwriter){
						output += "  <button class='btn btn-info btn-sm' onclick='commentDelete("+cno+")'>삭제</button>";
					}

					output += "</div>";
					output += "<textarea rows='2' class='card-body form-control' readonly='readonly'>"+ccontent+"</textarea>";
					output += "</div>";
					output += "</div>";
				}
				//쌓아논것을 이제 commentArea가 있는 위치에 출력하는
				$("#commentArea").html(output);
			}

			/*댓글출력시 작성자옆에 이미지 출력*/
			function getImgName(cwriter){
				var profileImgName = '';

				$.ajax({
					type : "post",
					url : "getProfile",
					data : {
						"mid" : cwriter//SELECT MFILENAME FROM MEMBERS WHERE mid
						},
					dataType : "text",
					async : false, //이 값이 없으면 기본값은 true를 가진다. 
						/*false로 설정하게되면 동기식방식으로 이제 ajax를 호출하여 서버에서 응답을 기다렸다가 
							응답을 모두 완료한 후 다음 로직을 실행하는 동기식으로 변경한 것입니다.*/
					success : function(result){
						console.log("result :: " + result);
						profileImgName = result;
						},
					error : function(){
					}
				});
				return profileImgName;
			}

			/* 댓글 새로고침 */
			function printCommentList(){
				console.log("printCommentList");
				$.ajax({
					type : "post",
					url : "commentList",//주소
					data : {//@ResponseBody이걸쓰고 데이터를 리턴해줬음
						"cbno" : '${dto.bno}'//댓글목록:글번호
						},
					dataType : "json",
					success : function(result) {//commentList를 받아와서 출력
						console.log(result);
						commentList(result);//화면에 html로 출력
					},
					error : function(){
						alert("연결 실패");	
					}
				});
			}

			
			/* 댓글 삭제 */
			function commentDelete(cno){//삭제버튼을 누르면
				console.log("commentDelete::" + cno);
				//1. 댓글 DELETE
				//2. 댓글목록 SELECT
				var cbno = '${dto.bno}';
				
				$.ajax({
					type : "post",
					url : "commentDelete",//controller주소
					data : {
						"cno" : cno,
						"cbno" : cbno //cbno는 bno랑 제약조건으로 묶여있음
						},
					dataType : "json",
					success : function(result){
						//3. 댓글 목록 출력
						alert("댓글이 삭제되었습니다.");
						commentList(result);
					},
					error : function(){
						alert("삭제 실패");
					}
				});
			}

			
</script>
<!-- footer보다 위에 있으면 됨 -->
         
         
<%@ include file="../includes/footer.jsp" %>