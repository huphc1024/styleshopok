package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import constant.Define;
import entities.UserAdd;

@Controller
@RequestMapping("/admincp")
public class AuthController {
	@Autowired
	private Define define;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap){
		modelMap.addAttribute("define", define);
	}
	@RequestMapping("/login/")
	public String index(@RequestParam(value="error", defaultValue="2") String error ,ModelMap modelMap){
		modelMap.addAttribute("login", "login");
		modelMap.addAttribute("error", "loginErr");
		return "admin.login";
	}
	@RequestMapping("/login")
	public String index(ModelMap modelMap){
		modelMap.addAttribute("login", "login");
		return "admin.login";
	}
	@RequestMapping("/403")
	public String err(ModelMap modelMap){
		return "admin.403";
	}
}
