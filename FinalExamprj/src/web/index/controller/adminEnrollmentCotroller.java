package web.index.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.index.Service.EnrollmentService;
import web.index.entity.Lecture;

@WebServlet("/adminenrollment")
public class adminEnrollmentCotroller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		EnrollmentService service = new EnrollmentService();
		List<Lecture> list = new ArrayList<Lecture>();
	

		String field = "code"; 
		String field_ = request.getParameter("selection");
		if (field_ != null && !field_.equals(" ")) {
			field = field_;
		}

		String search = "";
		String search_ = request.getParameter("search");
		if (search_ != null && !search_.equals("")) {
			search = search_;
		}
		list = service.lectureList(field, search);

		request.setAttribute("list", list);

		//검색 기능
		
		String id = (String) request.getSession().getAttribute("adminid");


		request.getRequestDispatcher("/adminenrollment.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		//인코딩 UTF-8로 설정
		
		PrintWriter out = response.getWriter();
		
		EnrollmentService service = new EnrollmentService();
		String code_ = request.getParameter("code");
		String code = null ;
		if(code_!=null&&!code_.equals(""))
		{
			code= code_;
		}
		int result = service.deleteLecture(code);
		if(result==1)
		{
			out.println("<script>alert('해당 강의가 성공적으로 삭제되었습니다.');</script>");
			out.println("<script>location.href='/adminenrollment'</script>");
		}
	
	
		
	}
}
