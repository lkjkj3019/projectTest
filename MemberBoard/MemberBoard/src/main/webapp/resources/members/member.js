/**
 * 
 */
 
 

	function memberLoginCheck(loginId){
		console.log("memberLoginCheck() 실행");
		console.log("loginId::"+loginId);
			if(loginId ==''){
				console.log("비로그인 상태.");
				return;
			}
			console.log("로그인상태.");
			loginProfile(loginId);
			getMessage(loginId);
	}		
		
		
		/* 메시지 리스트 가져와 */
		function getMessage(loginId){
			console.log(loginId + "메시지 확인");
			$.ajax({
				type : "post",
				url : "receiveMsg",
				data : {
					"msg_receiveid" : loginId
				},
				dataType : "json",
				success : function(msgList){
					console.log("msgList::"+msgList);
					printMsg(msgList);
				},
				error : function(){
					 alert("연결실패.");
				}
			});
		}
			
			
		/* 메세지 리스트 출력 */
		function printMsg(msgList){
			console.log("printMsg() 실행.");
			
			var output = '';
			var msgCount = msgList.length;
                                    
			for (var i in msgList){
				var msg_sendid = msgList[i].msg_sendid;//보내는 아이디
				var msg_content = msgList[i].msg_content;
				
				var profileImg = getImgName(msg_sendid);
				var msg_receiveid = msgList[i].msg_receiveid;//받는 아이디
				var msg_date = msgList[i].msg_date;
				
				console.log(msg_sendid+"::"+msg_content+"::"+msg_receiveid+"::"+msg_date);
				
				output += "<a class='dropdown-item d-flex align-items-center' href='#' onclick='checkMsg(\""+msg_receiveid+"\",\""+msg_sendid+"\",\""+msg_date+"\")'>";
				output += "<div class='dropdown-list-image mr-3'>";
				output += "<img class='rounded-circle' src='/resources/profileUpload/"+profileImg+"'>";
				output += "<div class='status-indicator bg-success'></div>";
				output += "</div>";
				output += "<div class='font-weight-bold'>";
				output += "<div class='text-truncate'>"+msg_content+"</div>";
				output += "<div class='small text-gray-500'>"+msg_sendid+"</div>";
				output += "</div>";
				output += "</a>";
			}
			$("#msgArea").html(output);
			$("#msgCount").text(msgCount);
		}
		
		
		/* 읽지않은 메세지 클릭 - 읽음으로 변경 */
		function checkMsg(msg_receiveid,msg_date,msg_sendid){
			console.log(msg_receiveid+"::"+msg_sendid+"::"+msg_date);
			$.ajax({
				type : "post",
				url : "checkUpdate",
				data : {
					"msg_receiveid" : msg_receiveid,
					"msg_sendid" : msg_sendid,
					"msg_date" : msg_date
				},
				dataType : "text",
				async : false,
				success : function(result){
					console,log("result::" + result);
					getMessage(msg_receiveid);
				}
			});
		}
		
		
		/* 메세지 옆 프로필 이미지출력 */
		function getImgName(msg_sendid){
			console.log("getImgName() 실행");
			var profileImg = "";
			
			$.ajax({
				type : "post",
				url : "getImgName",
				data : {
					"mid" : msg_sendid
				},
				dataType : "text",
				async : false, //이걸 꼭 넣어줘야됨
				success : function(imgName) {
					profileImg = imgName;
				}
			});
			return profileImg;
		}
		
		
		/* 프로필 이미지 가져와 */
		function loginProfile(loginId){
		console.log(loginId + "프로필 확인");
		$.ajax({
				type : "post",
				url : "getProfile",
				data : {
						"mid" : loginId
					},
				dataType : "text",
				success : function(profileImg) {
					console.log("profileImg::"+profileImg);	
					$("#mprofileImg").attr("src","/resources/profileUpload/"+profileImg);
					//파일명이 있으면 실행을 하고 파일명이 x 실행을 안한다.	
				},
				error : function(){
					 alert("연결실패.");
				}	
		});
	}

