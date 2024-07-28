<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%
  String id = request.getParameter("id");
  String pw = request.getParameter("pw");
  
  Class.forName("org.mariadb.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/schedule", "stageus", "1234");

  String sql = "SELECT IF(id=? and password=?, 'true', 'false'), `idx` FROM user;";
  PreparedStatement query = connect.prepareStatement(sql);
  query.setString(1, id);
  query.setString(2, pw);
  
  ResultSet rs = query.executeQuery();

  while(rs.next()){
    if(rs.getString(1).equals("true")){
      session.setMaxInactiveInterval(60*30);
      session.setAttribute("userIdx", rs.getInt(2));
      response.sendRedirect("../page/schedulePage.jsp");
    }
  }
  out.println("<script>alert('없는 회원 정보');</script>");
  out.println("<script>history.back();</script>");
  
%>
