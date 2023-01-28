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
 * Servlet implementation class DeleteRecord
 */
@WebServlet("/dr")
public class DeleteRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteRecord() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
    protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	PrintWriter out=arg1.getWriter();
    	arg1.setContentType("text/html");
    	try {
			Connection conn= DBService.getConnection();
			PreparedStatement pst= conn.prepareStatement("delete from student where stu_id=?");
			int sid=Integer.parseInt(arg0.getParameter("sid"));
			pst.setInt(1, sid);
			int i=pst.executeUpdate();
			if(i>0) {
				out.println("<center><font color= red>Record Deleted Sucessfully</font></center>");
				RequestDispatcher rd=arg0.getRequestDispatcher("ShowRecord.jsp");
				rd.include(arg0, arg1);
				//out.println("<br><a href=Register.html>Add More</a>");
			 }else {
				 out.println("<center><font color= red>No Record Found </font></center>");
					RequestDispatcher rd=arg0.getRequestDispatcher("ShowRecord.jsp");
					rd.include(arg0, arg1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			out.println(e.getMessage());
		}
    }

}
