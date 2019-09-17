package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.dto.MemberDto;
import test.dto.PostDto;
import test.util.DbcpBean;

public class PostDao {

	private static PostDao dao;
	private StringBuilder sql;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private PostDao() {
		sql = new StringBuilder();
	}
	
	public static PostDao getInstance() {
		if(dao==null) dao = new PostDao();
		return dao;
	}
	
	public List<PostDto> getList() {
		List<PostDto> list = new ArrayList<>();
		
		//	SELECT * FROM site_post_list
		
		sql.append("SELECT * FROM SITE_POST_LIST ORDER BY regdate DESC ");
		
		try {
			conn = new DbcpBean().getconn();
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				PostDto dto = new PostDto();
				dto.setPostNum(rs.getInt("postnum"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setDescription(rs.getString("description"));
				dto.setImgSrc(rs.getString("imgsrc"));
				dto.setRegdate(rs.getTimestamp("regdate").toLocalDateTime());
				dto.setLikeCount(rs.getInt("likecount"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sql.setLength(0);
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return list;
	}
	
	public boolean writePost(PostDto dto) {
		boolean result = false;
		
		//	INSERT INTO site_post_list (postnum, id, name, description, imgsrc, regdate)
		//	values (SEQ_SITE_POST_NUM.nextval, ?, ?, ?, ?, sysdate)
		
		sql.append("INSERT INTO site_post_list ");
		sql.append("(postnum, id, name, description, imgsrc, regdate) ");
		sql.append("values(SEQ_SITE_POST_NUM.nextval, ");
		sql.append("?, ?, ?, ?, SYSDATE)");
		sql.trimToSize();
		
		try {
			conn = new DbcpBean().getconn();
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getDescription());
			pstmt.setString(4, dto.getImgSrc());
			
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
	
	
	public boolean deletePost(int num, String id) {
		boolean result = false;
		
		//	DELETE site_post_list
		//	WHERE id=id and postnum = num
		
		sql.append("DELETE site_post_list ");
		sql.append("WHERE postnum = ? and id = ?");
		
		try {
			conn = new DbcpBean().getconn();
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setInt(1, num);
			pstmt.setString(2, id);
			
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
	
	public boolean likePost(int num) {
		boolean result = false;
		
		//	update SITE_POST_LIST
		//	set likecount = likecount + 1
		//	where postnum = num;
		
		sql.append("UPDATE site_post_list ");
		sql.append("SET likecount = likecount + 1 ");
		sql.append("WHERE postnum = ");
		sql.append(num);
		sql.trimToSize();
		
		try {
			conn = new DbcpBean().getconn();
			pstmt = conn.prepareStatement(sql.toString());
			
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
	
	public boolean unlikePost(int num) {
		boolean result = false;
		
		//	update SITE_POST_LIST
		//	set likecount = likecount + 1
		//	where postnum = num;
		
		sql.append("UPDATE site_post_list ");
		sql.append("SET likecount = likecount - 1 ");
		sql.append("WHERE postnum = ");
		sql.append(num);
		sql.trimToSize();
		
		try {
			conn = new DbcpBean().getconn();
			pstmt = conn.prepareStatement(sql.toString());
			
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
	
}
