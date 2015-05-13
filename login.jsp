<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="org.json.simple.*"%>
<%!	
	// 클래스 변수
	String jdbcURL	= "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf8";
	String dbID		= "kknock_wars";
	String dbPW		= "enpwlrhtlvsi??"; 
	String SQL 		= "SELECT *FROM member WHERE id=? and pw=?"; // 아이디와 비밀번호가 일치하는지 확인
	
%>
<%
	String id= request.getParameter("id");
	String pw= request.getParameter("pw");
	
	byte[] byteArray = pw.getBytes();
	MessageDigest md = MessageDigest.getInstance("MD5");
	md.reset();
	md.update(byteArray);
	byte digest[] = md.digest();
	StringBuffer buffer = new StringBuffer();
	for(int i =0; i<digest.length; i++){
		if(((int)digest[i]&0xff)<0x10) buffer.append("0");
		buffer.append(Long.toString((int)digest[i]&0xff, 16));
	}
	pw = buffer.toString();
	
	
	Connection con = null;
	ResultSet rs = null;
	JSONObject jResultObject = new JSONObject();
	try{
		Class.forName("com.mysql.jdbc.Driver");
		
		con = DriverManager.getConnection(jdbcURL,dbID,dbPW);
		PreparedStatement pstmt = con.prepareStatement(SQL);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		rs = pstmt.executeQuery();
			
		if(rs.next()) {
			session.setAttribute("id", id);
            session.setAttribute("name", rs.getString("name"));
			session.setAttribute("isAdmin", rs.getString("chk_admin"));
			jResultObject.put("result", "true");
		}
		else {
			jResultObject.put("result", "false");
		}
			
		pstmt.close();
		con.close();

	}catch(Exception e){
		out.println(e);
	}
	out.println(jResultObject.toJSONString());
	
%>