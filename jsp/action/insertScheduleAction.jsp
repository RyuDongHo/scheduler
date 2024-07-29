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

  String time = request.getParameter("time");
  String year = request.getParameter("year");
  String month = request.getParameter("month");
  String day = request.getParameter("day");
  String content = request.getParameter("content");

  String timeRegex = "^[a-zA-Z0-9]{4,20}$";
  //입력값 검사
  if(time == null || content == null){
    out.println("<script>alert('비정상적 입력');</script>");
    out.println("<script>history.back();</script>");
    return;
  }
  // else if(!Pattern.matches(timeRegex, time)){
  //   out.println("<script>alert('비정상적 입력');</script>");
  //   out.println("<script>history.back();</script>");
  //   return;
  // }

  // DB연결
  Class.forName("org.mariadb.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/schedule", "stageus", "1234");

  String startTime = year + "-" + month + "-" + day + " " + time.split("-")[0];
  String endTime = year + "-" + month + "-" + day + " " + time.split("-")[1];
  String date = year + "-" + month + "-" + day;


 
String sql = "INSERT INTO schedule (`userIdx`, `startTime`, `endTime`, `content`, `date`) VALUES (?, ?, ?, ?, ?);";
PreparedStatement query = connect.prepareStatement(sql);
query.setInt(1, userIdx);
query.setString(2, startTime);
query.setString(3, endTime);
query.setString(4, content);
query.setString(5, date);
query.executeUpdate();

response.sendRedirect("../page/selectedSchedulePage.jsp?userIdx=" + userIdx 
                    + "&year=" + year + "&month=" + month + "&day=" + day);

%>



