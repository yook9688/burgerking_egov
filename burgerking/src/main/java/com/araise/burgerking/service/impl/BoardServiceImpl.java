package com.araise.burgerking.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.araise.burgerking.mapper.BoardMapper;
import com.araise.burgerking.service.BoardService;
import com.araise.burgerking.vo.BoardVO;
import com.araise.burgerking.vo.SearchCriteria;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;

	@Override
	public void write(BoardVO boardVO) throws Exception {
		
		boardMapper.write(boardVO);
		
	}

	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		
		return boardMapper.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return boardMapper.listCount(scri);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(int bno) throws Exception {
			boardMapper.boardHit(bno);
		return boardMapper.read(bno);
	}

	@Override
	public void update(BoardVO boardVO) throws Exception {

		boardMapper.update(boardVO);
		
	}

	@Override
	public void delete(int bno) throws Exception {

		boardMapper.delete(bno);
		
	}
}
