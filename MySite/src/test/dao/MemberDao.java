package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	
	private static MemberDao dao;
	private StringBuilder sql;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private MemberDao() {
		sql = new StringBuilder();
	}
	
	public static MemberDao getInstance() {
		if(dao==null) dao = new MemberDao();
		return dao;
	}
	
	public boolean signUp(MemberDto dto) {
		boolean result = false;
		
		/*
		 * insert into site_member_table
			values (usercode, id, name, email, password, regdate);
		 */
		
		sql.append("INSERT INTO site_member_table ");
		sql.append("VALUES (seq_site_member_num.NEXTVAL, ");
		sql.append("?, ?, ?, ?, SYSDATE) ");
		
		try {
			conn = new DbcpBean().getconn();
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getPassword());
			
			if(pstmt.executeUpdate()>0) result = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.setLength(0);
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		
		return result;
	}
	
	public MemberDto login(String id, String pwd) {
		MemberDto dto = null;
		
		//	SELECT * FROM site_member_table
		//	WHERE ID=? AND PWD=?
		
		sql.append("SELECT * FROM site_member_table ");
		sql.append("WHERE id=? AND password=?");
		
		try {
			conn = new DbcpBean().getconn();
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDto();
				dto.setUserCode(rs.getInt("usercode")+"");
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getTimestamp("regdate").toLocalDateTime());
				if(rs.next()) dto = null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.setLength(0);
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return dto;
	}
	
}
