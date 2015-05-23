<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.simple.*"%>
<%! 
	String jdbcURL	= "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf8";
	String dbID		= "kknock_wars";
	String dbPW		= "enpwlrhtlvsi??"; 
	String SQL 		= " Select no, id, name From member Where chk_join='T' ";
	
	String FILE		= "getUserList.jsp\t";
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
			jObject.put("no", rs.getString("no"));
			jObject.put("id", rs.getString("id"));
			jObject.put("name", rs.getString("name"));
			jArray.add(jObject);
		}
		jResultObject.put("userList", jArray);
	} catch(SQLException e) {
		log(FILE + "Query error: " + e.getMessage());
		return ;
	} catch(Exception e) {
		log(FILE + "JSON creation error: " + e.getMessage());
		return ;
	}
	
	out.print(jResultObject.toJSONString());

%>