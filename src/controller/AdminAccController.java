package controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Define;
import dao.CustomerDao;
import dao.LienHeDao;
import dao.UserDao;
import entities.Customer;
import entities.CustomerEdit;
import entities.UserAdd;
import entities.UserEdit;
import utils.StringUtils;

@Controller
@RequestMapping("/admincp/account")
public class AdminAccController {
	@Autowired
	private Define define;
	@Autowired
	private StringUtils stringUtils;
	@Autowired
	private UserDao userDao;
	@Autowired
	private CustomerDao customerDao;
	@Autowired
	private LienHeDao lienHeDao;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal){
		modelMap.addAttribute("name", userDao.getItemByName(principal.getName()).getFullname());
		modelMap.addAttribute("define", define);
	}
	@RequestMapping("/customer")
	public String orders(ModelMap modelMap){
		modelMap.addAttribute("listCustomer", customerDao.getItems());
		return "admin.acc.customer";
	}
	@RequestMapping("/user")
	public String user(ModelMap modelMap){
		modelMap.addAttribute("listUser", userDao.getItems());
		return "admin.acc.user";
	}
	@RequestMapping("/user/edit/{id}")
	public String edituser(ModelMap modelMap, @PathVariable("id") int id){
		modelMap.addAttribute("objUser", userDao.getItem(id));
		return "admin.acc.user.edit";
	}
	@RequestMapping(value="/user/edit/{id}", method=RequestMethod.POST)
	public String edituser(@Valid @ModelAttribute("objUser") UserEdit objUser, BindingResult rs,@PathVariable("id") int id,@RequestParam("re_password") String repass,ModelMap modelMap, RedirectAttributes ra){
		if(rs.hasErrors()){
			modelMap.addAttribute("objUser", objUser);
			return "admin.acc.user.edit";
		}
		if(!repass.equals(objUser.getPassword()) || (objUser.getPassword().length() < 6 && objUser.getPassword().length() > 0)){
			modelMap.addAttribute("objUser", objUser);
			modelMap.addAttribute("msgRepass", "Mật khẩu phải trùng nhau");
			modelMap.addAttribute("msgPass", "Mật khẩu phải lớn hơn 6 ký tự");
			return "admin.acc.user.edit";
		}
			if(!objUser.getPassword().isEmpty()){
				objUser.setPassword(stringUtils.md5(objUser.getPassword()));
			}else{
				objUser.setPassword(userDao.getItem(id).getPassword());
			}
			objUser.setId_user(id);
			if(userDao.editItem(objUser) > 0){
				ra.addFlashAttribute("msg", "Sửa thành công");
			}else{
				ra.addFlashAttribute("msg", "Sửa thất bại");
			}
		return "redirect:/admincp/account/user";
	}
	@RequestMapping("/user/add")
	public String addtuser(){
		return "admin.acc.user.add";
	}
	@RequestMapping("/user/del")
	public String deluser(ServletRequest request,  ModelMap modelMap, RedirectAttributes ra){
		String[] selected = request.getParameterValues("selected");
		if(selected == null){
			return "redirect:/admincp/account/user";
		}else{
		int dem = 0;
		for (String i : selected) {
			int id = Integer.parseInt(i);
			if(userDao.delItem(id) > 0){
				dem++;
			};
		}
		if(dem == selected.length){
			ra.addFlashAttribute("msg", " Thành công: Thông tin tài khoản đã được cập nhật!");
			ra.addFlashAttribute("listUser", userDao.getItems());
		}else{
			ra.addFlashAttribute("msg", " Thất bại");
			ra.addFlashAttribute("listUser", userDao.getItems());
		}
		ra.addFlashAttribute("listUser", userDao.getItems());
		return "redirect:/admincp/account/user";
		}
	}
	@RequestMapping(value="/customer/del", method=RequestMethod.POST)
	public String delcustomer(ServletRequest request,  ModelMap modelMap, RedirectAttributes ra){
		String[] selected = request.getParameterValues("selected");
		if(selected == null){
			return "redirect:/admincp/account/customer";
		}else{
		int dem = 0;
		for (String i : selected) {
			int id = Integer.parseInt(i);
			if(customerDao.delItem(id) > 0){
				dem++;
			};
		}
		if(dem == selected.length){
			ra.addFlashAttribute("msg", " Thành công: Thông tin khách hàng đã được cập nhật!");
			ra.addFlashAttribute("listCustomer", customerDao.getItems());
		}else{
			ra.addFlashAttribute("msg", " Thất bại");
			ra.addFlashAttribute("listCustomer", customerDao.getItems());
		}
			return "redirect:/admincp/account/customer";
		}
	}
	@RequestMapping(value="/user/add", method=RequestMethod.POST)
	public String addtuser(@Valid @ModelAttribute("objUser") UserAdd objUser, BindingResult rs,@RequestParam("re_password") String repass,ModelMap modelMap, RedirectAttributes ra){
		if(rs.hasErrors()){
			modelMap.addAttribute("objUser", objUser);
			return "admin.acc.user.add";
		}
		if(!repass.equals(objUser.getPassword())){
			modelMap.addAttribute("objUser", objUser);
			modelMap.addAttribute("msgRepass", "Mật khẩu phải trùng nhau");
			modelMap.addAttribute("msgPass", "Mật khẩu phải lớn hơn 6 ký tự");
			return "admin.acc.user.add";
		}
		// xử lý trùng tên
		int check = 0;
		List<UserAdd> list = userDao.getItems();
		for (UserAdd objU : list) {
			if(objUser.getUsername().equals(objU.getUsername())){
				check = 1;
				break;
			}
		}
		if(check == 1){
			// đã tồn tại user
			ra.addFlashAttribute("objUser", objUser);
			ra.addFlashAttribute("msgt", "Đã tồn tại username");
			return "redirect:/admincp/account/user/add";
		}else{
			objUser.setPassword(stringUtils.md5(objUser.getPassword()));
			if(userDao.addItem(objUser) > 0){
				ra.addFlashAttribute("msg", "Thêm thành công");
			}else{
				ra.addFlashAttribute("msg", "Thêm thất bại");
			}
		}
		ra.addFlashAttribute("listUser", userDao.getItems());
		return "redirect:/admincp/account/user";
	}
	@RequestMapping("/customer/edit/{id}")
	public String editcustomer(ModelMap modelMap, @PathVariable("id") int id){
		modelMap.addAttribute("objCus", customerDao.getItem(id));
		return "admin.acc.customer.edit";
	}
	@RequestMapping("/customer/add")
	public String addcustomer(){
		return "admin.acc.customer.add";
	}
	@RequestMapping(value="/customer/edit/{id}", method=RequestMethod.POST)
	public String editcustomer(@Valid @ModelAttribute("objItem") CustomerEdit objItem, BindingResult rs,@PathVariable("id") int id,ModelMap modelMap, RedirectAttributes ra){
		if(rs.hasErrors()){
			modelMap.addAttribute("objCus", objItem);
			return "admin.acc.customer.edit";
		}
			objItem.setId_customer(id);
			if(customerDao.editItem(objItem) > 0){
				ra.addFlashAttribute("msg", "Sửa thành công");
			}else{
				ra.addFlashAttribute("msg", "Sửa thất bại");
			}
			ra.addFlashAttribute("listCustomer", customerDao.getItems());
		return "redirect:/admincp/account/customer";
	}
	@RequestMapping(value="/customer/add", method=RequestMethod.POST)
	public String addcustomer(@Valid @ModelAttribute("objItem") Customer objItem, BindingResult rs,@RequestParam("re_password") String repass,ModelMap modelMap, RedirectAttributes ra){
		if(rs.hasErrors()){
			modelMap.addAttribute("objCus", objItem);
			return "admin.acc.customer.add";
		}
		if(!objItem.getTelephone().matches("\\d*")){
			modelMap.addAttribute("objCus", objItem);
			modelMap.addAttribute("msgTele", "Telephone không đúng");
			return "admin.acc.customer.add";
		}
		if(!objItem.getPostcode().matches("\\d*")){
			modelMap.addAttribute("objCus", objItem);
			modelMap.addAttribute("msgPost", "Postcode không đúng");
			return "admin.acc.customer.add";
		}
		if(!repass.equals(objItem.getPassword())){
			modelMap.addAttribute("objCus", objItem);
			modelMap.addAttribute("msgRepass", "Mật khẩu phải trùng nhau");
			return "admin.acc.customer.add";
		}
		// xử lý trùng tên
		int check = 0;
		List<Customer> list = customerDao.getItems();
		for (Customer objU : list) {
			if(objItem.getUsername().equals(objU.getUsername())){
				check = 1;
				break;
			}
		}
		for (Customer objU : list) {
			if(objItem.getEmail().equals(objU.getEmail())){
				check = 2;
				break;
			}
		}
		if(check == 1){
			// đã tồn tại user
			ra.addFlashAttribute("objCus", objItem);
			ra.addFlashAttribute("msgt", "Đã tồn tại username");
			return "redirect:/admincp/account/customer/add";
		}else if(check == 2){
			ra.addFlashAttribute("objCus", objItem);
			ra.addFlashAttribute("msgt", "Đã tồn tại Email đăng ký");
			return "redirect:/admincp/account/customer/add";
		}
		else{
			objItem.setActive(1);
			objItem.setPassword(stringUtils.md5(objItem.getPassword()));
			if(customerDao.addItem(objItem) > 0){
				ra.addFlashAttribute("msg", "Thêm thành công");
			}else{
				ra.addFlashAttribute("msg", "Thêm thất bại");
			}
		}
		ra.addFlashAttribute("listCustomer", customerDao.getItems());
		return "redirect:/admincp/account/customer";
	}
	@RequestMapping("/lien-he")
	public String lienhe(ModelMap modelMap){
		modelMap.addAttribute("listLienHe", lienHeDao.getItems());
		return "admin.acc.lienhe";
	}
	@RequestMapping(value="/lien-he/del" , method=RequestMethod.POST)
	public String lienhedel(ServletRequest request,  ModelMap modelMap, RedirectAttributes ra){
		String[] selected = request.getParameterValues("selected");
		if(selected == null){
			return "redirect:/admincp/account/lien-he";
		}else{
		for (String i : selected) {
			int id = Integer.parseInt(i);
			lienHeDao.delItem(id);
		}
		ra.addFlashAttribute("msg", " Thành công: Thông tin liên hệ đã được cập nhật!");
		ra.addFlashAttribute("listLienHe", lienHeDao.getItems());
		return "redirect:/admincp/account/lien-he";
		}
	}
	
}
