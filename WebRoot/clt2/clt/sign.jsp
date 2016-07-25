<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
 <head>
 	<meta charset="utf-8">
 	<title>计算机等级考试</title>
 	<link rel="stylesheet" type="text/css" href="css/style.css">
 	<script type="text/javascript" src="js/jquery-1.11.2.js"></script> 
  <script type="text/javascript" src="js/script.js"></script>  
  <% if(session.getAttribute("user")==null)
{
out.print("<script>alert('请先登录');window.location.href='index.jsp';</script>");

}
 %>
  <script type="text/javascript">
          function previewImage(file)
        {
          var MAXWIDTH  = 192; 
          var MAXHEIGHT = 144;
          var div = document.getElementById('preview');
          if (file.files && file.files[0])
          {
              div.innerHTML ='<img id=imghead>';
              var img = document.getElementById('imghead');
              img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
//                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top+'px';
              }
              var reader = new FileReader();
              reader.onload = function(evt){img.src = evt.target.result;}
              reader.readAsDataURL(file.files[0]);
          }
          else //兼容IE
          {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
          }
        }
        function clacImgZoomParam( maxWidth, maxHeight, width, height ){
            var param = {top:0, left:0, width:width, height:height};
            if( width>maxWidth || height>maxHeight )
            {
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;
                
                if( rateWidth > rateHeight )
                {
                    param.width =  maxWidth;
                    param.height = Math.round(height / rateWidth);
                }else
                {
                    param.width = Math.round(width / rateHeight);
                    param.height = maxHeight;
                }
            }
            
            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
          }
  </script>
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
          <div class="content-area form" >
          
            <form action="sign_input.jsp" method="post"  enctype="multipart/form-data">
               <h1>计算机报名表</h1>
                <div class="photo">
                   <div id="preview">
                       <img id="imghead" border=0 width="192" height="144" />
                   </div>
                   <input type="file" onchange="previewImage(this)" name="file" />
                   <p style="color: red;">蓝底，存储为JPG格式，图象文件名为*.JPG，其中*为考生14位报名号</p>
                </div>
                 <p>姓名：<input type="text" name="name" id="true-name"></input><span class="warning"></span> </p>
                 <p>学号：<input type="text" name="number" id="number"></input><span class="warning2"></span></p>
                 <p>出生年月：<input type="text" name="birth"></input><span style="color: red;">如:20150101</span></p>
                 <p>证件类型:<select name="identity_type"><option  value="jmsfz">居民身份证</option>
                                     <option  value="jrzj">军人证件（军官证、警官证、士兵证）</option>
                                     <option  value="gajm">港澳居民来往内地通行证</option>
                                     <option  value="twjm">台湾居民往来大陆通行证（台胞证）</option>
                                     <option  value="wghz">外国护照</option></select></p>
                 <p>证件号：<input type="text" name="identity" id="identity"></input><span class="warning3"></span> </p>
                 <p>性别：<input type="radio" name="sex" value="1">男
                          <input type="radio" name="sex" value="2">女</input></p>
                 <p>年级专业：<input type="text" name="profession"></input></p>
                 <p>联系电话：<input type="text" name="tel" id="tel"></input></p>
                 <p>联系地址：<input type="text" name="address"></input></p>
                 <p><span style="color: red;">*</span>报考项目<span style="color: red;">(只能选择一项)</span></p>
                 <p>一级：<input type="radio" name="level" value="14">计算机基础及WPS Office应用
                          <input type="radio" name="level" value="15">计算机基础及MS Office应用
                          <input type="radio" name="level" value="16">计算机基础及Photoshop应用</br> 
                    二级：<input type="radio" name="level" value="24">C语言程序设计 
                          <input type="radio" name="level" value="26">VB语言程序设计
                          <input type="radio" name="level" value="27">VFP数据库程序设计 
                          <input type="radio" name="level" value="28">Java语言程序设计
                          <input type="radio" name="level" value="29">Access数据库程序设计
                          <input type="radio" name="level" value="61">C++语言程序设计
                          <input type="radio" name="level" value="63">MySQL数据库程序设计
                          <input type="radio" name="level" value="64">Web程序设计
                          <input type="radio" name="level" value="65">MS Office高级应用</br> 
                    三级：<input type="radio" name="level" value="35">网络技术 
                          <input type="radio" name="level" value="36">数据库技术
                          <input type="radio" name="level" value="37">软件测试技术
                          <input type="radio" name="level" value="38">信息安全技术
                          <input type="radio" name="level" value="39">嵌入式系统开发技术</br>
                    四级：<input type="radio" name="level" value="41">网络工程师 
                          <input type="radio" name="level" value="42">数据库工程师
                          <input type="radio" name="level" value="43">软件测试工程师
                          <input type="radio" name="level" value="44">信息安全工程师
                          <input type="radio" name="level" value="45">嵌入式系统开发工程师</p> 
                  <p>文化程度：<select name="degree"><option  value="1">博士</option>
                                       <option  value="2">硕士</option>
                                       <option  value="3">本科</option>
                                       <option  value="4">大专(专科)</option>
                                       <option  value="5">高中(职高)</option>
                                       <option  value="6">中专(中技)</option>
                                       <option value="7">初中</option>
                                       <option  value="8">初中以下</option></select></p> 
                  <p>职业：<select name="career"><option  value="30">学生</option>
                                   <option  value="08">军人</option>
                                   <option  value="10">失业(待业及无业)</option>
                                   <option  value="24">教学人员</option>
                                   <option value="19">卫生技术人员</option>
                                   <option  value="09">不便分类的从业人员</option></select> </p> 
                  <p>民族：<select name="nation"><option  value="01">汉族</option>
                                   <option  value="02">蒙古族</option>
                                   <option  value="03">回族</option>
                                   <option  value="04">藏族</option>
                                   <option  value="05">维吾尔族</option>
                                   <option  value="06">苗族</option></select></p>  
                  <p><input class="submit" type="submit" value="提交"></input></p>
                  </form>
             </div>   
        </div> 
   <footer >
   
       <div class="state">
        <p> 地址:广东省广州市从化温泉镇中山大学南方学院电子通信与软件工程系办公室A1- 229 邮编:510970</p>
        <p>Copyright © 2014 中山大学南方学院电子通信与软件工程系</p>
        <p>网站制作：吴乙虹&陈思远</p>
       </div> 
    </footer>
  </div>  
    <div style="clear: both"></div>
 </body>
</html>
