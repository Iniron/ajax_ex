package com.bbs;

import java.util.List;

public interface BoardDAO {
	public int insertBoard(BoardDTO dto);		//게시판에 글을 올리기 위한 메소드
	public int dataCount();						//검색이 아닌 상태에서의 개수
	public int dataCount(String searchKey, String searchValue);			//검색인 상태에서의 개수
	public List<BoardDTO> listBoard(int start, int end);				//검색이 아닐때 가져오는 방법
	public List<BoardDTO> listBoard(int start, int end, String searchKey, String searchValue);	//검색일 때 가져오는 방법	
	public int updateHitCount(int num);												//조회수 증가
	public BoardDTO readBoard(int num);												//게시물을 가져오는 방법
	public BoardDTO preReadBoard(int num, String searchKey, String searchValue);	//이전글
    public BoardDTO nextReadBoard(int num, String searchKey, String searchValue);	//다음글
	public int updateBoard(BoardDTO dto);											//수정
	public int deleteBoard(int num);												//삭제
	
	public int insertReply(ReplyDTO dto);							//리플저장용
	public int dataCountReply(int num);								//리플의 개수
	public List<ReplyDTO> listReply(int num, int start, int end);	//리플의 리스트용
	public int deleteReply(int replyNum);							//리플 삭제용
}
