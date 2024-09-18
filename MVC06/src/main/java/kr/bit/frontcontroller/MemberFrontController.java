package kr.bit.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.bit.controller.Controller;


@WebServlet("*.do")
public class MemberFrontController extends HttpServlet {	
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		//한글처리방법
		request.setCharacterEncoding("utf-8");
				
		// 클라이언트가 어떤 요청을 했는지 파악하기
		String url = request.getRequestURI();
//		System.out.println(url); // /MVC04/memberList.do
		String ctx = request.getContextPath();
//		System.out.println(ctx); // /MVC04
		
		// 실제로 요청한 명령이 무엇인지 파악
		String command = url.substring(ctx.length());
		//System.out.println(command); // /memberList.do
		
		Controller controller = null;
		String nextPage = null;
		
		// 핸들러 매핑 -> HandlerMapping
		HandlerMapping mapping = new HandlerMapping();
		controller = mapping.getController(command);
		nextPage = controller.requestHandler(request, response);
		//요청에 따른 분기작업(if~ else if~)
//		if(command.equals("/memberList.do")) { // 회원리스트보기
//			controller = new MemberListController();						
//			nextPage = controller.requestHandler(request, response);
//		}else if(command.equals("/memberInsert.do")) { // 회원가입
//			controller = new MemberInsertController();						
//			nextPage = controller.requestHandler(request, response);			
//		}else if(command.equals("/memberRegister.do")) { // 회원가입화면
//			controller = new MemberRegisterController();						
//			nextPage = controller.requestHandler(request, response);			
//		}else if(command.equals("/memberContent.do")) {
//			controller = new MemberContentController();						
//			nextPage = controller.requestHandler(request, response);			
//		}else if(command.equals("/memberUpdate.do")) {
//			controller = new MemberUpdateController();						
//			nextPage = controller.requestHandler(request, response);
//		}else if(command.equals("/memberDelete.do")) {
//			controller = new MemberDeleteController();						
//			nextPage = controller.requestHandler(request, response);			
//		} // if_end
		
		// forward(View로), redirect(다른 Controller로) 구분하는 방법
		if(nextPage != null) {
			if(nextPage.indexOf("redirect:") != -1) {
				// redirect:/MVC04/memberList.do
				response.sendRedirect(nextPage.split(":")[1]); // redirect
			}else {
//				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/member/"+nextPage+".jsp"); //forward
				RequestDispatcher rd = request.getRequestDispatcher(ViewResolver.makeView(nextPage));
				rd.forward(request, response);
			}
		}
	}
}
