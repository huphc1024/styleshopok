package controller;

import java.io.File;
import java.security.Principal;

import javax.servlet.ServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Define;
import dao.BannerDao;
import dao.CatDao;
import dao.CommentDao;
import dao.CustomerDao;
import dao.LienHeDao;
import dao.OrderDetailDao;
import dao.ProductDao;
import dao.UserDao;
import entities.Slider;
import utils.SlugUtils;
import utils.StringUtils;

@Controller
@RequestMapping("/admincp")
public class AdminOrdersController {
	@Autowired
	private Define define;
	@Autowired
	private UserDao userDao;
	@Autowired
	private CatDao catDao;
	@Autowired
	private ProductDao pDao;
	@Autowired
	private LienHeDao lienHeDao;
	@Autowired
	private SlugUtils slugUtils;
	@Autowired
	private StringUtils stringUtils;
	@Autowired
	private CommentDao commentDao;
	@Autowired
	private CustomerDao customerDao;
	@Autowired
	private BannerDao bannerDao;
	@Autowired
	private OrderDetailDao orderDetailDao;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal){
		modelMap.addAttribute("name", userDao.getItemByName(principal.getName()).getFullname());
		modelMap.addAttribute("define", define);
		modelMap.addAttribute("slugUtils", slugUtils);
	}
	@RequestMapping("/orders")
	public String orders(ModelMap modelMap){
		modelMap.addAttribute("listOrders", orderDetailDao.getItemsOrdersIndex());
		return "admin.orders.orders";
	}
	@RequestMapping("/orders/info/{id}")
	public String info(ModelMap modelMap, @PathVariable("id") int id){
		modelMap.addAttribute("objOrder", orderDetailDao.getItemOrder(id));
		return "admin.orders.info";
	}
	@RequestMapping("/orders/del")
	public String delslider(ModelMap modelMap, ServletRequest request, RedirectAttributes ra) {
		String[] selected = request.getParameterValues("selected");
		if (selected == null) {
			return "redirect:/admincp/orders";
		}else{
		int dem = 0;
		for (String i : selected) {
			int id = Integer.parseInt(i);
			if (orderDetailDao.delItem(id) > 0) {
				dem++;
			}
			
		}
		if (dem == selected.length) {
			ra.addFlashAttribute("msg", " Thành công: Thông tin danh mục đã được cập nhật!");
			return "redirect:/admincp/orders";
		} else {
			ra.addFlashAttribute("msg", " Thất bại");
			return "redirect:/admincp/orders";
		}
		}
	}
}
