/**
 * 
 */
/* 글쓰기 게시판 로그인 확인*/
function boardLoginCheck(path,loginId){
	if(loginId==''){
		alert("로그인 후 이용해.");
		location.href =path+"/memberLoginForm";
	}
}