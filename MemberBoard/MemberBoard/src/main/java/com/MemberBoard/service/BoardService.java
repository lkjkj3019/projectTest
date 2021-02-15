package com.MemberBoard.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.MemberBoard.dto.BoardDTO;
import com.MemberBoard.dto.CommentsDTO;
import com.MemberBoard.dto.PageDTO;
import com.MemberBoard.mapper.BoardMapper;
import com.MemberBoard.mapper.CommentsMapper;

@Service
public class BoardService {

	private ModelAndView mav;
	
	@Autowired
	private BoardMapper boardMapper;
	@Autowired//따로 줘야됨 안그럼 에러뜨더라..
	private CommentsMapper commentsMapper;
	
	
	//게시판 목록 - 댓글갯수 출력
	public ModelAndView boardList() {
		mav = new ModelAndView();
		
		ArrayList<BoardDTO> boardList = boardMapper.boardList();//리스트 모든걸 검색하고 ArrayList[i]에 차곡차곡 저장
		
		//밑에 주석은 순서를 나타낸거
		//int commentCnt = commentsMapper.commentCnt(boardList.get(i).getBno());이부분
		//boardList.get(0).getBno(); - 0번째에 댓글번호저장
		//댓글 갯수는 COMMENTS테이블에 select count(*) from comments where cbno=? - 글번호를 카운트
		//boardList.get(0).setCommentCnt(count);
		
		//boardList.get(1).getBno(); - 다시 돌아와서 1번인덱스에 넣고
		//댓글 갯수는 COMMENTS테이블에 count(BNO);
		//boardList.get(1).setCommentCnt(count);
		
		for(int i = 0; i<boardList.size(); i++) {
			int commentCnt = commentsMapper.commentCnt(boardList.get(i).getBno());
			boardList.get(i).setCommentCnt(commentCnt);
		}
		System.out.println(boardList);
		
		mav.addObject("boardList", boardList);
		mav.setViewName("board/boardList"); //페이지가 있는 경로
		return mav;
	}
	
	
	//게시판 페이징출력
	public ModelAndView boardListPaging(int page) {
		mav = new ModelAndView();
		
		int pageLimit = 3;//한페이지에서 보여주는 글의 갯수
		int pageNumLimit = 2;//한페이지에 보여줄 페이지 번호 갯수
		
		int startRow = (page - 1) * pageLimit + 1;//한페이지에 보여줄수있는 첫페이지 번호
		int endRow = page * pageLimit; //한페이지에 보여줄수있는 끝페이지 번호
		
		PageDTO pagedto = new PageDTO();
		pagedto.setStartrow(startRow);//리스트중에 화면에 처음 노출되는 글(행)번호
		pagedto.setEndrow(endRow);//리스트중에 화면에 끝 노출되는 글(행)번호
		
		ArrayList<BoardDTO> boardList = boardMapper.boardListPaging(pagedto);
		System.out.println(boardList);
		
		//전체글의 갯수를 가져오자.
		int boardListCnt = boardMapper.getBoardListCnt();
		
		//최대로 보여줄수있는 페이지값
		int maxPage = (int)(Math.ceil( (double)boardListCnt/pageLimit));
		//boardListCnt를 double로 형변화하고 (총글수/3)를 나타낸거임
		
		int startPage = ((int)(Math.ceil((double)page/pageNumLimit)) -1) * pageNumLimit + 1;
		//page를 double로 형변환하고 (page수/3)-1)*+1
		
		int endPage = startPage + pageNumLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		pagedto.setPage(page);
		pagedto.setStartpage(startPage);
		pagedto.setEndpage(endPage);
		pagedto.setMaxpage(maxPage);
		
		//글목록에 보여주는 댓글갯수
		for(int i = 0; i<boardList.size(); i++) {
			int commentCnt = commentsMapper.commentCnt(boardList.get(i).getBno());
			boardList.get(i).setCommentCnt(commentCnt);
		}
		
		mav.addObject("boardList", boardList);//이안에는 댓글 갯수도 포함이 되어있음ㅇㅇ
		mav.addObject("pagedto", pagedto);
		mav.setViewName("board/boardListPaging");//경로
		
		return mav;
	}

	
	//게시판 작성
	public ModelAndView boardWrite(BoardDTO dto, RedirectAttributes ra) {
		mav = new ModelAndView();
		//글번호 생성
		int nextBno = boardMapper.getMaxBno()+1; //현재있는 글번호에서 하나를 증가시킨다아
		dto.setBno(nextBno);
		
		//BOARD 테이블에 INSERT
		int boardInsert = boardMapper.boardWrite(dto);
		System.out.println("boardInsert : " + boardInsert);
		
		//RedirectAttributes가 제공하는 메소드 addFlashAttribute()
		//addFlashAttribute()는 리다이렉트 직전 플래시에 저장하는 메소드다. 
		//리다이렉트 이후에는 소멸한다.
		ra.addFlashAttribute("bno", nextBno);
		ra.addFlashAttribute("message", "등록 "); //madal창에 글을 띄우기 위해서 쓴다
		mav.setViewName("redirect:/boardList"); //주소창에 boardList라는 창으로 이동
		
		return mav; 
	}

	
	//게시판 상세/조회수
	public ModelAndView boardView(int bno) {
		mav = new ModelAndView();
		
		//조회수 1 증가 (update)
		boardMapper.updateBhit(bno);
		
		BoardDTO dto = boardMapper.boardView(bno);
		
		//글번호bno에 작성된 댓글 리스트
		//ArrayList<CommentsDTO> commentList;
		//commentList = commentsMapper.commentList(bno);
		//System.out.println(commentList);
		
		mav.addObject("dto",dto); //ModelAndView를 사용할때 
		//그러면서 페이지jsp에서 저장된 데이터를 불러올 일이 생길때
		//mav.addObject("commentList", commentList); //글번호bno에 작성된 댓글 리스트
		mav.setViewName("board/boardView"); //페이지로 이동
		return mav;
	}
	
	
	//게시판 수정페이지
	public ModelAndView boardModify(int bno) {
		mav = new ModelAndView();
		
		BoardDTO dto = boardMapper.boardView(bno);
		
		mav.addObject("dto",dto);
		mav.setViewName("board/boardModifyForm");
		
		return mav;
	}

	
	//게시판 수정
	public ModelAndView boardModifyProcess(BoardDTO dto) {
		mav = new ModelAndView();
		
		int boardUpdate = boardMapper.boardModifyProcess(dto);
		System.out.println("boardUpdate : " + boardUpdate);
		
		mav.setViewName("redirect:/boardView?bno=" + dto.getBno());
		//redirect : 웹 브라우저에게 다른 페이지로 이동하라고 명령을 내립니다. 
		//그러면 웹 브라우저는 URL을 지시된 주소로 바꾸고 해당 주소로 이동합니다.
		return mav;
	}

	
	//게시판 삭제
	public ModelAndView boardDelete(int bno, RedirectAttributes ra) {
		mav = new ModelAndView();
		
		//파일을 삭제하는 기능추가
		//bno에 해당하는 BFILENAME SELECT
		String bfilename = boardMapper.getBfileName(bno);
		String savaPath = "C:\\Users\\user\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\MemberBoard\\src\\main\\webapp\\resources\\fileUpload\\";
		File file = new File(savaPath+bfilename);
		file.delete();//파일 삭제
		
		//글삭제버튼을 누르면 가장먼저 댓글 삭제가 실행될 수있게 위에다가 적어
		//글에 담겨있는 모든 댓글 삭제하는 기능추가
		//COMMENTS 테이블의 글번호가 bno레코드 삭제
		int allCommentDelete = commentsMapper.allCommentDelete(bno);
		System.out.println("allCommentDelete : " + allCommentDelete);
		
		int boardDelete = boardMapper.boardDelete(bno);
		System.out.println("boardDelete : " + boardDelete);
		ra.addFlashAttribute("bno", bno);
		
		ra.addFlashAttribute("message", "삭제 "); //삭제가 되면 알림message이 뜨는데 삭제하는 번호확인
		
		mav.setViewName("redirect:/boardList");
		return mav;
	}

	
	//게시판 부분 검색
	public ModelAndView boardSearch(String searchType, String keyWord) {
		mav = new ModelAndView();
		
		ArrayList<BoardDTO> boardList = null;
		
		/* mapper.xml의 있는 내용이랑 같은거임
		if(searchType.equals("searchBtitle")) {//검색창에 제목이 검색되면 검색이 나오고
			//like %keyWord%
			//mapper에서 하는게 어려우면 밑에처럼 해주면됨
			keyWord = "%"+keyWord+"%"; //1. '%등록%' 이렇게 묶어서 아예 설정
			boardList = boardMapper.search1(keyWord);//2. mapper에 keyWord로 보내준다아
		} else if (searchType.equals("searchBwriter")) {//검색창에 작성자가 검색되면 작성자가 나오고
			boardList = boardMapper.search2(keyWord);
		}
		*/
		
		//또는? 동시에 여러개를 보내줄때는
		//searchType,keyWord를 담을 자료형 객체를 생성
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType); //key=속성명, value=속성이름에 담긴 문자열
		map.put("keyWord", keyWord);
		
