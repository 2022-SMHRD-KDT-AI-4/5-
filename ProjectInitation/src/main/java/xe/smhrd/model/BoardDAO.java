package xe.smhrd.model;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class BoardDAO {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			String resource = "xe/smhrd/mapper/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int write(BoardVO bvo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		int cnt = 0;
		try {
			cnt = session.insert("write", bvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return cnt;
	}
	
	public List<BoardVO> selectBoard() {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<BoardVO> list = session.selectList("selectBoard");
		session.close();
		return list;
	}
	
	public BoardVO selectOne(String p_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		BoardVO bvo = session.selectOne("selectOne", p_id);
		session.close();
		return bvo;
	}
	
	public List<BoardVO> selectPartyItemList(String p_id) {
		SqlSession session = sqlSessionFactory.openSession(true);
		List<BoardVO> list = session.selectList("selectPartyItemList", p_id);
		session.close();
		return list;
	}

}
