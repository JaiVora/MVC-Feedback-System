/*
 * Author: Jai Vora
 * controller.java is the servlet file that handles all clients requests and delegates the,
 * */

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class controller
 */
@WebServlet("/controller")
public class controller extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html"); 
		StudentBean sB = new StudentBean();
		sB.setUsername(request.getParameter("username"));
		if(!(request.getParameter("address").isEmpty())) {
			sB.setAddress(request.getParameter("address"));
		}
		if(!(request.getParameter("zip").isEmpty())) {
			sB.setZip(request.getParameter("zip"));
		}
		if(!(request.getParameter("city").isEmpty())) {
			sB.setCity(request.getParameter("city"));
		}
		if(!(request.getParameter("state").isEmpty())) {
			sB.setState(request.getParameter("state"));
		}
		if(!(request.getParameter("phone").isEmpty())) {
			sB.setPhone(request.getParameter("phone"));
		}
		if(!(request.getParameter("email").isEmpty())) {
			sB.setEmail(request.getParameter("email"));
		}
		if(!(request.getParameter("link").isEmpty())) {
			sB.setLink(request.getParameter("link"));
		}
		if(!(request.getParameter("date").isEmpty())) {
			sB.setDate(request.getParameter("date"));
		}
		String[] arr = request.getParameterValues("cs");
		StringBuilder sbString = new StringBuilder("");
		for(int p = 0; p < arr.length; p++) {
			sbString.append(arr[p]).append(",");
		}
		String strList = sbString.toString();
		sB.setCs(strList);
		sB.setInterest(request.getParameter("interest"));
		if(!(request.getParameter("comment").isEmpty())) {
			sB.setComment(request.getParameter("comment"));
		}
		if(!(request.getParameter("mo").isEmpty())) {
			sB.setMonth(request.getParameter("mo"));
		}
		
		if(!(request.getParameter("year").isEmpty())) {
			sB.setYear(request.getParameter("year"));
		}
		if(!(request.getParameter("like").isEmpty())) {
			sB.setLikelihood(request.getParameter("like"));
		}
		if(!(request.getParameter("sid").isEmpty())) {
			sB.setStudentId(request.getParameter("sid"));
		}
		StudentDAO a = new StudentDAO(sB);
		List<String> list = a.storeData();
		//Data Processing Begins
		String string = request.getParameter("data");
		if(!(string.isEmpty())) {
			String[] data = string.split(",");
		    int[] numbers = new int[data.length];
			for(int i = 0;i < data.length;i++)
			{
				numbers[i] = Integer.parseInt(data[i]);
			}
			List<Integer> f_data = new ArrayList<Integer>();
			for(int i = 0;i < numbers.length;i++)
			{
				f_data.add(i, numbers[i]);
			}
			DataProcessor dp = new DataProcessor();
			DataBean dB = dp.mean_stD(f_data);
			HttpSession session = request.getSession();
            session.setAttribute("bean", dB);
            session.setAttribute("studentid",list);
            RequestDispatcher rd;
            if (dB.getMean() >= 90) {
                rd = request.getRequestDispatcher("WinnerAcknowledgement.jsp");
                rd.forward(request, response);
            } 
            else {
                rd = request.getRequestDispatcher("SimpleAcknowledgement.jsp");
                rd.forward(request, response);
            }
		}	
	}
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 StudentBean sb2 = new StudentBean();
         StudentDAO dao = new StudentDAO(sb2);
         sb2 = dao.retrieveData(req.getParameter("param"));
         RequestDispatcher rd;
        if (sb2 != null) {
            req.setAttribute("studentbean", sb2);
            rd = req.getRequestDispatcher("StudentJSP.jsp");
            rd.include(req, resp);
        } else {
            rd = req.getRequestDispatcher("NoSuchStudentJSP.jsp");
            rd.include(req, resp);
        }
    }


}
