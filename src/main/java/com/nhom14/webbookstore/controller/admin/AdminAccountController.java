package com.nhom14.webbookstore.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nhom14.webbookstore.entity.Account;
import com.nhom14.webbookstore.service.AccountService;
import com.nhom14.webbookstore.service.CloudinaryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminAccountController {
	private AccountService accountService;
	private CloudinaryService cloudinaryService;

	@Autowired
	public AdminAccountController(AccountService accountService, CloudinaryService cloudinaryService) {
		super();
		this.accountService = accountService;
		this.cloudinaryService = cloudinaryService;
	}
	
	@GetMapping("/loginadmin")
	public String loginAdminForm() {
		return "admin/loginadmin";
	}
	
	@PostMapping("/loginadmin")
    public String loginAdmin(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               HttpSession session,
                               HttpServletRequest request,
                               RedirectAttributes redirectAttributes) {
		session.invalidate();
        session = request.getSession(true);
        // Kiểm tra đăng nhập bằng phương thức checkLogin
        boolean isValid = accountService.checkLoginAdmin(username, password);

        if (isValid) {
            // Nếu đăng nhập thành công, lưu thông tin admin vào session
            Account admin = accountService.findAccountByUsername(username);
            session.setAttribute("admin", admin);
            // Nếu đăng nhập thành công, hiển thị thông báo thành công và quay lại trang chủ
            redirectAttributes.addAttribute("message", "Đăng nhập thành công!");
            return "redirect:/admin";
        } else {
            // Nếu đăng nhập thất bại, hiển thị thông báo lỗi và quay lại trang đăng nhập
        	redirectAttributes.addAttribute("message", "Sai tên đăng nhập hoặc mật khẩu");
        	return "redirect:/loginadmin";
        }
    }
}
