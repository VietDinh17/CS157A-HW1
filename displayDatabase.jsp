<%@ page import="java.sql.*" %>
<html>

<head>
    <title>JDBC Connection Homework</title>
</head>

<body>
    <h1>JDBC Connection Homework</h1>
    <% 
    String db = "cs157a";
    String user = "root"; 
    try { 
        java.sql.Connection con; 
        Class.forName("com.mysql.jdbc.Driver"); 
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, user, "password"); 
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from emp"); 
        
    	out.println( db + " database successfully opened.");
    	out.println("<html><body><pre>"); 
     	out.println( "Database table is showing below."); 
    %>   
        <table border="1">
            <tr>
                <td>ID</td>
                <td>Name</td>
                <td>Age</td>
            </tr>
    <% 
        while(rs.next()){
    %>
    
  		<tr>
            <td><%out.println(rs.getInt(1)); %></td>
            <td><%out.println(rs.getString(2)); %></td>
            <td><%out.println(rs.getInt(3)); %></td>
  		</tr>
    <%
        }
    %>    
        </table>
    <%     
        rs.close();
        stmt.close();
        con.close();
    
    } 
    catch( SQLException e) { 
        out.println("SQLException caught: " + e.getMessage()); 
    } 
    %>
</body>

</html>