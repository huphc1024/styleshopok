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
import dao.BannerDao;
import dao.SliderDao;
import dao.UserDao;
import entities.Banner;
import entities.Category;
import entities.Slider;
import utils.LibraryFile;

@Controller
@RequestMapping("/admincp/display")
public class AdminDisplayController {
	@Autowired
	private Define define;
	@Autowired
	private BannerDao bannerDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private SliderDao sliderDao;
	private final String DIR_URL = "files";

	@ModelAttribute
	public void addCommonObject(ModelMap modelMap, Principal principal) {
		modelMap.addAttribute("name", userDao.getItemByName(principal.getName()).getFullname());
		modelMap.addAttribute("define", define);
	}

	@RequestMapping("/slider")
	public String slider(ModelMap modelMap) {
		modelMap.addAttribute("listSlider", sliderDao.getItems());
		return "admin.display.slider";
	}
	
	@RequestMapping("/slider/add")
	public String addslider() {
		return "admin.display.addslider";
	}
	
	@RequestMapping(value="/slider/add", method=RequestMethod.POST)
	public String addslider(@ModelAttribute("objItem") Slider objItem, ModelMap modelMap,@RequestParam("hinhanh") CommonsMultipartFile cmf, ServletRequest request, RedirectAttributes ra) {
		// sử lý hình ảnh
				String fileName = cmf.getOriginalFilename();
				if (!fileName.isEmpty()) {
					String appPath = request.getServletContext().getRealPath("");
					String dirPath = appPath + File.separator + DIR_URL ;
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
					modelMap.addAttribute("objBanner", objItem);
					modelMap.addAttribute("msgPic", "Vui lòng chọn hình");
					return "admin.display.addslider";
				}
				if (sliderDao.addItem(objItem) > 0) {
					ra.addFlashAttribute("msg", "Thông tin đã được cập nhật");
				} else {
					ra.addFlashAttribute("msg", "Thất bại");
				}
				return "redirect:/admincp/display/slider";
	}
	
	@RequestMapping("/slider/edit/{id}")
	public String editslider(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.addAttribute("obj", sliderDao.getItem(id));
		return "admin.display.editslider";
	}
	
	@RequestMapping(value="/slider/edit/{id}", method=RequestMethod.POST)
	public String editslider(@PathVariable("id") int id, ModelMap modelMap,@ModelAttribute("objItem") Slider objItem,@RequestParam("hinhanh") CommonsMultipartFile cmf, ServletRequest request, RedirectAttributes ra ) {
		//sử lý hình ảnh
				Slider objSOld = sliderDao.getItem(id);
						String fileName = cmf.getOriginalFilename();
						if(!fileName.isEmpty()){
							String appPath = request.getServletContext().getRealPath("");
							String dirPath = appPath + File.separator + DIR_URL;
							File saveDirPath = new File(dirPath);
							if(!saveDirPath.exists()){
								saveDirPath.mkdirs();
							}
							String picture = LibraryFile.rename(fileName);
							objItem.setPicture(picture);
							//tạo đường dẫn file
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
								if(!old_pic.isEmpty()){
									String filePathOld = dirPath + File.separator + old_pic;
									File fileDel = new File(filePathOld);
									fileDel.delete();
								}
						}else{
							objItem.setPicture(objSOld.getPicture());
						}
						objItem.setId_slider(id);
				if(sliderDao.editItem(objItem) > 0){
					ra.addFlashAttribute("msg", "Thông tin đã được cập nhật");
				}else{
					ra.addFlashAttribute("msg", "Thất bại");
				}
				return "redirect:/admincp/display/slider";
	}
	
	@RequestMapping("/slider/del")
	public String delslider(ModelMap modelMap, ServletRequest request, RedirectAttributes ra) {
		String[] selected = request.getParameterValues("selected");
		if (selected == null) {
			return "redirect:/admincp/display/slider";
		}else{
		int dem = 0;
		for (String i : selected) {
			int id = Integer.parseInt(i);
			Slider objOld = sliderDao.getItem(id);
			if (!"".equals(objOld.getPicture())) {
				String appPath = request.getServletContext().getRealPath("");
				String dirPath = appPath + File.separator + DIR_URL;
				String filePathOld = dirPath + File.separator + objOld.getPicture();
				File fileDel = new File(filePathOld);
				fileDel.delete();
			}
			if (sliderDao.delItem(id) > 0) {
				dem++;
			}
			
		}
		if (dem == selected.length) {
			ra.addFlashAttribute("msg", " Thành công: Thông tin danh mục đã được cập nhật!");
			ra.addFlashAttribute("listSlider", sliderDao.getItems());
			return "redirect:/admincp/display/slider";
		} else {
			ra.addFlashAttribute("msg", " Thất bại");
			ra.addFlashAttribute("listSlider", sliderDao.getItems());
			return "redirect:/admincp/display/slider";
		}
		}
	}
	
