<%@ page contentType="text/html;charset=utf-8" language="java" import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,java.sql.*,com.jspsmart.upload.*,java.util.*"%>



<%

request.setCharacterEncoding("utf-8"); 
//String file=request.getParameter("file");
String name=request.getParameter("name");
String number=request.getParameter("number");
String birth=request.getParameter("birth");
String identity_type=request.getParameter("identity_type");
String identity=request.getParameter("identity");
String sex=request.getParameter("sex");
String profession=request.getParameter("profession");
String tel=request.getParameter("tel");
String address=request.getParameter("address");
String level=request.getParameter("level");
String degree=request.getParameter("degree");
String career=request.getParameter("career");
String nation=request.getParameter("nation");



/*

out.println("文件"+file);
out.println("姓名"+name);
out.println("学号"+number);
out.println("生日"+birth);
out.println("身份类型"+identity_type);
out.println("身份证"+identity);
out.println("性别"+sex);
out.println("专业"+profession);
out.println("电话"+tel);
out.println("地址"+address);
out.println("等级"+level);
out.println("学历"+degree);
out.println("事业"+career);
out.println("自然"+nation);


*/

%>

<%

SmartUpload mySmartUpload =new SmartUpload();

long file_size_max=4000000;

String fileName2="",ext="",testvar="";


//初始化



mySmartUpload.initialize(pageContext);

//只允许上载此类文件

try {

mySmartUpload.setAllowedFilesList("jpg");//此处的文件格式可以根据需要自己修改

//上载文件

mySmartUpload.upload();

} catch (Exception e){

%>



<%

}

try{

com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);

if (myFile.isMissing()){%>



<%}

else{

String myFileName=myFile.getFileName(); //取得上载的文件的文件名

ext= myFile.getFileExt(); //取得后缀名

int file_size=myFile.getSize(); //取得文件的大小

String saveurl="";

if(file_size<file_size_max){

//更改文件名，取得当前上传时间的毫秒数值
/*
Calendar calendar = Calendar.getInstance();

String filename = String.valueOf(calendar.getTimeInMillis());*/


saveurl=application.getRealPath("/")+"clt2/clt/img/person/"+session.getAttribute("user")+"."+ext; //保存路径

myFile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL);



}

}

}catch (Exception e){

out.print(e.toString());

}

%>
