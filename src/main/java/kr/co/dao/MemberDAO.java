package kr.co.dao;

import java.util.List;

import kr.co.vo.MemberVO;

public interface MemberDAO {
	// 회원가입
	public void register(MemberVO vo) throws Exception;
	
	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	// 회원정보 수정
	public void memberUpdate(MemberVO vo) throws Exception;
	
	// 회원 탈퇴
	public void memberDelete(MemberVO vo) throws Exception;
	
	// 패스워드 체크
	public int passChk(MemberVO vo) throws Exception;
	
	// ID 체크
	public int idChk(MemberVO vo) throws Exception;
	
	// 멤버 리스트
	public List<MemberVO> list() throws Exception;
	
	// 멤버 권한 상승
	public void memberUpgrade(MemberVO vo) throws Exception;
	
	// 멤버 조회
	public MemberVO memberChk(String userId) throws Exception;
}
