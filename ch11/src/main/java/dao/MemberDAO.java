package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import db.DBHelper;
import dto.MemberDTO;

public class MemberDAO extends DBHelper {

	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	private MemberDAO() {}
	
	// 로거 생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertMember(MemberDTO member) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("INSERT INTO `Member` VALUES (?,?,?,?,?,?)");
			psmt.setString(1, member.getUid());
			psmt.setString(2, member.getName());
			psmt.setString(3, member.getHp());
			psmt.setString(4, member.getPos());
			psmt.setInt(5, member.getDep());
			psmt.setString(6, member.getRdate());
			psmt.executeUpdate();
			closeAll();
			
		}catch (Exception e) {
			// 로그 출력
			logger.error("insertMember() : " + e.getMessage());
		}
	}
	
	public MemberDTO selectMember(String uid) {
		
		MemberDTO member = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM `Member` WHERE `uid`=?");
			psmt.setString(1, uid);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				member = new MemberDTO();
				member.setUid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setHp(rs.getString(3));
				member.setPos(rs.getString(4));
				member.setDep(rs.getInt(5));
				member.setRdate(rs.getString(6));
			}
			closeAll();
			
		}catch(Exception e) {
			logger.error("selectMember() : " + e.getMessage());
		}
		return member;
	}
	
	public List<MemberDTO> selectMembers() {
		
		List<MemberDTO> members = new ArrayList<>();
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("SELECT * FROM `Member`");
			logger.info("psmt : " + psmt);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setUid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setHp(rs.getString(3));
				member.setPos(rs.getString(4));
				member.setDep(rs.getInt(5));
				member.setRdate(rs.getString(6));
				members.add(member);
			}
			closeAll();
			
		}catch(Exception e) {
			// 로그 출력
			logger.error("selectMembers() : " + e.getMessage());
		}
		return members;
	}
	
	public void updateMember(MemberDTO member) {
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("UPDATE `Member` SET `name`=?, `hp`=?, `pos`=? `dep`=? `rdate`=? WHERE `uid`=?");
			psmt.setString(1, member.getUid());
			psmt.setString(2, member.getName());
			psmt.setString(3, member.getHp());
			psmt.setString(4, member.getPos());
			psmt.setInt(5, member.getDep());
			psmt.setString(6, member.getRdate());
			psmt.executeUpdate();
			closeAll();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteMember() {}
	
	
}
