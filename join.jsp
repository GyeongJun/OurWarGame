<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="org.json.simple.*"%>
<%!	
	// Instance Variables
	String jdbcURL	= "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf8";
	String dbID		= "kknock_wars";
	String dbPW		= "enpwlrhtlvsi??"; 
	String chkSQL 	= "SELECT *FROM member WHERE id=? or name=?";
	String joinSQL 	= "INSERT INTO member(id, pw, name) VALUES(?, ?, ?)";
%>
<%
	request.setCharacterEncoding("UTF-8");
	String id= request.getParameter("id");
	String pw= request.getParameter("pw");
	String name= request.getParameter("name");
	
	
	// 패스워드 MD5
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
	int chk = 0;
	JSONObject jResultObject = new JSONObject();
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(jdbcURL,dbID,dbPW);
		
		PreparedStatement pstmt = con.prepareStatement(chkSQL);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		rs = pstmt.executeQuery();
		while(rs.next()) chk=chk+1;
		pstmt.close();
		
		if(chk>0){	// 중복된 아이디, 닉네임이 존재
			jResultObject.put("result", "false");
		}
		else{
			pstmt = con.prepareStatement(joinSQL);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.executeUpdate();
			jResultObject.put("result", "true");
		}
		pstmt.close();
		con.close();
	}catch(Exception e){
		out.println(e.getMessage());
	}
	
	out.println(jResultObject.toJSONString());
	
%>