<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.util.regex.Pattern" %>

<%
  Integer userIdx = (Integer)session.getAttribute("userIdx"); // 현재 로그인한 유저
  if(userIdx == null){
    response.sendRedirect("./loginPage.jsp");
    return;
  }

  Integer scheduleIdx = Integer.parseInt(request.getParameter("idx")); // 일정의 idx
  Integer currentUserIdx = Integer.parseInt(request.getParameter("userIdx")); // 일정 주인의 idx

  String timeRegex = "^\\d{2}:\\d{2}$";
  //입력값 검사
  if(scheduleIdx == null){
    out.println("<script>alert('비정상적 입력');</script>");
    out.println("<script>history.back();</script>");
    return;
  }

  // DB연결
  Class.forName("org.mariadb.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/schedule", "stageus", "1234");
 
  String getDateSql = "SELECT `date` FROM schedule WHERE `idx` = ?";
  PreparedStatement getDateQuery = connect.prepareStatement(getDateSql);
  getDateQuery.setInt(1, scheduleIdx);
  ResultSet rs = getDateQuery.executeQuery();
  rs.next();
  String date = rs.getString(1);
  String sql = "DELETE FROM schedule WHERE `idx` = ?";
  PreparedStatement query = connect.prepareStatement(sql);
  query.setInt(1, scheduleIdx);
  query.executeUpdate();

  response.sendRedirect("../page/selectedSchedulePage.jsp?userIdx=" + currentUserIdx 
                      + "&year=" + date.split("-")[0] + "&month=" + date.split("-")[1] + "&day=" + date.split("-")[2]);

%>



