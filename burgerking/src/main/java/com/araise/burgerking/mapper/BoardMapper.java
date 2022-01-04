package com.araise.burgerking.mapper;

import java.util.List;

import com.araise.burgerking.vo.BoardVO;
import com.araise.burgerking.vo.SearchCriteria;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("boardMapper")
public interface BoardMapper {

	/**
	 * 게시글 작성
	 * @param boardVO
	 * @throws Exception
	 */
	public void write(BoardVO boardVO) throws Exception;
	
	/**
	 * 게시글 목록 조회 
	 * @param scri
	 * @return List<BoradVO>
	 * @throws Exception
	 */
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	/**
	 * 게시물 총 갯수
	 * @param scri
	 * @return
	 * @throws Exception
	 */
	public int listCount(SearchCriteria scri) throws Exception;
	
	/**
	 * 게시물 조회
	 * @param bno
	 * @return BoardVO
	 * @throws Exception
	 */
	public BoardVO read(int bno) throws Exception;
	
	/**
	 * 게시물 수정
	 * @param boardVO
	 * @throws Exception
	 */
	public void update(BoardVO boardVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;
	
	// 게시판 조회수
	public void boardHit(int bno) throws Exception;
}
