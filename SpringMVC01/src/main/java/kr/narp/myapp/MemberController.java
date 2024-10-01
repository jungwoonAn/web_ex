package kr.narp.myapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.bit.model.MemberDAO;
import kr.bit.model.MemberVO;

// @ -> 어노테이션(전처리) -> Spring Container 에서 관리를 해준다.
@Controller
public class MemberController {
	@Autowired
	private MemberDAO dao;  // DI(Dependency Injection)
	
	@RequestMapping("/memberList.do")
	public String memberList(Model model) { //HttpServletRequest == Model		
//		MemberDAO dao = new MemberDAO();
		List<MemberVO> list = dao.memberList();
		// 객체 바인딩
		model.addAttribute("list", list);
		
		return "memberList";
	}
	
	@RequestMapping("/memberInsert.do")
	public String memberInsert(MemberVO vo) {  // 파라미터 수집(VO)		
		// 인코딩(한글 깨지는 부분 처리) -> web.xml에서 CharacterEncodingFilter 설정 추가
		int cnt = dao.memberInsert(vo); 
		
		return "redirect:/memberList.do";
	}
	
	@RequestMapping("/memberRegister.do")
	public String memberRegister() {			
		return "memberRegister";
	}
	
	@RequestMapping("/memberDelete.do")
	public String memberDelete(int num) {  // 파라미터 수집(num) // @RequestParam("num") int su
		int cnt = dao.memberDelete(num);
		
		return "redirect:/memberList.do";
	}
	
	@RequestMapping("/memberContent.do")
	public String memberContent(int num, Model model) {
		MemberVO vo = dao.memberContent(num);
		// 객체 바인딩
		model.addAttribute("vo", vo);
		
		return "memberContent";
	}
	
	@RequestMapping("/memberUpdate.do")
	public String memberUpdate(MemberVO vo) {
		int cnt = dao.memberUpdate(vo);
		
		return "redirect:/memberList.do";
	}
}
