package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.board.domain.BoardVo;
import com.board.mapper.BoardMapper;
import com.board.menus.domain.MenuVo;
import com.board.menus.mapper.MenuMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/Board")
public class BoardController {

	@Autowired
	private   MenuMapper    menuMapper;
	
	@Autowired
	private   BoardMapper   boardMapper;
	
	//  /Board/List?menu_id=MENU01
	@RequestMapping("/List")
	public   ModelAndView   list(MenuVo  menuVo) {
		
		log.info("menuVo : {}", menuVo );
		
		// 메뉴 목록
		List<MenuVo>  menuList   =  menuMapper.getMenuList();
		
		// 게시물 목록
		List<BoardVo> boardList  =  boardMapper.getBoardList( menuVo  ); 
		System.out.println( boardList );
		
		String menu_id = menuVo.getMenu_id();
				
		ModelAndView  mv         =  new ModelAndView();
		mv.addObject("menuList",   menuList );
		mv.addObject("menu_id", menu_id );
		mv.addObject("boardList",  boardList );
		mv.setViewName("board/list");
		return   mv;
		
	}
	
	//  /Board/WriteForm?menu_id=MENU01
	@RequestMapping("/WriteForm")
	public  ModelAndView   writeForm( MenuVo menuVo) {
		
		// 메뉴 목록 조회
		List<MenuVo> menuList = menuMapper.getMenuList();
		System.out.println("============="+menuList);
		
		// ?menu_id=MENU01 넘어온 menu_id 를 처리
		
		String  menu_id   = menuVo.getMenu_id();
		
		ModelAndView  mv  = new ModelAndView();
		mv.addObject("menuList", menuList);
		mv.addObject("menu_id", menu_id);
		mv.setViewName("board/write");
		return mv;	
		
	}
	
	// /Board/Write
	@RequestMapping("/Write")
	public  ModelAndView   write ( BoardVo boardVo) {
		
		// 넘어온 값 Board 저장
		boardMapper.insertBoard(boardVo);
		
		String menu_id = boardVo.getMenu_id();
		
		ModelAndView  mv  = new ModelAndView();
		mv.setViewName("redirecdt:/Board/List?menu_id=" + menu_id);
		
		return mv;
		
	}
	
	
	// /Board/View?dno=1
	@RequestMapping("/View")
	public  ModelAndView   view(BoardVo boardVo) {
		
		// 메뉴 목록 조회
		List<MenuVo>  menuList   =  menuMapper.getMenuList();
		
		// 조회수 증가 ( 현재 BNO의 HIT = HIT + 1 )
		boardMapper.incHit( boardVo );
		
		
		// bno 로 조회한 게시글 정보
		BoardVo  vo =  boardMapper.getBoard( boardVo );
		
		// vo.content 안의 \n(엔터) 를 '<br>' 로 변경한다
		String content = vo.getContent();
		if (content != null ) {
			content  =	content.replace("\n", "<br>");
			vo.setContent( content);
		}
		
		ModelAndView  mv  =  new ModelAndView();
		mv.addObject("menuList", menuList);
		mv.addObject("vo", vo);
		mv.setViewName("board/view");
		
		return  mv;		
	}
	
	
	
	
}







