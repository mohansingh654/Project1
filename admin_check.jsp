<%@ page  import="java.sql.*"  %>
<%
String un=request.getParameter("un");
String pw=request.getParameter("pw");
session.setAttribute("un",un);
session.setAttribute("pw",pw);


try
{

Class.forName("com.mysql.jdbc.Driver");	
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ration","root","root");
PreparedStatement ps=con.prepareStatement("select * from  admin where un='"+un+"' && pw='"+pw+"'");
ResultSet rs=ps.executeQuery();
if(rs.next())
{
response.sendRedirect("admin_user_details.jsp");
}
else
{
response.sendRedirect("admin_login_error.jsp");
}
}
catch(Exception e)
{
out.println(e.getMessage());
}

%>