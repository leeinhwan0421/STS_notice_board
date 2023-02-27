package kr.co.service;

import java.util.List;

import kr.co.vo.MemberVO;

public interface MemberService {
	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public void memberUpdate(MemberVO vo) throws Exception;
	
	public void memberDelete(MemberVO vo) throws Exception;
	
	public int passChk(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;
	
	public List<MemberVO> list() throws Exception;
	
	public void memberUpgrade(MemberVO vo) throws Exception;
	
	public MemberVO memberChk(String userId) throws Exception;
}