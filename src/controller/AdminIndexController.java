package controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;

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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Define;
import dao.CatDao;
import dao.CommentDao;
import dao.ProductDao;
import dao.UserDao;
import entities.Category;
import entities.Product;
import utils.LibraryFile;

@Controller
@RequestMapping("/admincp")
public class AdminIndexController {
	private static final String DIR_URL = "files";
	@Autowired
	private Define define;
	@Autowired
	private CommentDao commentDao;
	@Autowired
	private CatDao catDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private UserDao userDao;
	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal) {
		modelMap.addAttribute("name", userDao.getItemByName(principal.getName()).getFullname());
		modelMap.addAttribute("define", define);
	}

	@RequestMapping("")
	public String index() {
		return "admin.index.index";
	}

	@RequestMapping("/categories")
	public String categories(ModelMap modelMap) {
		modelMap.addAttribute("listCat", catDao.getItems());
		return "admin.index.categories";
	}

	@RequestMapping("/categories/add")
	public String addcat(ModelMap modelMap) {
		modelMap.addAttribute("listParent", catDao.getItemsParent());
		return "admin.index.addcategories";
	}

	@RequestMapping(value = "/categories/add", method = RequestMethod.POST)
	public String addcat(@Valid @ModelAttribute("objItem") Category objItem, BindingResult rs,
			@RequestParam("image") CommonsMultipartFile cmf, ServletRequest request, RedirectAttributes ra,
			ModelMap modelMap) {
		if (rs.hasErrors()) {
			modelMap.addAttribute("objCat", objItem);
			modelMap.addAttribute("listParent", catDao.getItemsParent());
			return "admin.index.addcategories";
		}
		// sử lý hình ảnh
		String fileName = cmf.getOriginalFilename();
		if (!fileName.isEmpty()) {
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + File.separator + DIR_URL;
			File saveDirPath = new File(dirPath);
			if (!saveDirPath.exists()) {
				saveDirPath.mkdirs();
			}
			String picture = LibraryFile.rename(fileName);
			objItem.setPicture(picture);
			// tạo đường dẫn file
			String filePath = dirPath + File.separator + picture;
			System.out.println(filePath);
			File fileUpload = new File(filePath);
			try {
				cmf.transferTo(fileUpload);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			modelMap.addAttribute("objCat", objItem);
			modelMap.addAttribute("listParent", catDao.getItemsParent());
			modelMap.addAttribute("msgPic", "Vui lòng chọn hình");
			return "admin.index.addcategories";
		}
		if (catDao.addItem(objItem) > 0) {
			ra.addFlashAttribute("msg", "Thông tin đã được cập nhật");
		} else {
			ra.addFlashAttribute("msg", "Thất bại");
		}
		return "redirect:/admincp/categories";
	}

	@RequestMapping(value = "/categories/edit/{id}", method = RequestMethod.POST)
	public String editcat(@Valid @ModelAttribute("objItem") Category objItem, BindingResult rs,
			@PathVariable("id") int id, @RequestParam("image") CommonsMultipartFile cmf, ServletRequest request,
			RedirectAttributes ra, ModelMap modelMap) {
		if (rs.hasErrors()) {
			modelMap.addAttribute("objCat", catDao.getItem(id));
			modelMap.addAttribute("listParent", catDao.getItemsParent());
			return "admin.index.editcategories";
		}
		// sử lý hình ảnh
		Category objSOld = catDao.getItem(id);
		String fileName = cmf.getOriginalFilename();
		if (!fileName.isEmpty()) {
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + File.separator + DIR_URL;
			File saveDirPath = new File(dirPath);
			if (!saveDirPath.exists()) {
				saveDirPath.mkdirs();
			}
			String picture = LibraryFile.rename(fileName);
			objItem.setPicture(picture);
			// tạo đường dẫn file
			String filePath = dirPath + File.separator + picture;
			System.out.println(filePath);
			File fileUpload = new File(filePath);
			try {
				cmf.transferTo(fileUpload);
			} catch (IOException e) {
				e.printStackTrace();
			}
			// xóa ảnh cũ nếu có

			String old_pic = objSOld.getPicture();
			if (!old_pic.isEmpty()) {
				String filePathOld = dirPath + File.separator + old_pic;
				File fileDel = new File(filePathOld);
				fileDel.delete();
			}
		} else {
			objItem.setPicture(objSOld.getPicture());
		}
		objItem.setId_cat(id);
		if (catDao.editItem(objItem) > 0) {
			ra.addFlashAttribute("msg", "Thông tin đã được cập nhật");
		} else {
			ra.addFlashAttribute("msg", "Thất bại");
		}
		return "redirect:/admincp/categories";
	}

	@RequestMapping("/categories/edit/{id}")
	public String editcat(ModelMap modelMap, @PathVariable("id") int id) {
		modelMap.addAttribute("objCat", catDao.getItem(id));
		modelMap.addAttribute("listParent", catDao.getItemsParent());
		return "admin.index.editcategories";
	}

	@RequestMapping(value = "/categories/del", method = RequestMethod.POST)
	public String delcat(ModelMap modelMap, ServletRequest request, RedirectAttributes ra) {
		String[] selected = request.getParameterValues("selected");
		if(selected == null){
			return "redirect:/admincp/categories";
		}else{
		int dem = 0;
		for (String i : selected) {
			int id = Integer.parseInt(i);
			Category objOld = catDao.getItem(id);
			if (!"".equals(objOld.getPicture())) {
				String appPath = request.getServletContext().getRealPath("");
				String dirPath = appPath + File.separator + DIR_URL;
				String filePathOld = dirPath + File.separator + objOld.getPicture();
				File fileDel = new File(filePathOld);
				fileDel.delete();
			}
			if (catDao.delItem(id) > 0) {
				dem++;
			}
			;
		}
		if (dem == selected.length) {
			ra.addFlashAttribute("msg", " Thành công: Thông tin danh mục đã được cập nhật!");
			ra.addFlashAttribute("listCat", catDao.getItems());
			return "redirect:/admincp/categories";
		} else {
			ra.addFlashAttribute("msg", " Thất bại"); 
			ra.addFlashAttribute("listCat", catDao.getItems());
			return "redirect:/admincp/categories";
		}
		}
	}

	@RequestMapping("/product")
	public String product(ModelMap modelMap,@RequestParam(value="page", defaultValue="1") int page) {
		int current_page = 1;
		int num = 8;
		
		 int sumNews = productDao.countProduct();
		 int sumPage = (int)Math.ceil((float)sumNews/num);
		 modelMap.addAttribute("sumPage", sumPage);
		 if(page != 0){
		 current_page = page;
		 }
		 modelMap.addAttribute("current_page", current_page);
		 int offset = (current_page - 1)*num;
		modelMap.addAttribute("listProduct", productDao.getItems(offset));
		return "admin.index.product";
	}

	@RequestMapping("/product/add")
	public String addproduct(ModelMap modelMap) {
		modelMap.addAttribute("listParent", catDao.getItems());
		return "admin.index.addproduct";
	}
	
	@RequestMapping(value="/product/add", method=RequestMethod.POST)
	public String addproduct(@Valid @ModelAttribute("objItem") Product objItem, BindingResult rs,
			@RequestParam("image") CommonsMultipartFile cmf,@RequestParam("image2") CommonsMultipartFile cmf2,
			@RequestParam("image3") CommonsMultipartFile cmf3, ServletRequest request, RedirectAttributes ra,
			ModelMap modelMap) {
		if (rs.hasErrors()) {
			modelMap.addAttribute("objP", objItem);
			modelMap.addAttribute("listParent", catDao.getItems());
			return "admin.index.addproduct";
		}
		// sử lý hình ảnh
		String fileName = cmf.getOriginalFilename();
		if (!fileName.isEmpty()) {
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + File.separator + DIR_URL;
			File saveDirPath = new File(dirPath);
			if (!saveDirPath.exists()) {
				saveDirPath.mkdirs();
			}
			String picture = LibraryFile.rename(fileName);
			objItem.setPicture(picture);
			// tạo đường dẫn file
			String filePath = dirPath + File.separator + picture;
			System.out.println(filePath);
			File fileUpload = new File(filePath);
			try {
				cmf.transferTo(fileUpload);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			modelMap.addAttribute("objP", objItem);
			modelMap.addAttribute("msgPic", "Vui lòng chọn hình");
			modelMap.addAttribute("listParent", catDao.getItems());
			return "admin.index.addproduct";
		}
		// sử lý hình ảnh2
				String fileName2 = cmf2.getOriginalFilename();
				if (!fileName2.isEmpty()) {
					String appPath = request.getServletContext().getRealPath("");
					String dirPath = appPath + File.separator + DIR_URL;
					File saveDirPath = new File(dirPath);
					if (!saveDirPath.exists()) {
						saveDirPath.mkdirs();
					}
					String picture = LibraryFile.rename(fileName2);
					objItem.setPicture2(picture);
					// tạo đường dẫn file
					String filePath = dirPath + File.separator + picture;
					System.out.println(filePath);
					File fileUpload = new File(filePath);
					try {
						cmf2.transferTo(fileUpload);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				// sử lý hình ảnh
				String fileName3 = cmf3.getOriginalFilename();
				if (!fileName3.isEmpty()) {
					String appPath = request.getServletContext().getRealPath("");
					String dirPath = appPath + File.separator + DIR_URL;
					File saveDirPath = new File(dirPath);
					if (!saveDirPath.exists()) {
						saveDirPath.mkdirs();
					}
					String picture = LibraryFile.rename(fileName3);
					objItem.setPicture3(picture);
					// tạo đường dẫn file
					String filePath = dirPath + File.separator + picture;
					System.out.println(filePath);
					File fileUpload = new File(filePath);
					try {
						cmf3.transferTo(fileUpload);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
		if (productDao.addItem(objItem) > 0) {
			ra.addFlashAttribute("msg", "Thông tin đã được cập nhật");
		} else {
			ra.addFlashAttribute("msg", "Thất bại");
		}
		return "redirect:/admincp/product";
	}

	@RequestMapping("/product/edit/{id}")
	public String editproduct(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.addAttribute("objP", productDao.getItem(id));
		modelMap.addAttribute("listParent", catDao.getItems());
		return "admin.index.editproduct";
	}
	
	@RequestMapping(value="/product/edit/{id}", method=RequestMethod.POST)
	public String editproduct(@Valid @ModelAttribute("objItem") Product objItem, BindingResult rs, @PathVariable("id") int id,
			@RequestParam("image") CommonsMultipartFile cmf,@RequestParam("image2") CommonsMultipartFile cmf2,
			@RequestParam("image3") CommonsMultipartFile cmf3, ServletRequest request, RedirectAttributes ra,
			ModelMap modelMap) {
		if (rs.hasErrors()) {
			modelMap.addAttribute("objP", objItem);
			modelMap.addAttribute("listParent", catDao.getItems());
			return "admin.index.editproduct";
		}
		Product objOld = productDao.getItem(id);
		// sử lý hình ảnh
		String fileName = cmf.getOriginalFilename();
		if (!fileName.isEmpty()) {
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + File.separator + DIR_URL;
			File saveDirPath = new File(dirPath);
			if (!saveDirPath.exists()) {
				saveDirPath.mkdirs();
			}
			String picture = LibraryFile.rename(fileName);
			objItem.setPicture(picture);
			// tạo đường dẫn file
			String filePath = dirPath + File.separator + picture;
			System.out.println(filePath);
			File fileUpload = new File(filePath);
			try {
				cmf.transferTo(fileUpload);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			objItem.setPicture(objOld.getPicture());
		}
		// sử lý hình ảnh2
				String fileName2 = cmf2.getOriginalFilename();
				if (!fileName2.isEmpty()) {
					String appPath = request.getServletContext().getRealPath("");
					String dirPath = appPath + File.separator + DIR_URL;
					File saveDirPath = new File(dirPath);
					if (!saveDirPath.exists()) {
						saveDirPath.mkdirs();
					}
					String picture = LibraryFile.rename(fileName2);
					objItem.setPicture2(picture);
					// tạo đường dẫn file
					String filePath = dirPath + File.separator + picture;
					System.out.println(filePath);
					File fileUpload = new File(filePath);
					try {
						cmf2.transferTo(fileUpload);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}else{
					objItem.setPicture2(objOld.getPicture2());
				}
				// sử lý hình ảnh
				String fileName3 = cmf3.getOriginalFilename();
				if (!fileName3.isEmpty()) {
					String appPath = request.getServletContext().getRealPath("");
					String dirPath = appPath + File.separator + DIR_URL;
					File saveDirPath = new File(dirPath);
					if (!saveDirPath.exists()) {
						saveDirPath.mkdirs();
					}
					String picture = LibraryFile.rename(fileName3);
					objItem.setPicture3(picture);
					// tạo đường dẫn file
					String filePath = dirPath + File.separator + picture;
					System.out.println(filePath);
					File fileUpload = new File(filePath);
					try {
						cmf3.transferTo(fileUpload);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}else{
					objItem.setPicture3(objOld.getPicture3());
				}
		objItem.setId_product(id);
		if (productDao.editItem(objItem) > 0) {
			ra.addFlashAttribute("msg", "Thông tin đã được cập nhật");
		} else {
			ra.addFlashAttribute("msg", "Thất bại");
		}
		return "redirect:/admincp/product";
	}
	
	@RequestMapping(value = "/product/del", method = RequestMethod.POST)
	public String delsp(ModelMap modelMap, ServletRequest request, RedirectAttributes ra) {
		String[] selected = request.getParameterValues("selected");
		if(selected == null){
			return "redirect:/admincp/categories";
		}else{
		int dem = 0;
		for (String i : selected) {
			int id = Integer.parseInt(i);
			Product objOld = productDao.getItem(id);
			if (!"".equals(objOld.getPicture())) {
				String appPath = request.getServletContext().getRealPath("");
				String dirPath = appPath + File.separator + DIR_URL;
				String filePathOld = dirPath + File.separator + objOld.getPicture();
				File fileDel = new File(filePathOld);
				fileDel.delete();
			}
			if (productDao.delItem(id) > 0) {
				dem++;
			}
			;
		}
		if (dem == selected.length) {
			ra.addFlashAttribute("msg", " Thành công: Thông tin danh mục đã được cập nhật!");
			ra.addFlashAttribute("listCat", productDao.getItems());
			return "redirect:/admincp/product";
		} else {
			ra.addFlashAttribute("msg", " Thất bại"); 
			ra.addFlashAttribute("listCat", productDao.getItems());
			return "redirect:/admincp/product";
		}
		}
	}

	
	@RequestMapping("/comment")
	public String comment(ModelMap modelMap) {
		modelMap.addAttribute("listComment", commentDao.getItems());
		return "admin.index.comment";
	}

	@RequestMapping(value = "/comment/del", method = RequestMethod.POST)
	public String commentdel(ModelMap modelMap, ServletRequest request, RedirectAttributes ra) {
		String[] selected = request.getParameterValues("selected");
		if(selected == null){
			return "redirect:/admincp/comment";
		}else{
		int dem = 0;
		for (String i : selected) {
			int id = Integer.parseInt(i);
			if (commentDao.delItem(id) > 0) {
				dem++;
			}
			;
		}
		if (dem == selected.length) {
			ra.addFlashAttribute("msg", " Thành công: Thông tin bình luận đã được cập nhật!");
			ra.addFlashAttribute("listComment", commentDao.getItems());
			return "redirect:/admincp/comment";
		} else {
			ra.addFlashAttribute("msg", " Thất bại");
			ra.addFlashAttribute("listComment", commentDao.getItems());
			return "redirect:/admincp/comment";
		}}

	}

	@RequestMapping("/info")
	public String information() {
		return "admin.index.information";
	}

}
