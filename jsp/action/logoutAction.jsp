<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>

<%
  //session.removeAttribute("userIdx");
  // removeAttribute는 map 구조에서 keyValue를 삭제
  // invalidate는 session 객체가 참조자체를 하지 않게되고 garbageCollector에 의해 추후에 제거됨.
  session.invalidate();
  response.sendRedirect("../page/loginPage.jsp");
%>


