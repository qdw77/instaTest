package egovframework.com.user.web;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.user.service.UserService;
import egovframework.com.util.SHA256;

@Controller
public class UserController {
	@Resource(name="UserService")
	private UserService userService;
	
	/*
	 * @RequestMapping("/User.do") public String main(HttpSession session, Model
	 * model){ HashMap<String, Object> }
	 */

	@RequestMapping("/join.do")
	public String join() {
		return "join";
	}
	
	@RequestMapping("/insta/insertUser.do")
	public ModelAndView insertUser(@RequestParam HashMap<String, Object> paramMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		String pw 
		return null;
		
	}
	
	
	
}