	@RequestMapping("/banner")
	public String user(ModelMap modelMap) {
		modelMap.addAttribute("listBanner", bannerDao.getItems());
		return "admin.display.picture";
	}

	@RequestMapping("/banner/edit/{id}")
	public String editBanner(ModelMap modelMap, @PathVariable("id") int id) {
		modelMap.addAttribute("objBanner", bannerDao.getItem(id));
		return "admin.display.editBanner";
	}
	
	@RequestMapping(value="/banner/edit/{id}", method=RequestMethod.POST)
	public String editBanner(@Valid @ModelAttribute("objItem") Banner objItem, BindingResult rs , @PathVariable("id") int id ,@RequestParam("hinhanh") CommonsMultipartFile cmf, ServletRequest request, RedirectAttributes ra ,ModelMap modelMap) {
		if(rs.hasErrors()){
			modelMap.addAttribute("objBanner", bannerDao.getItem(id));
			return "admin.index.editcategories";
		}
		//sử lý hình ảnh
		Banner objSOld = bannerDao.getItem(id);
				String fileName = cmf.getOriginalFilename();
				if(!fileName.isEmpty()){
					String appPath = request.getServletContext().getRealPath("");
					String dirPath = appPath + File.separator + DIR_URL;
					File saveDirPath = new File(dirPath);
					if(!saveDirPath.exists()){
						saveDirPath.mkdirs();
					}
					String picture = LibraryFile.rename(fileName);
					objItem.setPicture(picture);
					//tạo đường dẫn file
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
						if(!old_pic.isEmpty()){
							String filePathOld = dirPath + File.separator + old_pic;
							File fileDel = new File(filePathOld);
							fileDel.delete();
						}
				}else{
					modelMap.addAttribute("objBanner", objItem);
					modelMap.addAttribute("msgPic", "Vui lòng chọn hình");
					return "admin.index.addcategories";
				}
				objItem.setId_banner(id);
		if(bannerDao.editItem(objItem) > 0){
			ra.addFlashAttribute("msg", "Thông tin đã được cập nhật");
		}else{
			ra.addFlashAttribute("msg", "Thất bại");
		}
		return "redirect:/admincp/display/banner";
	}

	@RequestMapping("/banner/add")
	public String addBanner() {
		return "admin.display.addBanner";
	}

	@RequestMapping(value = "/banner/add", method = RequestMethod.POST)
	public String addBanner(@Valid @ModelAttribute("objItem") Banner objItem, BindingResult rs,
			@RequestParam("hinhanh") CommonsMultipartFile cmf, ServletRequest request, RedirectAttributes ra,
			ModelMap modelMap) {
		if (rs.hasErrors()) {
			modelMap.addAttribute("objBanner", objItem);
			return "admin.display.addBanner";
		}
		// sử lý hình ảnh
		String fileName = cmf.getOriginalFilename();
		if (!fileName.isEmpty()) {
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + File.separator + DIR_URL ;
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
			modelMap.addAttribute("objBanner", objItem);
			modelMap.addAttribute("msgPic", "Vui lòng chọn hình");
			return "admin.display.addBanner";
		}
		if (bannerDao.addItem(objItem) > 0) {
			ra.addFlashAttribute("msg", "Thông tin đã được cập nhật");
		} else {
			ra.addFlashAttribute("msg", "Thất bại");
		}
		return "redirect:/admincp/display/banner";
	}

	@RequestMapping("/banner/del")
	public String delBanner(ModelMap modelMap, ServletRequest request, RedirectAttributes ra) {
		String[] selected = request.getParameterValues("selected");
		if(selected == null){
			return "redirect:/admincp/display/banner";
		}else{
		int dem = 0;
		for (String i : selected) {
			int id = Integer.parseInt(i);
			Banner objOld = bannerDao.getItem(id);
			if (!"".equals(objOld.getPicture())) {
				String appPath = request.getServletContext().getRealPath("");
				String dirPath = appPath + File.separator + DIR_URL;
				String filePathOld = dirPath + File.separator + objOld.getPicture();
				File fileDel = new File(filePathOld);
				fileDel.delete();
			}
			if (bannerDao.delItem(id) > 0) {
				dem++;
			}
			;
		}
		if (dem == selected.length) {
			ra.addFlashAttribute("msg", " Thành công: Thông tin danh mục đã được cập nhật!");
			ra.addFlashAttribute("listComment", bannerDao.getItems());
			return "redirect:/admincp/display/banner";
		} else {
			ra.addFlashAttribute("msg", " Thất bại");
			ra.addFlashAttribute("listComment", bannerDao.getItems());
			return "redirect:/admincp/display/banner";
		}
		}
	}
}
