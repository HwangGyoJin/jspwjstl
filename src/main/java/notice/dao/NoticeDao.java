package notice.dao;

import java.sql.*;

import notice.db.DBCon;
import notice.vo.Notice;

public class NoticeDao {
	
	public int insert(Notice n) throws Exception {
		
		Connection conn=DBCon.getConnection();
		
		//접속성공
		String sql="insert into notices(seq,title,writer,content,regdate,hit)"
		+" values((select max(to_number(seq))+1 from notices),?,'hong',?,sysdate,0)";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, n.getTitle());
		pstmt.setString(2, n.getContent());

		//실행
		int cnt=pstmt.executeUpdate(); //insert 실행 
		
		pstmt.close();
		conn.close();
		return cnt;
	}
	
	public int delete(String seq) throws Exception {
		
		Connection conn=DBCon.getConnection();
		
		//접속성공
		//String sql="select * from notices where seq="+seq;
		String sql="delete from notices where seq=?";

		//Statement st=conn.createStatement();
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, seq);

		//ResultSet rs=st.executeQuery(sql);//select 실행
		int af=pstmt.executeUpdate();//delete실행
		
		pstmt.close();
		conn.close();
		
		return af;
	}
	
	public int update(Notice notice) throws Exception {
		
		Connection conn=DBCon.getConnection();
		
		//접속성공
		//String sql="select * from notices where seq="+seq;
		String sql="update notices set title=?,content=? where seq=?";

		//Statement st=conn.createStatement();
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(3, notice.getSeq());
		pstmt.setString(2, notice.getContent());
		pstmt.setString(1, notice.getTitle());

		//ResultSet rs=st.executeQuery(sql);//select 실행
		int cnt=pstmt.executeUpdate(); //pstmt형식 실행
		
		pstmt.close();
		conn.close();
		
		return cnt;
	}

	public Notice getNotice(String seq) throws Exception {

		Connection conn=DBCon.getConnection();
		
		// 접속성공
		// String sql="select * from notices where seq="+seq;
		String sql = "select * from notices where seq=?";

		// Statement st=conn.createStatement();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);

		// ResultSet rs=st.executeQuery(sql);//select 실행
		ResultSet rs = pstmt.executeQuery(); // pstmt형식 실행
		rs.next();

		// db에 select결과를 Notice파일에 저장
		Notice n = new Notice();
		n.setSeq(rs.getString("seq"));
		n.setTitle(rs.getString("title"));
		n.setWriter(rs.getString("writer"));
		n.setContent(rs.getString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("hit"));

		rs.close();
		// st.close();
		pstmt.close();
		conn.close();

		return n;
	}

}
