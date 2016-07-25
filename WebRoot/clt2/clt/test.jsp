<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="utf-8">
  <title>计算机等级考试</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <script type="text/javascript" src="js/jquery-1.11.2.js"></script> 
  <script type="text/javascript" src="js/script.js"></script> 
 </head>
 <body>
    <!--导航栏-->
    <header>
       <div class="logo">
        <img src="img/logo-min.png">
      </div> 
    </header> 
        <div class="box">  
         <div class="main"> 
           <div class="sidebar" id="sidebar">
           <ul>
            <li> 
             <a href="index.jsp">首页</a>  
            </li> 
            <li> 
               <a href="message.jsp">资讯公告</a>  
            </li>
            <li> 
               <span>模拟战场</span> 
                         <ul>
                          <li><a href="http://edu.21cn.com/ncre/f_51_306654-1.htm">考试大纲</a></li>
                          <li><a href="question.jsp">每日一题</a></li>
                          <li><a href="test.jsp">模拟试题</a></li>
                          <li><a href="">名师精讲</a></li>
                          <li><a href="">相关下载</a></li>
                         </ul> 
            </li>
            <li> 
               <span>报名&查询入口</span> 
                         <ul>
                          <li><a href="sign.jsp">报名</a></li>
                          <li><a href="http://chaxun.neea.edu.cn/examcenter/query.cn?op=doQueryCond&sid=300&pram=certi">查询成绩</a></li>
                          <li><a href="#">查询准考证</a></li>
                         </ul> 
            </li>
             <li> 
               <span>Q&A</span> 
                        <ul>
                          <li><a href="q&a.jsp">常见问题</a></li> 
                         </ul> 
             </li>  
           </ul> 
        </div>  
  <div class="content-area" >
            <form action="" method="post">
             <div class="test">
               <p><span>1</span>、计算机有什么组成?</p>        
                 <p><input type="radio" name="choice" />A:键盘</p>
                 <p><input type="radio" name="choice" />B:鼠标</p>
                 <p><input type="radio" name="choice" />C:主机</p>
                 <p><input type="radio" name="choice" />D:以上所有</p> 
             </div>
              <div class="test">
               <p><span>2</span>、计算机有什么组成?</p>        
                 <p><input type="radio" name="choice" />A:键盘</p>
                 <p><input type="radio" name="choice" />B:鼠标</p>
                 <p><input type="radio" name="choice" />C:主机</p>
                 <p><input type="radio" name="choice" />D:以上所有</p> 
             </div>
              <p><input class="submit" type="submit" value="提交"></input></p>
             </form>
          </div>
        </div> 
    <footer>
       <div class="state">
        <p> 地址:广东省广州市从化温泉镇中山大学南方学院电子通信与软件工程系办公室A1- 229 邮编:510970</p>
        <p>Copyright © 2014 中山大学南方学院电子通信与软件工程系</p>
       <p>网站制作：吴乙虹&陈思远</p>
       </div> 
    </footer>
   </div>
 </body>
</html>
