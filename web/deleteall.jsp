
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
          <%
            //conectando a base de datos
            Connection conexion=null;
            String url="jdbc:mysql://localhost:3306/final_progra";//url de MySQL
            String usuario="root";// usuario de mysql local
            String clave="root"; 
           
            
             Class.forName("com.mysql.jdbc.Driver");
             conexion=DriverManager.getConnection( url, usuario,clave);
             
          
             
              PreparedStatement as;
              as=conexion.prepareStatement("SET SQL_SAFE_UPDATES = 0");
             as.executeUpdate();
             
             PreparedStatement ps;
             
             
             ps=conexion.prepareStatement("DELETE FROM LIBRO");
             ps.executeUpdate();
             response.sendRedirect("index.jsp");
             
             
             
            
          
            %>
      
     
    </body>
</html>