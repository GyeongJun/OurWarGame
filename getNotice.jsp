<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.simple.*"%>
<%! 	
	String jdbcURL	= "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf8";
	String dbID		= "kknock_wars";
	String dbPW		= "enpwlrhtlvsi??"; 
	String SQL 		= "SELECT * FROM notice order by no desc";
	
	String FILE		= "getNotice.jsp\t";
	
%>
<%
	
	// Connect to database by jdbc
	Connection con = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(jdbcURL,dbID,dbPW);
	} catch(SQLException e) {
		log(FILE + "Connection error: " + e.getMessage());
		return ;
	}
	
	// get notices from DB connection
	JSONObject jResultObject = new JSONObject();
	try {
		Statement stmt =  con.createStatement();
		ResultSet rs = stmt.executeQuery(SQL);
		JSONArray jArray = new JSONArray();
		while( rs.next() ) {
			JSONObject jObject = new JSONObject();
			jObject.put("timestamp", rs.getTimestamp("save_time").toString());
			jObject.put("content", rs.getString("content"));
			jArray.add(jObject);
		}
		jResultObject.put("noticeList", jArray);
	} catch(SQLException e) {
		log(FILE + "Query error: " + e.getMessage());
		return ;
	} catch(Exception e) {
		log(FILE + "JSON creation error: " + e.getMessage());
		return ;
	}
	
	out.print(jResultObject.toJSONString());
%>