package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Define;
import dao.BannerDao;
import dao.CatDao;
import dao.CommentDao;
import dao.CustomerDao;
import dao.LienHeDao;
import dao.OrderDetailDao;
import dao.ProductDao;
import dao.SliderDao;
import entities.Category;
import entities.Comment;
import entities.Customer;
import entities.CustomerDefault;
import entities.LienHe;
import entities.OrdersDetail;
import entities.Product;
import utils.SlugUtils;
import utils.StringUtils;

@Controller
public class PublicIndexController {
	@Autowired
	private Define define;
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
	@Autowired
	private SliderDao sliderDao;
	private ArrayList<Product> listCart = new ArrayList<>();

	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, HttpSession session) {
		modelMap.addAttribute("listCat", catDao.getItems());
		modelMap.addAttribute("define", define);
		modelMap.addAttribute("listProNew", pDao.getItemsNew());
		modelMap.addAttribute("slugUtils", slugUtils);
		modelMap.addAttribute("listBanner", bannerDao.getItems());
		Customer objCustomer = (Customer) session.getAttribute("objCustomer");
		modelMap.addAttribute("objCus", objCustomer);
		modelMap.addAttribute("listCart", listCart);
	}

	@RequestMapping("/{slug}-{id}.html")
	public String detail(@PathVariable("slug") String slug, @PathVariable("id") String id, ModelMap modelMap) {
		int nid = Integer.parseInt(id);
		modelMap.addAttribute("title", pDao.getItem(nid).getName());
		modelMap.addAttribute("hrefhome", SlugUtils.toSlug(pDao.getItem(nid).getName()) + "-" + nid + ".html");
		modelMap.addAttribute("objProduct", pDao.getItem(nid));
		modelMap.addAttribute("listComment", commentDao.getItemsByDetail(nid));
		modelMap.addAttribute("countCmt", commentDao.CountCmt(nid));
		return "public.index.detail";
	}

	@RequestMapping("/{slug}-{id}")
	public String cat(@PathVariable("slug") String slug, @PathVariable("id") String id,
			@RequestParam(value = "page", defaultValue = "1") int page, RedirectAttributes ra, ModelMap modelMap) {
		try {
			int cid = Integer.parseInt(id);
			if (catDao.checkItem(cid) == 0) {
				modelMap.addAttribute("error", "error404");
				modelMap.addAttribute("title", "Error 404");
				return "public.index.error";
			}
			String nameSlug = SlugUtils.toSlug(catDao.getItem(cid).getName());
			if (!slug.equals(nameSlug)) {
				ra.addFlashAttribute("title", catDao.getItem(cid).getName());
				ra.addFlashAttribute("hrefhome", nameSlug + "-" + cid);
				return "redirect:/" + nameSlug + "-" + cid;
			}
			modelMap.addAttribute("objCat", catDao.getItem(cid));
			modelMap.addAttribute("title", catDao.getItem(cid).getName());
			modelMap.addAttribute("hrefhome", nameSlug + "-" + cid);
			int current_page = 1;
			int num = 8;

			int sumNews = pDao.countProductByCat(cid);
			int sumPage = (int) Math.ceil((float) sumNews / num);
			modelMap.addAttribute("sumPage", sumPage);
			if (page != 0) {
				current_page = page;
			}
			modelMap.addAttribute("current_page", current_page);
			int offset = (current_page - 1) * num;
			if (catDao.getItem(cid).getParent_id() == 0) {
				modelMap.addAttribute("listProductByCat", pDao.getItemsCatParent(cid, offset));
			} else {
				modelMap.addAttribute("listProductByCat", pDao.getItemsByCat(cid, offset));
			}
			return "public.index.cat";
		} catch (Exception e) {
			modelMap.addAttribute("error", "error404");
			modelMap.addAttribute("title", "Error 404");
			return "public.index.error";
		}

	}

	@RequestMapping("")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("title", "StyleShop");
		modelMap.addAttribute("hrefhome", "/");
		modelMap.addAttribute("objSlider", sliderDao.getItems());
		int i = 1;
		for (Category cat : catDao.getItemsIndex()) {
			modelMap.addAttribute("obj" + i, catDao.getItem(cat.getId_cat()));
			modelMap.addAttribute("list" + i, pDao.getItemsByCatIndex(cat.getId_cat()));
			i++;
		}
		return "public.index.index";
	}

	@RequestMapping("/lien-he")
	public String lienhe(ModelMap modelMap) {
		modelMap.addAttribute("title", "Liên hệ");
		modelMap.addAttribute("hrefhome", "/lien-he");
		return "public.index.lienhe";
	}

	@RequestMapping(value = "/lien-he", method = RequestMethod.POST)
	public String lienhe(@Valid @ModelAttribute("objLH") LienHe objLH, BindingResult rs, RedirectAttributes ra,
			ModelMap modelMap) {
		modelMap.addAttribute("title", "Liên hệ");
		modelMap.addAttribute("hrefhome", "/lien-he");
		if (rs.hasErrors()) {
			modelMap.addAttribute("objLH", objLH);
			return "public.index.lienhe";
		}
		if (lienHeDao.addItem(objLH) > 0) {
			ra.addFlashAttribute("msg", "Yêu cầu của bạn đã được gởi đi");
		} else {
			ra.addFlashAttribute("msg", "Có lỗi! Yêu cầu của bạn chưa được gởi đi");
		}
		return "redirect:/lien-he";
	}

	@RequestMapping("/product")
	public String product(ModelMap modelMap, @RequestParam(value = "page", defaultValue = "1") int page) {
		int current_page = 1;
		int num = 8;

		int sumNews = pDao.countProduct();
		int sumPage = (int) Math.ceil((float) sumNews / num);
		modelMap.addAttribute("sumPage", sumPage);
		if (page != 0) {
			current_page = page;
		}
		modelMap.addAttribute("current_page", current_page);
		int offset = (current_page - 1) * num;
		modelMap.addAttribute("title", "Sản phẩm");
		modelMap.addAttribute("hrefhome", "/product");
		modelMap.addAttribute("listProduct", pDao.getItems(offset));
		return "public.index.product";
	}

	@RequestMapping("/orders")
	public String orders() {
		return "public.index.orders";
	}

	// account

	@RequestMapping("/tai-khoan")
	public String account(HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("title", "Tài khoản");
		modelMap.addAttribute("hrefhome", "/tai-khoan");
		HttpSession session = request.getSession();
		if (session.getAttribute("objCustomer") == null) {
			return "public.index.login";
		} else {

			Customer objCustomer = (Customer) session.getAttribute("objCustomer");
			modelMap.addAttribute("objCus", objCustomer);
			return "public.index.account";
		}
	}

	@RequestMapping("/tai-khoan/sua-dia-chi")
	public String suadiachi(HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("title", "Địa chỉ");
		modelMap.addAttribute("hrefhome", "/tai-khoan/sua-dia-chi");
		HttpSession session = request.getSession();
		if (session.getAttribute("objCustomer") == null) {
			return "public.index.login";
		} else {

			Customer objCustomer = (Customer) session.getAttribute("objCustomer");
			modelMap.addAttribute("objCus", objCustomer);
			return "public.index.suadiachi";
		}

	}

	@RequestMapping("tai-khoan/dang-ky-nhan-tin")
	public String dknt(HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("title", "Đăng ký nhận tin");
		modelMap.addAttribute("hrefhome", "/tai-khoan/dang-ky-nhan-tin");
		HttpSession session = request.getSession();
		if (session.getAttribute("objCustomer") == null) {
			return "public.index.login";
		} else {

			Customer objCustomer = (Customer) session.getAttribute("objCustomer");
			modelMap.addAttribute("objCus", objCustomer);
			return "public.index.nhantin";
		}
	}

	@RequestMapping("/tai-khoan/danh-sach-thich")
	public String danhsachthich(HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("title", "Danh sách yêu thích");
		modelMap.addAttribute("hrefhome", "/tai-khoan/danh-sach-thich");
		HttpSession session = request.getSession();
		if (session.getAttribute("objCustomer") == null) {
			return "public.index.login";
		} else {

			Customer objCustomer = (Customer) session.getAttribute("objCustomer");
			modelMap.addAttribute("objCus", objCustomer);
			return "public.index.listlike";
		}

	}

	@RequestMapping("/tai-khoan/lich-su-dat-hang")
	public String lsdachang(HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("title", "Lịch sử đặt hàng");
		modelMap.addAttribute("hrefhome", "/tai-khoan/lich-su-dat-hang");
		HttpSession session = request.getSession();
		if (session.getAttribute("objCustomer") == null) {
			return "public.index.login";
		} else {

			Customer objCustomer = (Customer) session.getAttribute("objCustomer");
			modelMap.addAttribute("objCus", objCustomer);
			modelMap.addAttribute("listOrdersDetails",
					orderDetailDao.getItemsOrdersByIdCus(objCustomer.getId_customer()));
			return "public.index.lichsudathang";
		}

	}

	@RequestMapping("/thanh-toan")
	public String thanhtoan(HttpServletRequest request, ModelMap modelMap, HttpSession session) {
		if (session.getAttribute("objCustomer") == null) {
			modelMap.addAttribute("title", "Thanh toán");
			modelMap.addAttribute("hrefhome", "/thanh-toan");
			return "public.index.thanhtoanstep1";
		} else {
			Customer objCustomer = (Customer) session.getAttribute("objCustomer");
			modelMap.addAttribute("objCus", objCustomer);
			modelMap.addAttribute("title", "Thanh toán");
			modelMap.addAttribute("hrefhome", "/thanh-toan/step2");
			return "public.index.thanhtoanstep2";
		}

	}

	@RequestMapping(value = "/thanh-toan/{cid}", method = RequestMethod.POST)
	public String thanhtoanok(@PathVariable("cid") int cid, RedirectAttributes ra, HttpServletRequest request,
			ModelMap modelMap, HttpSession session) {
		System.out.println("abc");
		if (session.getAttribute("objCustomer") == null) {
			System.out.println("alo3");
			System.out.println(listCart.size());

			String giaohang = "";
			if ("cod".equals(request.getParameter("giaohang"))) {
				giaohang = "Giao hàng tận nhà";
			}
			;
			int sp = 0;
			float tong = 0;
			orderDetailDao.addItemOrder(cid);
			int id_orders = orderDetailDao.getItemOrderTopbyidcus(cid).getId_orders();
			System.out.println("id_orders " + id_orders);
			for (Product product1 : listCart) {
				float gia = 0;
				if (product1.getGia_sale() == 0) {
					gia = product1.getGia();
				} else {
					gia = product1.getGia_sale();
				}
				sp++;
				tong += (gia * product1.getNum());
				OrdersDetail objO = new OrdersDetail(id_orders, product1.getId_product(), product1.getName(), gia,
						product1.getNum(), giaohang);
				try {
					orderDetailDao.addItem(objO);
					System.out.println("đấy ỏ");
				} catch (Exception e) {
					return "redirect:/thanh-toan/step2";
				}
			}

			listCart.removeAll(listCart);
			return "redirect:/thanh-toan/thanh-cong";
		} else {
			System.out.println("đấy");
			Customer objCustomer = (Customer) session.getAttribute("objCustomer");
			modelMap.addAttribute("objCus", objCustomer);
			modelMap.addAttribute("title", "Thanh toán");
			modelMap.addAttribute("hrefhome", "/thanh-toan/step2");
			String giaohang = "";
			if ("cod".equals(request.getParameter("giaohang"))) {
				giaohang = "Giao hàng tận nhà";
			}
			;
			int sp = 0;
			float tong = 0;
			orderDetailDao.addItemOrder(cid);
			int id_orders = orderDetailDao.getItemOrderTopbyidcus(cid).getId_orders();
			System.out.println("id_orders " + id_orders);
			for (Product product1 : listCart) {
				float gia = 0;
				if (product1.getGia_sale() == 0) {
					gia = product1.getGia();
				} else {
					gia = product1.getGia_sale();
				}
				sp++;
				tong += (gia * product1.getNum());
				OrdersDetail objO = new OrdersDetail(id_orders, product1.getId_product(), product1.getName(), gia,
						product1.getNum(), giaohang);
				try {
					orderDetailDao.addItem(objO);
				} catch (Exception e) {
					return "redirect:/thanh-toan/step2";
				}
			}
			listCart.removeAll(listCart);
			return "redirect:/thanh-toan/thanh-cong";
		}

	}

	@RequestMapping("/thanh-toan/default")
	public String thanhtoan1(HttpServletRequest request, ModelMap modelMap, HttpSession session) {
		modelMap.addAttribute("title", "Thanh toán");
		modelMap.addAttribute("hrefhome", "/thanh-toan/default");
		return "public.index.thanhtoankhach";

	}

	@RequestMapping(value = "/thanhtoankhach", method = RequestMethod.POST)
	public String thanhtoan(@Valid @ModelAttribute("objItem") CustomerDefault objItem, BindingResult rs,
			RedirectAttributes ra, HttpServletRequest request, ModelMap modelMap, HttpSession session) {
		System.out.println("alo");
		if (rs.hasErrors()) {
			System.out.println("alo2");
			modelMap.addAttribute("title", "Thanh toán");
			modelMap.addAttribute("hrefhome", "/thanh-toan/default");
			modelMap.addAttribute("objCustomer", objItem);
			return "public.index.thanhtoankhach";
		}
		System.out.println("alo3");
		Customer objC = new Customer(0, "", "", objItem.getHo(), objItem.getTen(), objItem.getAndress(),
				objItem.getEmail(), objItem.getTelephone(), "", 0, objItem.getCity(), objItem.getPostcode(),
				objItem.getCountry());
		try {
			customerDao.addItem(objC);
			ArrayList<Customer> lisst = (ArrayList<Customer>) customerDao.getItem();
			Customer objCu = lisst.get(0);
			modelMap.addAttribute("cid", objCu.getId_customer());
		} catch (Exception e) {
			ra.addFlashAttribute("objCustomer", objItem);
			return "redirect:/thanh-toan/default";
		}
		modelMap.addAttribute("title", "Thanh toán");
		modelMap.addAttribute("hrefhome", "/thanh-toan/step2");
		return "public.index.thanhtoanstep2";

	}

	@RequestMapping("/thanh-toan/step2")
	public String thanhtoanstep2(HttpServletRequest request, ModelMap modelMap, HttpSession session) {
		if (session.getAttribute("objCustomer") == null) {
			modelMap.addAttribute("title", "Thanh toán");
			modelMap.addAttribute("hrefhome", "/thanh-toan/step2");
			return "public.index.thanhtoanstep2";
		} else {
			Customer objCustomer = (Customer) session.getAttribute("objCustomer");
			modelMap.addAttribute("objCus", objCustomer);
			modelMap.addAttribute("title", "Thanh toán");
			modelMap.addAttribute("hrefhome", "/thanh-toan/step2");
			return "public.index.thanhtoanstep2";
		}
	}

	@RequestMapping("/thanh-toan/thanh-cong")
	public String thanhtoanthc(ModelMap modelMap, HttpServletRequest request) {
		modelMap.addAttribute("title", "Thanh toán thành công");
		modelMap.addAttribute("hrefhome", "/tai-khoan/thanh-toan/thanh-cong");
		modelMap.addAttribute("title", "Đơn hàng của bạn đã được gởi thành công");
		return "public.index.thanhtoanthanhcong";

	}

	@RequestMapping("/tai-khoan/thong-tin-dia-chi")
	public String diachi(HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("title", "Thông tin địa chỉ");
		modelMap.addAttribute("hrefhome", "/tai-khoan/thong-tin-dia-chi");
		HttpSession session = request.getSession();
		if (session.getAttribute("objCustomer") == null) {
			return "public.index.login";
		} else {

			Customer objCustomer = (Customer) session.getAttribute("objCustomer");
			modelMap.addAttribute("objCus", objCustomer);
			return "public.index.thongtindiachi";
		}

	}

	@RequestMapping("/tai-khoan/thong-tin-don-hang")
	public String doanhang(HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("title", "Thông tin đơn hàng");
		modelMap.addAttribute("hrefhome", "/tai-khoan/thong-tin-don-hang");
		HttpSession session = request.getSession();
		if (session.getAttribute("objCustomer") == null) {
			return "public.index.login";
		} else {
			Customer objCustomer = (Customer) session.getAttribute("objCustomer");
			modelMap.addAttribute("objCus", objCustomer);
			int id = Integer.parseInt(request.getParameter("oid"));
			int uid = Integer.parseInt(request.getParameter("uid"));
			if(uid != objCustomer.getId_customer()) {
				return "public.index.error";
			}
			modelMap.addAttribute("listOrdersDetails", orderDetailDao.getItemOrder(id,uid));
			return "public.index.thongtindonhang";
		}

	}

	@RequestMapping("/tai-khoan/thong-tin-tai-khoan")
	public String taikhoan(HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("title", "Thông tin tài khoản");
		modelMap.addAttribute("hrefhome", "/tai-khoan/thong-tin-tai-khoan");
		HttpSession session = request.getSession();
		if (session.getAttribute("objCustomer") == null) {
			return "public.index.login";
		} else {
			Customer objCustomer = (Customer) session.getAttribute("objCustomer");
			modelMap.addAttribute("objCus", objCustomer);
			return "public.index.thongtintaikhoan";
		}

	}

	@RequestMapping("/gio-hang")
	public String giohang(ModelMap modelMap) {
		modelMap.addAttribute("title", "Giỏ hàng");
		modelMap.addAttribute("hrefhome", "/gio-hang");
		return "public.index.giohang";
	}

	@RequestMapping("/dang-ky")
	public String dangky(ModelMap modelMap) {
		modelMap.addAttribute("title", "Đăng ký");
		modelMap.addAttribute("hrefhome", "/dang-ky");
		return "public.index.dangky";
	}

	@RequestMapping(value = "/dang-ky", method = RequestMethod.POST)
	public String dangky(@Valid @ModelAttribute("objItem") Customer objItem, BindingResult rs,
			@RequestParam("re_password") String repass, ServletRequest request, RedirectAttributes ra,
			ModelMap modelMap) {
		String agree = request.getParameter("agree");
		String newsletter = request.getParameter("newsletter");
		objItem.setNewsletter(newsletter);
		if (rs.hasErrors()) {
			modelMap.addAttribute("objCus", objItem);
			modelMap.addAttribute("title", "Đăng ký");
			modelMap.addAttribute("hrefhome", "/dang-ky");
			return "public.index.dangky";
		}

		if (rs.hasErrors()) {
			modelMap.addAttribute("objCus", objItem);
			return "public.index.dangky";
		}
		if (!objItem.getTelephone().matches("\\d*")) {
			modelMap.addAttribute("objCus", objItem);
			modelMap.addAttribute("msgTele", "Telephone không đúng");
			return "public.index.dangky";
		}
		if (!objItem.getPostcode().matches("\\d*")) {
			modelMap.addAttribute("objCus", objItem);
			modelMap.addAttribute("msgPost", "Postcode không đúng");
			return "public.index.dangky";
		}
		if (!repass.equals(objItem.getPassword())) {
			modelMap.addAttribute("objCus", objItem);
			modelMap.addAttribute("msgRepass", "Mật khẩu phải trùng nhau");
			return "public.index.dangky";
		}
		if (agree == null) {
			modelMap.addAttribute("objCus", objItem);
			modelMap.addAttribute("msgAgree", "Bạn cần xác nhận");
			return "public.index.dangky";
		} else {
			// xử lý trùng tên
			int check = 0;
			List<Customer> list = customerDao.getItems();
			for (Customer objU : list) {
				if (objItem.getUsername().equals(objU.getUsername())) {
					check = 1;
					break;
				}
			}
			for (Customer objU : list) {
				if (objItem.getEmail().equals(objU.getEmail())) {
					check = 2;
					break;
				}
			}
			if (check == 1) {
				// đã tồn tại user
				modelMap.addAttribute("objCus", objItem);
				modelMap.addAttribute("msgt", "Đã tồn tại username");
				return "public.index.dangky";
			} else if (check == 2) {
				modelMap.addAttribute("objCus", objItem);
				modelMap.addAttribute("msgt", "Đã tồn tại Email đăng ký");
				return "public.index.dangky";
			} else {
				objItem.setPassword(stringUtils.md5(objItem.getPassword()));
				if (customerDao.addItem(objItem) > 0) {
					ra.addFlashAttribute("username", objItem.getUsername());
					return "redirect:/dang-nhap";
				} else {
					return "redirect:/dang-ky";
				}
			}
		}
	}

	@RequestMapping("/dang-nhap")
	public String login(ModelMap modelMap) {
		modelMap.addAttribute("title", "Đăng nhập");
		modelMap.addAttribute("hrefhome", "/dang-nhap");
		return "public.index.login";
	}

	@RequestMapping(value = "/checkCus", method = RequestMethod.POST)
	public String check(@RequestParam("account") String account, HttpServletRequest request, ModelMap modelMap,
			RedirectAttributes ra) {
		if ("guest".equals(account)) {
			return "redirect:/thanh-toan/default";
		} else {
			return "redirect:/dang-ky";
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login2(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpServletRequest request, ModelMap modelMap, RedirectAttributes ra) {
		if ("".equals(username) || username.length() < 6 || "".equals(password) || password.length() < 6) {
			ra.addFlashAttribute("title", "Đăng nhập");
			ra.addFlashAttribute("hrefhome", "/dang-nhap");
			ra.addFlashAttribute("msgFail", "Tên đăng nhập hoặc mật khẩu không đúng");
			ra.addFlashAttribute("username", username);
			return "redirect:/dang-nhap";
		} else {
			try {
				StringUtils stringUtils = new StringUtils();
				password = stringUtils.md5(new String(password.getBytes("ISO-8859-1"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			if (customerDao.checkItem(username, password) != 0) {
				// tạo session
				HttpSession session = request.getSession();
				session.setAttribute("objCustomer", customerDao.getUserLogin(username, password));
				// chuyển hướng
				ra.addFlashAttribute("objCustomer", customerDao.getUserLogin(username, password));
				return "redirect:/tai-khoan";
			} else {
				modelMap.addAttribute("msgFail", "Tên đăng nhập hoặc mật khẩu không đúng");
				modelMap.addAttribute("username", username);
				return "public.index.login";
			}
		}
	}

	@RequestMapping(value = "/checklogin", method = RequestMethod.POST)
	public String logincheck(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpServletRequest request, ModelMap modelMap, RedirectAttributes ra) {
		if ("".equals(username) || username.length() < 6 || "".equals(password) || password.length() < 6) {
			ra.addFlashAttribute("title", "Đăng nhập");
			ra.addFlashAttribute("hrefhome", "/dang-nhap");
			ra.addFlashAttribute("msgFail", "Tên đăng nhập hoặc mật khẩu không đúng");
			ra.addFlashAttribute("username", username);
			return "redirect:/dang-nhap";
		} else {
			try {
				StringUtils stringUtils = new StringUtils();
				password = stringUtils.md5(new String(password.getBytes("ISO-8859-1"), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			if (customerDao.checkItem(username, password) != 0) {
				// tạo session
				HttpSession session = request.getSession();
				session.setAttribute("objCustomer", customerDao.getUserLogin(username, password));
				modelMap.addAttribute("title", "Thanh toán");
				modelMap.addAttribute("hrefhome", "/thanh-toan/step2");
				Customer objCustomer = (Customer) session.getAttribute("objCustomer");
				modelMap.addAttribute("objCus", objCustomer);
				modelMap.addAttribute("objCustomer", customerDao.getUserLogin(username, password));
				return "public.index.thanhtoanstep2";
			} else {
				modelMap.addAttribute("msgFail", "Tên đăng nhập hoặc mật khẩu không đúng");
				modelMap.addAttribute("username", username);
				return "public.index.thanhtoanstep1";
			}
		}
	}

	@RequestMapping("/dang-xuat")
	public String logout(@ModelAttribute("objItem") Customer objItem, HttpServletRequest request,
			RedirectAttributes ra) {

		HttpSession session = request.getSession();
		if (session.getAttribute("objCustomer") != null) {
			// xóa session
			session.removeAttribute("objCustomer");
		}
		return "redirect:/";
	}

	@RequestMapping("/error404")
	public String err(ModelMap modelMap) {
		modelMap.addAttribute("error", "error404");
		modelMap.addAttribute("title", "Error 404");
		return "public.index.error";
	}

	@RequestMapping("/checkorders")
	public String checkorders(@RequestParam("num") String num, @RequestParam("id") int id, ModelMap modelMap,
			HttpSession session) {
		try {
			int number = Integer.parseInt(num);
			if (session.getAttribute("listCart") == null) {
				return "redirect:/gio-hang";
			} else {
				if (number != 0) {
					for (Product product : listCart) {
						if (product.getId_product() == id) {
							product.setNum(number);
						}
					}
				} else {
					int dem = 0;
					for (int i = 0; i < listCart.size(); i++) {
						if (listCart.get(i).getId_product() == id) {
							dem = i;
						}
						;
					}
					listCart.remove(dem);
				}
			}
		} catch (Exception e) {
			return "redirect:/gio-hang";
		}

		return "redirect:/";
	}

	@RequestMapping(value = "/danhgia", method = RequestMethod.POST)
	public void danhgia(@ModelAttribute("objItem") Comment objItem, @RequestParam("noi_dung") String noi_dung,
			@RequestParam("ho_ten") String ho_ten, @RequestParam("pid") int pid, RedirectAttributes ra,
			PrintWriter out) {
		objItem.setId_product(pid);
		commentDao.addItem(objItem);
		String comment = "";
		for (Comment objComment : commentDao.getItemsByDetail(pid)) {
			SimpleDateFormat ft = new SimpleDateFormat("dd/MM/yyyy");
			String date = ft.format(objComment.getDate_create());
			comment += "<div class='row'>" + "<div class='col-sm-1'>" + "<div class='thumbnail'>"
					+ "<img class='img-responsive user-photo hidden-xs'"
					+ "src='/styleShop/templates/public/image/avatar_2x.png'>" + "</div>" + "</div>"
					+ "<div class='col-sm-11'>" + "<div class='panel panel-default'>" + "<div class='panel-heading'>"
					+ "<strong>Tên: " + objComment.getHo_ten() + "</strong> - <span class='text-muted'>" + date
					+ "</span>" + "</div>" + "<div class='panel-body'>" + objComment.getNoi_dung() + "</div>" + "</div>"
					+ "</div>" + "</div>";
		}
		String html = "<div id='ajax'>" + "<div id='review'>" + comment + "</div>" + "<h2>Viết đánh giá</h2>"
				+ "<div class='form-group required'>" + "<div class='col-sm-12'>"
				+ "<label class='control-label' for='input-name'>Họ tên</label> <input"
				+ "type='text' name='ho_ten' value='' id='input-name'" + "class='form-control' />" + "</div>" + "</div>"
				+ "<div class='form-group required'>" + "<div class='col-sm-12'>"
				+ "<label style='margin-top: 35px;' class='control-label' for='input-review'>Nội dung đánh giá</label>"

				+ "<textarea name='noi_dung' rows='5' id='input-review' class='form-control'></textarea>"

				+ "<div class='help-block'>"
				+ "<span class='text-danger'>Chú ý:</span> Không sử dụng các định dạng HTML!" + "</div>" + "</div>"
				+ "</div>" + "</div>";
		out.print(html);
	}

	@RequestMapping(value = "/cartremove", method = RequestMethod.POST)
	public void cartremove(@RequestParam("pid") int pid, HttpServletRequest request, HttpSession session,
			RedirectAttributes ra, PrintWriter out, ModelMap modelMap) throws ServletException, IOException {
		if (session.getAttribute("listCart") == null) {
		} else {
			System.out.println("slesremove");
			Object a = session.getAttribute("listCart");
			if (a != null) {
				listCart = (ArrayList<Product>) a;
			} else {
				listCart = new ArrayList<>();
			}
			int dem = 0;
			for (int i = 0; i < listCart.size(); i++) {
				if (listCart.get(i).getId_product() == pid) {
					dem = i;
				}
				;
			}
			listCart.remove(dem);
			session.setAttribute("listCart", listCart);
			String listProduct = "";
			int sp = 0;
			float tong = 0;
			DecimalFormat df = new DecimalFormat("###,###,###");
			if (listCart.size() < 1) {
				String html = "<div id='cart' class='cart pull-right'>"
						+ "	<div data-toggle='dropdown' data-loading-text='Đang tải'"
						+ "class='heading media dropdown-toggle'>" + "	<div class='cart-inner media-body'>"
						+ "	<span class='icon-cart'></span>" + "	<h4>Giỏ hàng</h4>"
						+ "	<a><span id='cart-total'>0 sản phẩm - 0 đ</span></a>" + "</div>" + "</div>"
						+ "<ul class='dropdown-menu pull-right'>" + "<li>"
						+ "<p class='text-center'>Giỏ hàng của bạn trống!</p>" + "</li>" + "</ul>" + "</div>";
				out.print(html);
			} else {
				for (Product product : listCart) {
					float gia = 0;
					if (product.getGia_sale() == 0) {
						gia = product.getGia();
					} else {
						gia = product.getGia_sale();
					}
					listProduct += "<li>" + "<table style='width: 500px; class='table table-striped'>" + "<tbody>"
							+ "	<tr>" + "		<td style='width: 230px; height: 47px;' class='text-center'><a"
							+ "		href='" + request.getContextPath() + "/" + slugUtils.toSlug(product.getName()) + "-"
							+ product.getId_product() + ".html'><img" + "			width='47px' height='47px' src='"
							+ request.getContextPath() + "/files/" + product.getPicture() + "'" + "			alt='"
							+ product.getName() + "'" + "			title='" + product.getName() + "'></a></td>"
							+ "	<td style='width: 100px;' class='text-left'><a" + "		href='"
							+ request.getContextPath() + "/" + slugUtils.toSlug(product.getName()) + "-"
							+ product.getId_product() + ".html'>" + product.getName() + "</a></td>"

							+ "	<td style='width: 50px;' class='text-right cart-number'>x " + product.getNum() + "</td>"
							+ "	<td style='width: 100px;' class='text-right'>" + df.format(gia) + " đ</td>"
							+ "	<td class='text-center'><button type='button'" + "			onclick='return cartremove"
							+ product.getId_product() + "();' title='Gỡ bở'"
							+ "			class='btn btn-primary btn-xs'>" + "			<i class='fa fa-times'></i>"
							+ "		</button></td>" + "	</tr>" + "	</tbody>" + "</table>" + "</li>";
					sp++;
					tong += (gia * product.getNum());
				}
				String html = "<div id='cart' class='cart pull-right'>"
						+ "	<div data-toggle='dropdown' data-loading-text='Đang tải'"
						+ "class='heading media dropdown-toggle'>" + "	<div class='cart-inner media-body'>"
						+ "	<span class='icon-cart'></span>" + "	<h4>Giỏ hàng</h4>" + "	<a><span id='cart-total'>"
						+ sp + " sản phẩm - " + df.format(tong) + "đ</span></a>" + "</div>" + "</div>"
						+ "<ul class='dropdown-menu pull-right'>" + listProduct + "<li>" + "<div>"
						+ "<table class='table table-bordered'>" + "	<tbody>" + "	<tr>"
						+ "		<td class='text-right'><strong>Tổng số</strong></td>" + "		<td class='text-right'>"
						+ df.format(tong) + " đ</td>" + "	</tr>" + "	</tbody>" + "</table>"
						+ "<p class='text-right'>" + "	<a href='" + request.getContextPath() + "/gio-hang'"
						+ "		class='button btn btn-theme-default'><i"
						+ "		class='fa fa-shopping-cart'></i>Xem giỏ hàng</a> <a" + "		href='"
						+ request.getContextPath() + "/thanh-toan'" + "		class='button btn btn-theme-default'><i"
						+ "		class='fa fa-share'></i>Thanh toán</a>" + "	</p>" + "	</div>" + "</li>" + "</ul>"
						+ "</div>";
				out.print(html);
			}
		}
	}

	@RequestMapping(value = "/editNumber", method = RequestMethod.POST)
	public void changequantity(@RequestParam("id") int id, @RequestParam("soLuong") int soLuong, HttpServletRequest request,
			HttpSession session, RedirectAttributes ra, PrintWriter out, ModelMap modelMap)
			throws ServletException, IOException {
		if (session.getAttribute("listCart") == null) {
		} else {
			Object a = session.getAttribute("listCart");
			if (a != null) {
				listCart = (ArrayList<Product>) a;
			} else {
				listCart = new ArrayList<>();
			}
			int dem = 0;
			DecimalFormat df = new DecimalFormat("###,###,###");

			float tongtien = 0;
			for (int i = 0; i < listCart.size(); i++) {
				float gia = 0;
				if (listCart.get(i).getGia_sale() == 0) {
					gia = listCart.get(i).getGia();
				} else {
					gia = listCart.get(i).getGia_sale();
				}
				if (listCart.get(i).getId_product() == id) {
					dem = i;
					listCart.get(i).setNum(soLuong);
					
				}
				tongtien += listCart.get(i).getNum() * gia;
				
			}
			String html = ""+df.format(tongtien) + "đ";
			session.setAttribute("listCart", listCart);
			out.print(html);
		}
	

	}

	@RequestMapping(value = "/cartremoveindetails", method = RequestMethod.GET)
	public String cartremoveindetails(@RequestParam("pid") int pid, HttpServletRequest request, HttpSession session,
			RedirectAttributes ra, PrintWriter out, ModelMap modelMap) throws ServletException, IOException {
		if (session.getAttribute("listCart") == null) {

		} else {
			Object a = session.getAttribute("listCart");
			if (a != null) {
				listCart = (ArrayList<Product>) a;
			} else {
				listCart = new ArrayList<>();
			}
			int dem = 0;
			for (int i = 0; i < listCart.size(); i++) {
				if (listCart.get(i).getId_product() == pid) {
					dem = i;
				}
				;
			}
			listCart.remove(dem);
			session.setAttribute("listCart", listCart);

		}

		return "redirect:/gio-hang";
	}

	@RequestMapping(value = "/giohang", method = RequestMethod.POST)
	public void giohang(@RequestParam("pid") int pid, HttpServletRequest request, HttpSession session,
			RedirectAttributes ra, PrintWriter out, ModelMap modelMap) throws ServletException, IOException {
		if (session.getAttribute("listCart") == null) {
			System.out.println("if");
			session = request.getSession();
			Product objP = pDao.getItem(pid);
			int dem = 0;
			for (Product product : listCart) {
				if (product.getId_product() == objP.getId_product()) {
					dem++;
					product.setNum(product.getNum() + 1);
				}
				;
			}
			if (dem != 0) {
			} else {
				objP.setNum(1);
				listCart.add(objP);

			}

			session.setAttribute("listCart", listCart);
			String listProduct = "";
			int sp = 0;
			float tong = 0;
			DecimalFormat df = new DecimalFormat("###,###,###");
			for (Product product : listCart) {
				float gia = 0;
				if (product.getGia_sale() == 0) {
					gia = product.getGia();
				} else {
					gia = product.getGia_sale();
				}
				listProduct += "<li>" + "<table style='width: 500px; class='table table-striped'>" + "<tbody>"
						+ "	<tr>" + "		<td style='width: 230px; height: 47px;' class='text-center'><a"
						+ "		href='" + request.getContextPath() + "/" + slugUtils.toSlug(product.getName()) + "-"
						+ product.getId_product() + ".html'><img" + "			width='47px' height='47px' src='"
						+ request.getContextPath() + "/files/" + product.getPicture() + "'" + "			alt='"
						+ product.getName() + "'" + "			title='" + product.getName() + "'></a></td>"
						+ "	<td style='width: 100px;' class='text-left'><a" + "		href='" + request.getContextPath()
						+ "/" + slugUtils.toSlug(product.getName()) + "-" + product.getId_product() + ".html'>"
						+ product.getName() + "</a></td>"

						+ "	<td style='width: 50px;' class='text-right cart-number'>x " + product.getNum() + "</td>"
						+ "	<td style='width: 100px;' class='text-right'>" + df.format(gia) + " đ</td>"
						+ "	<td class='text-center'><button type='button'" + "			onclick='return cartremove"
						+ product.getId_product() + "();' title='Gỡ bở'" + "			class='btn btn-primary btn-xs'>"
						+ "			<i class='fa fa-times'></i>" + "		</button></td>" + "	</tr>" + "	</tbody>"
						+ "</table>" + "</li>";
				sp++;
				tong += (gia * product.getNum());
			}
			String html = "<div id='cart' class='cart pull-right'>"
					+ "	<div data-toggle='dropdown' data-loading-text='Đang tải'"
					+ "class='heading media dropdown-toggle'>" + "	<div class='cart-inner media-body'>"
					+ "	<span class='icon-cart'></span>" + "	<h4>Giỏ hàng</h4>" + "	<a><span id='cart-total'>" + sp
					+ " sản phẩm - " + df.format(tong) + "đ</span></a>" + "</div>" + "</div>"
					+ "<ul class='dropdown-menu pull-right'>" + listProduct + "<li>" + "<div>"
					+ "<table class='table table-bordered'>" + "	<tbody>" + "		<tr>"
					+ "			<td class='text-right'><strong>Thành tiền</strong></td>"
					+ "		<td class='text-right'>" + df.format(tong) + " đ</td>" + "	</tr>" + "	</tbody>"
					+ "</table>" + "<p class='text-right'>" + "	<a href='" + request.getContextPath() + "/gio-hang'"
					+ "		class='button btn btn-theme-default'><i"
					+ "		class='fa fa-shopping-cart'></i>Xem giỏ hàng</a> <a" + "		href='"
					+ request.getContextPath() + "/thanh-toan'" + "		class='button btn btn-theme-default'><i"
					+ "		class='fa fa-share'></i>Thanh toán</a>" + "	</p>" + "	</div>" + "</li>" + "</ul>"
					+ "</div>";
			out.print(html);
		} else {
			System.out.println("sles");
			Object a = session.getAttribute("listCart");
			if (a != null) {
				listCart = (ArrayList<Product>) a;
			} else {
				listCart = new ArrayList<>();
			}
			Product objP = pDao.getItem(pid);
			int dem = 0;
			for (Product product : listCart) {
				if (product.getId_product() == objP.getId_product()) {
					dem++;
					product.setNum(product.getNum() + 1);
				}
				;
			}
			if (dem != 0) {
			} else {
				objP.setNum(1);
				listCart.add(objP);
			}
			session.setAttribute("listCart", listCart);
			String listProduct = "";
			int sp = 0;
			float tong = 0;
			DecimalFormat df = new DecimalFormat("###,###,###");
			for (Product product : listCart) {
				float gia = 0;
				if (product.getGia_sale() == 0) {
					gia = product.getGia();
				} else {
					gia = product.getGia_sale();
				}
				listProduct += "<li>" + "<table style='width: 500px; class='table table-striped'>" + "<tbody>"
						+ "	<tr>" + "		<td style='width: 230px; height: 47px;' class='text-center'><a"
						+ "		href='" + request.getContextPath() + "/" + slugUtils.toSlug(product.getName()) + "-"
						+ product.getId_product() + ".html'><img" + "			width='47px' height='47px' src='"
						+ request.getContextPath() + "/files/" + product.getPicture() + "'" + "			alt='"
						+ product.getName() + "'" + "			title='" + product.getName() + "'></a></td>"
						+ "	<td style='width: 100px;' class='text-left'><a" + "		href='" + request.getContextPath()
						+ "/" + slugUtils.toSlug(product.getName()) + "-" + product.getId_product() + ".html'>"
						+ product.getName() + "</a></td>"

						+ "	<td style='width: 50px;' class='text-right cart-number'>x " + product.getNum() + "</td>"
						+ "	<td style='width: 100px;' class='text-right'>" + df.format(gia) + " đ</td>"
						+ "	<td class='text-center'><button type='button'" + "			onclick='return cartremove"
						+ product.getId_product() + "();' title='Gỡ bở'" + "			class='btn btn-primary btn-xs'>"
						+ "			<i class='fa fa-times'></i>" + "		</button></td>" + "	</tr>" + "	</tbody>"
						+ "</table>" + "</li>";
				sp++;
				tong += (gia * product.getNum());
			}
			String html = "<div id='cart' class='cart pull-right'>"
					+ "	<div data-toggle='dropdown' data-loading-text='Đang tải'"
					+ "class='heading media dropdown-toggle'>" + "	<div class='cart-inner media-body'>"
					+ "	<span class='icon-cart'></span>" + "	<h4>Giỏ hàng</h4>" + "	<a><span id='cart-total'>" + sp
					+ " sản phẩm - " + df.format(tong) + "đ</span></a>" + "</div>" + "</div>"
					+ "<ul class='dropdown-menu pull-right'>" + listProduct + "<li>" + "<div>"
					+ "<table class='table table-bordered'>" + "	<tbody>" + "	<tr>"
					+ "		<td class='text-right'><strong>Tổng số</strong></td>" + "		<td class='text-right'>"
					+ df.format(tong) + " đ</td>" + "	</tr>" + "	</tbody>" + "</table>" + "<p class='text-right'>"
					+ "	<a href='" + request.getContextPath() + "/gio-hang'"
					+ "		class='button btn btn-theme-default'><i"
					+ "		class='fa fa-shopping-cart'></i>Xem giỏ hàng</a> <a" + "		href='"
					+ request.getContextPath() + "/thanh-toan'" + "		class='button btn btn-theme-default'><i"
					+ "		class='fa fa-share'></i>Thanh toán</a>" + "	</p>" + "	</div>" + "</li>" + "</ul>"
					+ "</div>";
			out.print(html);
		}
	}

}
