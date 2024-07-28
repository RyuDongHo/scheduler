<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import= "java.util.*" %>
<%@ page import= "java.util.regex.Pattern" %>

<%
  String name = request.getParameter("name");
  String hp = request.getParameter("hp");
  String id = request.getParameter("id");
  String pw = request.getParameter("pw");
  String team = request.getParameter("team");

  String idRegex = "^[a-zA-Z0-9]{4,20}$";
  String hpRegex = "^010-\\d{4}-\\d{4}$";
  String pwRegex = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[!@#$%^&*(),.?\":{}|<>])[a-zA-Z\\d!@#$%^&*(),.?\":{}|<>]{6,20}$";
  String nameRegex = "^[가-힣a-zA-Z]{2,20}$";
  //입력값 검사
  if(name == null || hp == null || id == null || pw == null || team == null){
    out.println("<script>alert('비정상적 입력');</script>");
    out.println("<script>history.back();</script>");
    return;
  }
  else if(!(Pattern.matches(idRegex, id) && Pattern.matches(pwRegex, pw) && Pattern.matches(hpRegex, hp) && Pattern.matches(nameRegex, name))){
    out.println("<script>alert('비정상적 입력');</script>");
    out.println("<script>history.back();</script>");
    return;
  }

  // DB연결
  Class.forName("org.mariadb.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/schedule", "stageus", "1234");

  // 아이디 중복체크
  String idDuplicationCheckSql = "SELECT EXISTS(SELECT `id` FROM user WHERE `id`=?);";
  PreparedStatement idDuplicationCheckquery = connect.prepareStatement(idDuplicationCheckSql);
  idDuplicationCheckquery.setString(1, id);
  ResultSet idResult = idDuplicationCheckquery.executeQuery();
  idResult.next();
  int idExist = idResult.getInt(1);

  // 연락처 중복체크
  String hpDuplicationCheckSql = "SELECT EXISTS(SELECT `phoneNumber` FROM user WHERE `phoneNumber`=?);";
  PreparedStatement hpDuplicationCheckquery = connect.prepareStatement(hpDuplicationCheckSql);
  hpDuplicationCheckquery.setString(1, hp);
  ResultSet hpResult = hpDuplicationCheckquery.executeQuery();
  hpResult.next();
  int hpExist = hpResult.getInt(1);

  if(idExist == 1 && hpExist == 1){
    out.println("<script>alert('이미 가입된 아이디와 연락처 입니다.');</script>");
    out.println("<script>history.back();</script>");
  } // jsp 처리하기..
  else if(idExist == 1){
    out.println("<script>alert('이미 가입된 아이디 입니다.');</script>");
    out.println("<script>history.back();</script>");
  }
  else if(hpExist == 1){
    out.println("<script>alert('이미 가입된 연락처 입니다.');</script>");
    out.println("<script>history.back();</script>");
  }
  else{
    String sql = "INSERT INTO user (name, phoneNumber, id, password, teamIdx) VALUES (?, ?, ?, ?, ?);";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1, name);
    query.setString(2, hp);
    query.setString(3, id);
    query.setString(4, pw);
    query.setInt(5, Integer.parseInt(team));
  
    query.executeUpdate();
    out.println("<script>alert('회원가입 완료');</script>");
    out.println("<script>location.href = '../page/loginPage.jsp';</script>");
  }

%>



