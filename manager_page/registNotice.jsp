<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.simple.*"%>
<%@ include file="common.jsp" %>
<%! 
	String SQL 		= " insert into notice values (now(), ?)";
	
	String FILE		= "registNotice.jsp  ";
%>
<%
	
	String content = request.getParameter("content");
	
	// Connect to database by jdbc
	Connection con = null;
	try {
		Class.forName(dbDriver);
		con = DriverManager.getConnection(jdbcURL,dbID,dbPW);
	} catch(SQLException e) {
		log(FILE + "Connection error: " + e.getMessage());
		return ;
	}
	
	// insert notice
	ResultSet rs = null;
	JSONObject jResultObject = new JSONObject();
	try{
		
		PreparedStatement pstmt = con.prepareStatement(SQL);
		pstmt.setString(1, content);
		rs = pstmt.updateQuery();
			
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