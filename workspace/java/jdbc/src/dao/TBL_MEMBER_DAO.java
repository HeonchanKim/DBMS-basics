package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import vo.TBL_MEMBER_VO;

public class TBL_MEMBER_DAO {

	Connection conn;
	PreparedStatement pstm;	
	ResultSet rs;
	
	
	private final static int KEY =3;
	
	
	//중복검사
	//사용자가 입력한 아이디를 전달받는다.
	public boolean checkId(String id) {
		//사용자가 입력한 아이디와 일치하는 개수를 가져온다.
		String query = "SELECT COUNT(ID) FROM TBL_MEMBER WHERE ID = ?";
		boolean check = false;
		try {
			//드라이버 연결을 통해 커넥션 객체를 가져온다.
			conn = DBConnecter.getConnection();
			//입력한 쿼리문을 pstm에 담아준다.
			pstm = conn.prepareStatement(query);
			//?를 채워준다(좌에서 우로 1부터 시작)
			pstm.setString(1, id);
			//쿼리문 실행 후 결과를 rs에 담아준다.
			rs = pstm.executeQuery();
			
			//행 가져오기
			rs.next();
			//열 가져오기
			if(rs.getInt(1) == 0) {return true;}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstm != null) {
					pstm.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				throw new RuntimeException();
			}
		}
		return check;
	}
	//회원가입
	public boolean join(TBL_MEMBER_VO member) {
		String query = "INSERT INTO TBL_MEMBER"
				+ "(NUM, ID, PW, NAME, AGE)"
				+ "VALUES(MEMBER_SEQ.NEXTVAL, ?, ?, ?, ?)";
		boolean check = false;
		try {
			conn = DBConnecter.getConnection();
			pstm = conn.prepareStatement(query);
			pstm.setString(1, member.getId());
			pstm.setString(2, encrypt(member.getPw()));
			pstm.setString(3, member.getName());
			pstm.setInt(4, member.getAge());
			if(pstm.executeUpdate() == 1) {check = true;}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm != null) {
					pstm.close();				
				}
				if(conn != null) {
					conn.close();				
				}
			} catch (SQLException e) {
				throw new RuntimeException();
			}
		}
		return check;

	}
	//로그인
	public boolean login(String id, String pw) {
		String query = "SELECT COUNT(ID) FROM TBL_MEMBER "
				+ "WHERE ID = ? AND PW = ?";
		boolean check = false;
		try {
			conn = DBConnecter.getConnection();
			pstm = conn.prepareStatement(query);
			pstm.setString(1, id);
			pstm.setString(2, encrypt(pw));
			rs = pstm.executeQuery();
			
			rs.next();
			
			if(rs.getInt(1) == 1) {check = true;}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstm != null) {
					pstm.close();				
				}
				if(conn != null) {
					conn.close();				
				}
			} catch (SQLException e) {
				throw new RuntimeException();
			}
		}
		return check;
	}
	//양방향 암호화
	public String encrypt(String pw) {
		String en_pw ="";
		for (int i = 0; i < pw.length(); i++) {
			en_pw += (char)(pw.charAt(i) * KEY);
		}
		return en_pw;
	}
	

	
}
