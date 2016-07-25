<%@ page language="java" import="java.util.*,connect.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
 	<meta charset="utf-8">
 	<title>计算机等级培训考试</title>
 	<link rel="stylesheet" type="text/css" href="css/style.css">
 	<script type="text/javascript" src="js/jquery-1.11.2.js"></script> 
  <script type="text/javascript" src="js/script.js"></script> 
  

 </head>
 <body>
    <!--模糊与登陆/注册框--> 
    <div class="background"></div>
    <!--注册-->
    <div class="register-form">  
         <div class="title"><span>注册</span><span class="close"><img src="img/close.png"></span></div>
          <div class="regis">
            <form action="#" method="post">
             <p>昵称：<input type="text" name="regis-name" id="regis-name"><div class="confirm-name"></div></input></p>
             <p>密码：<input type="password" name="password" id="password1"></input></p>
             <p>确认密码：<input type="password" name="confirm-password" id="password2"></input>
                <div class="confirm"></div></p> 
             <button type="submit" name="confirm-submit" id="confirm-submit">确认提交</button>
          </form>
          </div> 
       </div> 
    <!--登陆-->
    <div class="login-form">
       <div class="title"><span>登录</span><span class="close"><img src="img/close.png"></span></div>
        <div class="log">
          
             <p>账号：<input id="login_user" type="text" name="regis-name"></input></p>
             <p>密码：<input id="login_password"  type="password" name="password"></input></p> 
             <button type="submit" id="login-submit" onclick="login_check()" name="login-submit">登录</button>
         
        </div>
    </div>
    <!--导航栏-->
 		<header>
     <div class="rl">
        <!--  <div class="register">注册</div><span>/</span>
        <div class="login">登录</div> -->
        <%
        if(session.getAttribute("user")!=null)
        {
        out.print("<div class='login_ing' style='width:500px;height:20px;'>欢迎,"+session.getAttribute("user")+"&nbsp;|&nbsp;<a onclick='login_out()'>退出</a></div>");
        
     }
     else
     {
     out.print("<div class='login'>登录</div>");
     
     }
      %>
     </div>
 		  <div class="index-logo">
 		  	<img src="img/logo.png">  
 		  </div>
 		  <nav class="nav">
 		    <div class="menu menu-max" id="menu">
 		    	<span class="link">首页</span>
 		  	    <span class="link">资讯公告</span>
 		  	    <span class="link">模拟战场</span>
 		  	    <span class="link">报名&查询入口</span>
 		  	    <span class="link">Q&A</span>
 		    </div>
 		  	  
 		  	 <div class="expand" id="expand">
 		  	      <div class="expandlist">
 		  	        <div class="expand-div"> 
 		  	            <a href="index.jsp">首页</a> 
 		  	        </div>
 		  	        <div class="expand-div"> 
 		  	            <a href="message.jsp">资讯公告</a>
 		  	        </div>
 		  	        <div class="expand-div">
 		  	          <a href="#">考试大纲</a><!--扔个链接-->
 		  	        	<a href="question.jsp">每日一题</a>
                  <a href="test.jsp">模拟试题</a>
 		  	        	<a href="#">名师精讲</a>
 		  	        	<a href="#">相关下载</a>
 		  	        </div>
 		  	        <div class="expand-div">
 		  	        	<a href="sign.jsp">报名</a>
 		  	        	<a href="http://chaxun.neea.edu.cn/examcenter/query.cn?op=doQueryCond&sid=300&pram=certi">查询成绩</a>
 		  	        	<a href="#">查询准考证</a><!--扔个链接-->
 		  	        </div>
 		  	        <div class="expand-div"> 
 		  	           <a href="q&a.jsp">常见问题</a>
 		  	        </div>
 		  	      	
 		  	      </div>
 		     </div>
 		  </nav>  
 		</header>

   <div id="container">
      <div class="billboard">
        <div class="title">
         <p>最新内容:</p>
        </div>
        <div class="content">
         <ul>
          <!--  <li><span>1</span><span>2014-1-2</span></li>
          <li><span>2</span></li>
          <li><span>3</span></li>
          <li><span>4</span></li>
          <li><span>5</span></li>
          <li><span>6</span></li>
          
          -->
          <%
            ResultSet rs=connect.messages("messages_limit");
            while(rs.next())
            {
            out.println("<li><a href=''>"+rs.getString("title")+"</a><span>"+rs.getString("date")+"</span></li>");
           //rs.next();
            }
            
          
           %>
        </ul>
      </div>
    </div>
  <div class="right-side">
      <div class="daily-q">
        <div class="title">
         <p>每日一题</p>
        </div>
        <!-- 
              <span>Q:计算机由什么组成?</span></br>
              <button id="click-answer">答案答案 快快显现~(￣▽￣)~*</button></br>
              <span id="answer">A:显示屏，音箱，鼠标，键盘，主机</span>
              
               -->
                <%
            ResultSet rs_practice=connect.messages("practice_limit");
            while(rs_practice.next())
            {
            out.println("<span>"+rs_practice.getString("title")+"</span></br><button id='click-answer'>答案答案 快快显现~(￣▽￣)~*</button></br><span id='answer'>"+rs_practice.getString("answer")+"</span>");
          
            }
            
          
           %>
         
      </div> 
     
  </div>
     
   </div>
 		<footer>
 		   <div class="state">
 		   	<p> 地址:广东省广州市从化温泉镇中山大学南方学院电子通信与软件工程系办公室A1- 229 邮编:510970</p>
 			<p>Copyright © 2014 中山大学南方学院电子通信与软件工程系</p>
 			<p>网站制作：吴乙虹&陈思远</p>
 		   </div> 
 		</footer>
 </body>
</html>
