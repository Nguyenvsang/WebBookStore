package com.nhom14.webbookstore.controller.customer;

import java.sql.Date;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import com.nhom14.webbookstore.entity.Account;
import com.nhom14.webbookstore.service.AccountService;

@Controller
public class AccountController {
	private AccountService accountService;

	@Autowired
	public AccountController(AccountService accountService) {
		super();
		this.accountService = accountService;
	}
	
	@GetMapping("/")
	public String showHome() {
		return "customer/index";
	}
	
	@GetMapping("/customer/registeraccount")
	public String registerAccountForm() {
		return "customer/registeraccount";
	}
	
	@PostMapping("/customer/registeraccount")
    public String registerAccount(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("address") String address,
            @RequestParam("phoneNumber") String phoneNumber,
            @RequestParam("email") String email,
            @RequestParam("firstName") String firstName,
            @RequestParam("lastName") String lastName,
            @RequestParam("gender") String gender,
            @RequestParam("dob") String dob,
            RedirectAttributes redirectAttributes
    ) {
        //BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        //String hashedPassword = passwordEncoder.encode(password);
		// Băm mật khẩu sử dụng bcrypt
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        Date dateOfBirth = Date.valueOf(dob);

        Account account = new Account(username, hashedPassword, address, phoneNumber, email, 1, 1);
        account.setFirstName(firstName);
        account.setLastName(lastName);
        account.setGender(gender);
        account.setDateOfBirth(dateOfBirth);
        account.setImg("");

        try {
            Account existingAccount = accountService.findAccountByUsername(username);
            if (existingAccount != null) {
                // Username already exists
            	redirectAttributes.addAttribute("message", "Tên tài khoản đã tồn tại. Vui lòng chọn tên khác.");
            } else {
                accountService.addAccount(account);
                redirectAttributes.addAttribute("message", "Đăng ký tài khoản thành công.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addAttribute("message", "Đã xảy ra lỗi. Vui lòng thử lại sau.");
        } 

        return "redirect:/customer/registeraccount";
    }
	
	@GetMapping("/customer/loginaccount")
	public String loginAccountForm(Model model) {
		// tạo đối tượng account cho form dữ liệu
		Account account = new Account();
		model.addAttribute("account", account);
		return "customer/loginaccount";
	}
	
	@PostMapping("/customer/loginaccount")
    public String loginAccount(@RequestParam("username") String username,
                               @RequestParam("password") String password,
                               HttpSession session,
                               HttpServletRequest request,
                               Model model) {
		session.invalidate();
        session = request.getSession(true);
        // Kiểm tra đăng nhập bằng phương thức checkLogin
        boolean isValid = accountService.checkLogin(username, password);

        if (isValid) {
            // Nếu đăng nhập thành công, lưu thông tin tài khoản vào session
            Account account = accountService.findAccountByUsername(username);
            //model.addAttribute("account", account);
            session.setAttribute("account", account);
            // Nếu đăng nhập thành công, hiển thị thông báo thành công và quay lại trang chủ
            model.addAttribute("message", "Đăng nhập thành công!");
            return "customer/index";
        } else {
            // Nếu đăng nhập thất bại, hiển thị thông báo lỗi và quay lại trang đăng nhập
            model.addAttribute("message", "Sai tên đăng nhập hoặc mật khẩu");
            return "customer/loginaccount";
        }
    }
	
	@GetMapping("/customer/logoutaccount")
	public String showLogout() {
		return "customer/logoutaccount";
	}
	
	@PostMapping("/customer/logoutaccount")
	public String logoutAccount(HttpServletRequest request) {
		HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";
	}
}
