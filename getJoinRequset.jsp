<%@ page language="java" contentType="text/html; charsetutf-8r" pageEncoding=utf-8r"%>
<%! 
	// read only variables here. 
	String jdbc = "jdbc:mysql://localhost:3306/test";
	String dbID = "root";
	String dbPW = "root";
	String query = " Select no, id, name From member Where chk_join='F' ";
%>
<%
	// Session check
	String sessionID = "!";
	
	if( true ) {
		out.println("no result");
		return ;
	}
	

	// Connect to database by jdbc
	try {
		Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		
		// JDBC connect.












	} catch(SQLException e) {
		log("Connection error: " + e.getMessage());
		out.println("ERROR");
		return ;
	}

	// Query new member and make the Json object.
	JSONObject jResultObject = new JSONObject();
	try {
		PreparedStatement pstmt = con.preparedStatement(query);
		ResultSet rs = pstmt.executeQuery();
		
		JSONArray jArray = new JSONArray();
		while( rs.next() ) {
			JSONObject jObject = new JSONObject();
			jObejct.put("no", rs.getString(0));
			jObejct.put("id", rs.getString(1));
			jObejct.put("name", rs.getString(2));
			jArray.put(jObject);
		}
		
		jResultArray.put("member", jArray);
		
	} catch(SQLException e) {
		log("Query error: " + e.getMessage());
		out.println("ERROR");
		return ;
	} catch(Exception e) {
		log("JSON creation error: " + e.getMessage());
		out.println("ERROR");
		return ;
	}
	
	out.print(jResultObject.toJSONString());

%>