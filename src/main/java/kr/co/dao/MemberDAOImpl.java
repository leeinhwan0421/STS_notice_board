package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	@Inject SqlSession sql;

	// 회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert("memberMapper.register", vo);
	}

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.login", vo);
	}
	
	// 회원정보 수정
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		sql.update("memberMapper.memberUpdate", vo);		
	}

	// 회원 탈퇴
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		sql.delete("memberMapper.memberDelete", vo);
	}

	// PW 체크
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.passChk", vo);
		return result;
	}

	// ID 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.idChk", vo);
		return result;
	}

	// 멤버 리스트
	@Override
	public List<MemberVO> list() throws Exception {
		return sql.selectList("memberMapper.list");
	}
	
	// 멤버 등급 상승
	@Override
	public void memberUpgrade(MemberVO vo) throws Exception {
		sql.update("memberMapper.memberUpgrade", vo);
	}

	@Override
	public MemberVO memberChk(String userId) throws Exception {
		return sql.selectOne("memberMapper.memberChk", userId);
	}
}
