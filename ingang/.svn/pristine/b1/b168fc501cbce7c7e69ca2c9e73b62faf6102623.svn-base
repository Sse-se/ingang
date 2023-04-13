package com.ingang.member.mapper;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.ingang.member.vo.MemberVO;
import com.webjjang.util.PageObject;

public interface MemberMapper {
	
	public MemberVO login(MemberVO vo);
	
	public int join(MemberVO vo);
	
	public List<MemberVO> userList(PageObject pageObject);
	
	public long getTotalRow(PageObject pageObject);
	
	public MemberVO myMenu(MemberVO vo);
	
	public int idCheck(String id);
	
	public MemberVO userView(String id);
	
	public int changeAd(MemberVO vo);

	public int tInsert(MemberVO vo);
	public int mInsert(MemberVO vo);
	
	public String findPw(String id);
	
	public int changeGrade(MemberVO vo);
	
	public int searchId(MemberVO vo);
	
	public int joinKakao(MemberVO vo);
	
	public MemberVO loginKakao(MemberVO vo);
	
	public int userDelete(MemberVO vo);
	
	public int conlog(MemberVO vo);
	
	public int sleepUser();
	
	public int changePw(MemberVO vo);
	
	public int changeMP(String id);
	
	public  List<MemberVO> mentoPList();
	
	public int mentoApp(String id );
	
	public List<MemberVO> teacherList();
}
