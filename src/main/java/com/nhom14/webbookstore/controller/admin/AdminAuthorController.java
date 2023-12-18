package com.nhom14.webbookstore.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nhom14.webbookstore.entity.Account;
import com.nhom14.webbookstore.entity.Author;
import com.nhom14.webbookstore.entity.Category;
import com.nhom14.webbookstore.service.AuthorService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminAuthorController {

	private AuthorService authorService;

	@Autowired
	public AdminAuthorController(AuthorService authorService) {
		super();
		this.authorService = authorService;
	}
	
	@GetMapping("/manageauthors")
	public String manageAuthors(@RequestParam(value = "search", required = false) String searchKeyword,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage,
            Model model,
            HttpSession session) {
		Account admin = (Account) session.getAttribute("admin");

	    // Kiểm tra xem admin đã đăng nhập hay chưa
	    if (admin == null) {
	        // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
	        return "redirect:/loginadmin";
	    }
	    
	    List<Author> authors = authorService.getAllAuthors();
	    int totalAuthors;
	    // Số tác giả hiển thị trên mỗi trang	
        int recordsPerPage = 10;
        int start;
        int end;
        int totalPages;
        
        if (searchKeyword != null && !searchKeyword.isEmpty()) {
        	authors = authorService.searchAuthorsByKeyword(authors, searchKeyword);
        }
        
        totalAuthors = authors.size();
        
        // Tính toán vị trí bắt đầu và kết thúc của tác giả trên trang hiện tại
        start = (currentPage - 1) * recordsPerPage;
        end = Math.min(start + recordsPerPage, totalAuthors);
        
        // Lấy danh sách tác giả trên trang hiện tại
        List<Author> authorsOnPage = authors.subList(start, end);
        
        // Tính toán số trang
        totalPages = (int) Math.ceil((double) totalAuthors / recordsPerPage);
        
        model.addAttribute("authors", authorsOnPage);
        model.addAttribute("totalAuthors", totalAuthors);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", currentPage);

        return "admin/manageauthors";
	}
	
	@GetMapping("/addauthor")
	public String showAddAuthorForm(Model model, 
			HttpSession session) {
		Account admin = (Account) session.getAttribute("admin");

	    // Kiểm tra xem người dùng đã đăng nhập hay chưa
	    if (admin == null) {
	        // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
	        return "redirect:/loginadmin";
	    }
		return "admin/addauthor";
	}
	
	@PostMapping("/addauthor")
	public String addAuthor(@RequestParam("name") String authorName, 
			@RequestParam("bio") String authorBio,
			HttpSession session,
			RedirectAttributes redirectAttributes) {
	    Account admin = (Account) session.getAttribute("admin");

	    // Kiểm tra xem người dùng đã đăng nhập hay chưa
	    if (admin == null) {
	        // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
	        return "redirect:/loginadmin";
	    }

	    // Tạo Author mới
	    Author author = new Author(authorName, authorBio);

	    // Gọi phương thức addAuthor từ service để thêm mới tác giả
	    authorService.addAuthor(author);

	    redirectAttributes.addAttribute("message", "Đã thêm tác giả mới thành công");
	    // Chuyển hướng đến trang addauthor.html sau khi thêm mới
	    return "redirect:/addauthor";
	}
}