		boardList = boardMapper.boardSearch(map);
		
		mav.addObject("boardList", boardList);
		mav.setViewName("board/boardList"); //리스트페이지로 이동시켜
		return mav;
	}


	//게시판 파일 업로드
	public ModelAndView boardWriteFile(BoardDTO dto, RedirectAttributes ra) throws IllegalStateException, IOException {
		mav = new ModelAndView();
		
		UUID uuid = UUID.randomUUID();//파일이름들을 랜덤으로 주어지게 해줌 중복안돼게
		System.out.println(uuid.toString());
		
		MultipartFile bfile = dto.getBfile();//bfile만 같은 타입의 객체로 끄집어 낸거임
		String bfilename = uuid.toString() + "_" + bfile.getOriginalFilename();//bfile에 저장되어있는 원본파일이름을 추출해냄
		//원본이름에 랜덤이름이 붙어진다.
		System.out.println("bfilename : " + bfilename);//업로드한 파일 이름 출력
		
		//맨뒤에 \\이거 안붙이면 파일 안들감!!
		String savePath = "C:\\Users\\user\\Documents\\workspace-spring-tool-suite-4-4.8.1.RELEASE\\MemberBoard\\src\\main\\webapp\\resources\\fileUpload\\";
		
		if(!bfile.isEmpty()) {//isEmpty():파일이 비어있으면 true 파일이 있으면 false - !:반대로 했기때문에 앞에 부분도 반대가됨
			//true 안에 파일이 있으면
			bfile.transferTo(new File(savePath+bfilename));//transferTo:저장된 파일을 여기에 넣겠다
		}
		dto.setBfilename(bfilename);
		//글번호 생성 및 저장
		int nextBno = boardMapper.getMaxBno()+1;
		dto.setBno(nextBno);
		
		//BOARD 테이블에 INSERT
		int boardinsert = boardMapper.boardFile(dto);
		System.out.println("boardinsert : " + boardinsert);
		
		ra.addFlashAttribute("bno",nextBno);
		ra.addFlashAttribute("message","등록(파일) ");
		mav.setViewName("redirect:/boardList");
		
		return mav;
	}


	//작성자 선택후 게시글 검색
	public ModelAndView boardListMember(String bwriter) {
		mav = new ModelAndView();
		
		//글목록 받아오기
		ArrayList<BoardDTO> boardList = boardMapper.boardListMember(bwriter);
		
		//글에 대한 댓글 가져오기
		for(int i=0; i<boardList.size(); i++) {
			int cnt = commentsMapper.commentCnt(boardList.get(i).getBno());
			boardList.get(i).setCommentCnt(cnt);
		}
		
		mav.addObject("boardList", boardList);
		mav.setViewName("board/boardList");
		
		return mav;
	}


	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
