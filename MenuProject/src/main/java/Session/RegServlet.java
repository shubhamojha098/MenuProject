package Session;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.db.DBService;

/**
 * Servlet implementation class RegServlet
 */
@WebServlet("/reg")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
    protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
    	
    	PrintWriter out=arg1.getWriter();
    	arg1.setContentType("text/html");
    	String name=arg0.getParameter("name");
    	int age=Integer.parseInt(arg0.getParameter("age"));
    	String city=arg0.getParameter("city");
    	String state=arg0.getParameter("state");
    	String mobile=arg0.getParameter("mobile");
    	String course=arg0.getParameter("course");
    	try {
			Connection conn=DBService.getConnection();
			PreparedStatement pst=conn.prepareStatement("insert into student (name,age,city,state,mobile,course)values(?,?,?,?,?,?)");
			pst.setString(1, name);
			pst.setInt(2, age);
			pst.setString(3, city);
			pst.setString(4, state);
			pst.setString(5, mobile);
			pst.setString(6, course);
//			Statement st=conn.createStatement();
//			String sql="insert into student (name,age,city,state,mobile,course)values(' "
//					+name+" ' ,"+age+",' "+city+" ',' "+state+" ',' "+mobile+" ',' "+course+" ')";
		 int u=pst.executeUpdate();
		 if(u>0) {
			out.println("<center><font color= red>Record Added Sucessfully</font></center>");
			RequestDispatcher rd=arg0.getRequestDispatcher("ShowRecord.jsp");
			rd.include(arg0, arg1);
			//out.println("<br><a href=Register.html>Add More</a>");
		 }else {
			arg1.sendRedirect("Register.jsp");
		}
		} catch (Exception e) {
			
			out.println(e.getMessage());
		}
    	
    }
}
