<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.util.regex.Pattern" %>
<%
  String id = request.getParameter("id");
  String hp = request.getParameter("hp");

  String idRegex = "^[a-zA-Z0-9]{4,20}$";
  String hpRegex = "^010-\\d{4}-\\d{4}$";

  //입력값 검사
  if(hp == null || id == null || !Pattern.matches(hpRegex, hp) || !Pattern.matches(idRegex, id)){
    out.println("<script>alert('비정상적 입력');</script>");
    out.println("<script>history.back();</script>");
    return;
  }

  Class.forName("org.mariadb.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/schedule", "stageus", "1234");

  String sql = "SELECT `password`  FROM user WHERE `phoneNumber`=? and `id`=?;";
  PreparedStatement query = connect.prepareStatement(sql);
  query.setString(1, hp);
  query.setString(2, id);
  
  ResultSet rs = query.executeQuery();

  if(rs.next()){
    out.println("<script>alert('PW: " + rs.getString(1) +"');</script>");
    out.println("<script>location.href = '../page/loginPage.jsp';</script>");
  } else{
    out.println("<script>alert('없는 회원 정보');</script>");
    out.println("<script>history.back();</script>");
    return;
  }

  
%>
