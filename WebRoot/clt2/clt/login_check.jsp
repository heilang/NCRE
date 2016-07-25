<%@ page language="java" import="java.util.*,connect.*,java.sql.*" pageEncoding="UTF-8"%>
<%
String user=request.getParameter("Name");
String password=request.getParameter("Password");


boolean login=connect.login_check(user,password);
if(login==true)

{
out.print(1);
session.setAttribute("user",user);


}


 
 
 %>
