<%@ page language="java" import="java.util.*,connect.*,java.sql.*" pageEncoding="UTF-8"%>
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
        
        <div id="daily-q-list" class="content-list content-area">
          <p>每日一题</p>
          <ul>
           
            <%
            String cur_page=request.getParameter("cur_page");
         //   System.out.print(cur_page);
            
            if(cur_page==null)
            {
            session.setAttribute("practice_page","1");
            }
            else
            {
            session.setAttribute("practice_page",cur_page);
            }
    
    //System.out.print(session.getAttribute("message_page"));
    
           ResultSet rs=connect.paging_message((String)session.getAttribute("practice_page"),"practice");
            while(rs.next())
            {
            out.print("<li><a href=''>"+rs.getString("title")+"</a><span>"+rs.getString("date")+"</span></li>");
            
            }
            
            
             %>
            
           </ul>
            <div class="pages" id="pages">
          
                <ul>
                 <%int page_cur=Integer.parseInt((String)session.getAttribute("practice_page"));

            //System.out.println(page_cur); 
            %>
              <li id="previous"><span><a href='question.jsp?cur_page=<%if(page_cur>1) --page_cur;out.print(page_cur); %>'>Pre</a></span></li>
           
              <%
                      ResultSet rs_row=connect.messages("practice");
                      rs_row.last();
           int rs_number=rs_row.getRow();
            int all_page=rs_number/10;
            int page_yu=rs_number%10;   
          if(page_yu!=0)
            
            {
            all_page+=1;
            
            }
            
              for(int i=0;i<all_page;i++)
              {
              out.print("<li><a href='question.jsp?cur_page="+(i+1)+"'>"+(i+1)+"</a></li>");
              }
              
               %>
               
                    <%int page_curs=Integer.parseInt((String)session.getAttribute("practice_page"));

            //System.out.println(page_cur); 
            %>
              <li id="next"><span><a href='question.jsp?cur_page=<% if(page_curs<all_page) page_curs++;out.print(page_curs);%>'>Next</a></span></li>
            </ul>
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
       </div>
 		      
 </body>
</html>
