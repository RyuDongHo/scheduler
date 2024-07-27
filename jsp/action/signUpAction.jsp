<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
  String name = request.getParameter("name");
  String email = request.getParameter("hp");
  String id = request.getParameter("id");
  String pw = request.getParameter("pw");
  // // 예외처리..
  // Class.forName("org.mariadb.jdbc.Driver");
  // Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web", "stageus", "1234");

  // // 아이디 중복체크
  // String idDuplicationCheckSql = "SELECT EXISTS(SELECT `id` FROM users WHERE `id`=?);";
  // PreparedStatement idDuplicationCheckquery = connect.prepareStatement(idDuplicationCheckSql);
  // idDuplicationCheckquery.setString(1, id);
  // ResultSet idResult = idDuplicationCheckquery.executeQuery();
  // idResult.next();
  // int idExist = idResult.getInt(1);

  // // 이메일 중복체크
  // String emailDuplicationCheckSql = "SELECT EXISTS(SELECT `email` FROM users WHERE `email`=?);";
  // PreparedStatement emailDuplicationCheckquery = connect.prepareStatement(emailDuplicationCheckSql);
  // emailDuplicationCheckquery.setString(1, email);
  // ResultSet emailResult = emailDuplicationCheckquery.executeQuery();
  // emailResult.next();
  // int emailExist = emailResult.getInt(1);

  // if(idExist == 1 && emailExist == 1){
  //   %>
  //     <script> 
  //         alert("이메일과 아이디가 둘다 중복됩니다.");
  //         history.back();
  //     </script>
  //   <%
  // } // jsp 처리하기..
  // else if(idExist == 1){
  //   %>
  //       <script> 
  //         //history.back();
  //         alert("아이디가 중복됩니다.");
  //         history.back();
  //       </script>
  //   <%
  // }
  // else if(emailExist == 1){
  //   %>
  //       <script> 
  //         alert("이메일이 중복됩니다.");
  //         history.back();
  //       </script>
  //   <%
  // }
  // else{
  //   String sql = "INSERT INTO users (name, email, id, password) VALUES (?, ?, ?, ?);";
  //   PreparedStatement query = connect.prepareStatement(sql);
  //   query.setString(1, name);
  //   query.setString(2, email);
  //   query.setString(3, id);
  //   query.setString(4, pw);
  
  //   query.executeUpdate();

    %>
        <script> 
          alert("회원가입 완료.");
          location.href="../page/loginPage.jsp";
        </script>
    <%
  //}

%>



