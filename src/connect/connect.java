package connect;

import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.Statement;  
  import java.lang.Boolean;
import java.nio.CharBuffer;
import java.lang.StringBuffer;
import java.util.ArrayList;



public class connect {  
    // 创建静态全局变量  




    /* 获取数据库连接的函数*/  
    public static Connection getConnection() {  
        Connection con = null;  //创建用于连接数据库的Connection对象  
        try {  
            Class.forName("com.mysql.jdbc.Driver");// 加载Mysql数据驱动  
              
            con = DriverManager.getConnection(  
                    "jdbc:mysql://localhost:3306/ncre", "root", "");// 创建数据连接  
        // System.out.println("数据库连接成功");  
              
        } catch (Exception e) {  
            System.out.println("数据库连接失败" + e.getMessage());  
        }  
        return con; //返回所建立的数据库连接  
    }  
    
    
    //登录验证##################
    public static boolean login_check(String user, String password)
	{
		
		  Connection conn;  
	       ResultSet rs=null;
	      Statement st;
String sql;
	       
//System.out.println(user+"....."+password+"....");


	      try
	      {
	    conn=getConnection();
	    st=conn.createStatement();
	boolean login_isok=false;   
sql="select* from user";

rs=st.executeQuery(sql);
while(rs.next())
{
	
if(rs.getString(1).equals(user)&&rs.getString(2).equals(password))
	
{
	
	//System.out.print(rs.getString("username")+"/"+rs.getString("password"));
	login_isok=true;
}


}
conn.close();
st.close();
rs.close();
return login_isok;
	
	    	
	      }
	      catch(SQLException e)
	      {
	    	  
	    	  System.out.println(e);
	    	  
	    	  
	    	  return false;	  
	      }
		

		
	}
    
    
    //获取资讯公告内容##################################
    public static ResultSet messages(String type)
    {
    	Connection conn;  
	       ResultSet rs=null;
	      Statement st;
String sql=null;
    
try
{
conn=getConnection();
st=conn.createStatement(); 
if(type.equals("messages"))
{
sql="select* from messages ";
}
else
	if(type.equals("practice"))
	{
		sql="select* from practice";
		
	}
	else
		if(type.equals("messages_limit"))
		{
			sql="select* from messages order by date desc limit 0,6";
			}
		else
			if(type.equals("practice_limit"))
			{
				sql="select* from practice order by date desc limit 0,1";
				}

rs=st.executeQuery(sql);

}
catch(SQLException e)
{
	  
	  System.out.println(e);
	    
}

    	return rs;
    	
    
    	
    }
    
    //分页显示资讯公告和##############
    
   public static ResultSet paging_message(String page,String form)
   {
	   ResultSet rs=null;
		Connection conn;  
	
	      Statement st;
String sql=null;
int page_number=Integer.parseInt(page);
page_number-=1;


try
{
	conn=getConnection();
	st=conn.createStatement(); 
	sql="select* from "+form+" order by date desc  limit "+(page_number)*10+",10";
	//System.out.println(sql);
	rs=st.executeQuery(sql);
	
	
}
catch(SQLException e)
{
	System.out.print(e);


}
	   return rs;
	   
   }
    
    
    
    
    
    
}  
