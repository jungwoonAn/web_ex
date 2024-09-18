package kr.bit.model;
import java.io.InputStream;
// JDBC -> myBatis
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {
	private static SqlSessionFactory sqlSessionFactory;
	
	// 초기화 블럭 - 프로그램 실행시 딱 한번만 실행되는 코드 영역
	static {
		try {
			String resource = "kr/bit/mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource); // 읽기
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 회원 전체 리스트 보기
	public List<MemberVO> memberList() {
		// [Connection + Statement] => SqlSession
		SqlSession session = sqlSessionFactory.openSession(); // connection pool 연결
		List<MemberVO> list = session.selectList("memberList");
		session.close(); // connection pool 반납
		return list;
	}
	
	// 회원 가입
	public int memberInsert(MemberVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.insert("memberInsert", vo);
		session.commit(); // 변경된 것 DB에 commit
		session.close(); // 반납
		return cnt;
	}
	
	// 회원 삭제
	public int memberDelete(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.delete("memberDelete", num);
		session.commit();
		session.close();
		return cnt;
	}
	
	// 회원 상세 보기
	public MemberVO memberContent(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		MemberVO vo = session.selectOne("memberContent", num);
		session.commit();
		session.close();
		return vo;
	}
	
	// 회원 수정하기
	public int memberUpdate(MemberVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.update("memberUpdate", vo);
		session.commit();
		session.close();
		return cnt;
	}
	
}
