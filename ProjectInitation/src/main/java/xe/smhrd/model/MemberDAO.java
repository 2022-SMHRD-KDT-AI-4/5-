package xe.smhrd.model;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import xe.smhrd.model.MemberVO;

public class MemberDAO {
	
//	Connection pool 만들기
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
//		Connection pool 설정
		try {
			String resource = "xe/smhrd/mapper/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//==============================================================================
	
	public int join(MemberVO vo) {
		
//		SqlSession 빌려오기
		SqlSession session = sqlSessionFactory.openSession(true);
		
//		MemberMapper.xml에 적어둔 SQL문장 실행
		int cnt = session.insert("join", vo);
		
//		세션 반환
		session.close();
		
//		리턴값 반환
		return cnt;
	}
	
//	emailCheck method
	public MemberVO emailCheck(String m_id) {
		
//		1. SqlSession 빌려오기
		SqlSession session = sqlSessionFactory.openSession(true);
		
//		2. Sql문 실행
		MemberVO vo = session.selectOne("emailCheck", m_id);
		
//		3. 세션 반환
		session.close();
		
		return vo;
	}
	
}
