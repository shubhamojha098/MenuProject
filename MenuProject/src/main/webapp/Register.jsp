<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>
   
</head>
<body>
<%
	try{
	session=request.getSession(false);
	if(!(session!=null&&session.getAttribute("usertype").equals("admin")))
	{
		RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
		String msg="<center><font color=red>Login First to Acess this page</font></center>";
		request.setAttribute("msg", msg);
		rd.forward(request, response);
	}
	}catch(Exception e)
{
	response.sendRedirect("Login.jsp");
}%>
    <h2 align="center">Registration</h2>
    <hr color="red" size="5"/>
    <form action="reg" method="post">
        <table width="60%" align="center">
            <tr>
                <td>
                    <fieldset>
                        <legend>
                            <b>Registration Form:</b>
                        </legend>
                           <table border="1" cellspacing="0" width="100%" cellpadding="3px">
                            <tr>
                                <td>Full Name:</td>
                                <td><input type="text" name="name"/></td>
                            </tr>
                             <tr>
                                <td>Password</td>
                                <td><input type="text" name="password"/></td>
                            </tr>
                            </tr>
                            <tr>
                                <td>Age</td>
                                <td><input type="number" name="age" min="18" max="100" step="2"/></td>
                            </tr>
                            <tr>
                            <td>Mobile Number</td>
                            <td><input type="text" name="mobile"></td>
                            <tr>
                                <td>Course</td>
                                <td>
                                <input type="radio"name="course" value="M Tech">M Tech
                                    <input type="radio" name="course" value="B Tech">B Tech
                                    <input type="radio" name="course" value="BCA">BCA
                                    <input type="radio" name="course" value="MCA">MCA
                                    <input type="radio" name="course" value="MBA">MBA
                                </td>
                            </tr>
                            <tr>
                                <td>City</td>
                                <td>
                                    <select name="city">
                                    
                                    <option value="Patna">Patna</option>
                                    <option value="Gaya">Gaya</option>
                                    <option value="Nawada">Nawada</option>
                                    <option value="Lucknow">Lucknow</option>
                                    <option value="Gorakhpur">Gorakhpur</option>
                                    <option value="Varanasi">Varanasi</option>
                                    <option value="Bhopal">Bhopal</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>State</td>
                                <td>
                                    <select name="state">
                                    <option value="Bihar">Bihar</option>
                                    <option value="UP">UP</option>
                                    <option value="MP">MP</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" name="terms"/>
                                I accept <a href="#">Term and Condition</a>
                             </td>
                            
                                <td>
                                   		<input type="submit" value="Signup">
                                </td>
                            </tr>                     
                           </table>
                    </fieldset>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>