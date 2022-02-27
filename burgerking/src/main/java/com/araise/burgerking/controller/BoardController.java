package com.araise.burgerking.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.araise.burgerking.service.BoardService;
import com.araise.burgerking.vo.BoardVO;
import com.araise.burgerking.vo.SearchCriteria;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/writeView.do", method = RequestMethod.GET)
	public String writeView() throws Exception{
		logger.info("writeView");
		
		return "board/writeView";
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String write(BoardVO boardVO) throws Exception{
		logger.info("write");
		
		boardService.write(boardVO);
		
		return "redirect:/board/list.do";
	}
	
	//게시판 목록 조회
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(Model model,@ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("list");
		
		PaginationInfo pagination = new PaginationInfo();
		
		pagination.setRecordCountPerPage(20);
		pagination.setPageSize(10);
		pagination.setCurrentPageNo(scri.getPage());
		pagination.setTotalRecordCount(boardService.listCount(scri));
		
		scri.setRowStart(pagination.getFirstRecordIndex()+1);
		scri.setRowEnd(pagination.getLastRecordIndex());

		List<BoardVO> list = boardService.list(scri);
		model.addAttribute("list", list);
		
		model.addAttribute("pagination", pagination);
		
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(scri);
//		pageMaker.setTotalCount(boardService.listCount(scri));
		
//		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list";
	}
	
	//게시글 조회뷰
	@RequestMapping(value = "/readView.do", method = RequestMethod.GET)
	public String read(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("read");
		
		model.addAttribute("read", boardService.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		return "board/readView";
	}
	
	// 게시판 수정뷰
	@RequestMapping(value = "/updateView.do", method = RequestMethod.POST)
	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("updateView");
		
		model.addAttribute("update", boardService.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		return "board/updateView";
	}
	
	// 게시판 수정
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String update(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("update");
		
		boardService.update(boardVO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list.do";
	}

	// 게시판 삭제
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String delete(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("delete");
		
		boardService.delete(boardVO.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list.do";
	}
	
}