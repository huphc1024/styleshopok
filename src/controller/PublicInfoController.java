package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import constant.Define;
import dao.CatDao;
import dao.ProductDao;
import entities.Customer;

@Controller
public class PublicInfoController {
	@Autowired
	private Define define;
	@Autowired
	private CatDao catDao;
	@Autowired
	private ProductDao pDao;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, HttpSession session){
		modelMap.addAttribute("listCat", catDao.getItems());
		modelMap.addAttribute("define", define);
		modelMap.addAttribute("listProNew", pDao.getItemsNew());
		Customer objCustomer = (Customer) session.getAttribute("objCustomer");
		modelMap.addAttribute("objCus", objCustomer);
		
	}
	@RequestMapping("/about")
	public String about(ModelMap modelMap){
		modelMap.addAttribute("title", "Về chúng tôi");
		modelMap.addAttribute("hrefhome", "/about");
		return "public.index.about";
	}
	@RequestMapping("/about/thong-tin-giao-hang")
	public String detail(ModelMap modelMap){
		modelMap.addAttribute("title", "Thông tin giao hàng");
		modelMap.addAttribute("hrefhome", "/about/thong-tin-giao-hang");
		return "public.info.thongtingiaohang";
	}
	@RequestMapping("/about/chinh-sach-bao-mat")
	public String csbm(ModelMap modelMap){
		modelMap.addAttribute("title", "Chính sách bảo mật");
		modelMap.addAttribute("hrefhome", "/about/chinh-sach-bao-mat");
		return "public.info.chinhsachbaomat";
	}
	@RequestMapping("/about/dieu-khoan-&-dieu-kien")
	public String dieukhoan(ModelMap modelMap){
		modelMap.addAttribute("title", "Điều khoản & Điều kiện");
		modelMap.addAttribute("hrefhome", "/about/dieu-khoan-&-dieu-kien");
		return "public.info.dieukhoan";
	}
}
