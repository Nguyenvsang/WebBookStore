package com.nhom14.webbookstore.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;

import com.nhom14.webbookstore.entity.Book;
import com.nhom14.webbookstore.entity.Category;
import com.nhom14.webbookstore.service.BookService;
import com.nhom14.webbookstore.service.CategoryService;

@Controller
public class BookController {
	private BookService bookService;
	private CategoryService categoryService;

	@Autowired
	public BookController(BookService bookService, CategoryService categoryService) {
		super();
		this.bookService = bookService;
		this.categoryService = categoryService;
	}
	
	@GetMapping("/viewbooks")
    public String viewBooks(@RequestParam(value = "category", required = false) Integer categoryId,
                            @RequestParam(value = "search", required = false) String searchKeyword,
                            @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage,
                            @RequestParam(value = "pricemin", required = false) Double priceMin,
                            @RequestParam(value = "pricemax", required = false) Double priceMax,
                            @RequestParam(value = "priceoption", required = false) Integer priceOption,
                            Model model) {
        List<Book> books;
        int totalBooks;
        int recordsPerPage = 12;
        int start;
        int end;
        int totalPages;
        // Thêm để cho phần tìm kiếm 
        model.addAttribute("uris", UriUtils.class);

        if (categoryId == null) {
            books = bookService.getActiveBooks();
            if (books.isEmpty()) {
                model.addAttribute("message", "Hiện không có sách nào được bán, vui lòng quay lại sau");
                return "customer/viewbooks";
            }
        } else {
            books = bookService.getActiveBooksByCategory(categoryId);
            if (books.isEmpty()) {
                model.addAttribute("message", "Không tìm thấy sách theo danh mục này");
                return "customer/viewbooks";
            }
            // Thêm để hiển thị theo catagory cho các trang phía sau
            model.addAttribute("categoryId", categoryId);
        }

        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            books = bookService.searchBooksByKeyword(books, searchKeyword);
            if (books.isEmpty()) {
                model.addAttribute("message", "Không tìm thấy sách nào với từ khóa đã nhập");
                return "customer/viewbooks";
            } else { //Thêm để hiển thị theo từ khóa cho các trang phía sau 
            	model.addAttribute("search", searchKeyword);
            }
        }
        
        // Lọc sách theo khoảng giá 
        if (priceMin != null && priceMax != null) {
            books = bookService.filterBooksByPriceRange(books, priceMin, priceMax);
            if (books.isEmpty()) {
                model.addAttribute("message", "Không tìm thấy sách nào trong khoảng giá đã chọn");
                return "customer/viewbooks";
            } else { //Thêm để hiển thị theo khoảng giá cho các trang phía sau 
            	model.addAttribute("pricemin", priceMin);
            	model.addAttribute("pricemax", priceMax);
            }
        }
        
        // Sếp sách tăng dần nếu giá trị priceOption là 12, giảm dần nếu giá trị là 21 
        if (priceOption != null) {
            if (priceOption == 12) {
                books = bookService.sortBooksByPriceAscending(books);
                //Thêm để hiển thị theo khoảng giá cho các trang phía sau
                model.addAttribute("priceoption", priceOption);
            } else if (priceOption == 21) {
                books = bookService.sortBooksByPriceDescending(books);
                //Thêm để hiển thị theo khoảng giá cho các trang phía sau
                model.addAttribute("priceoption", priceOption);
            }
        }

        totalBooks = books.size();

        start = (currentPage - 1) * recordsPerPage;
        end = Math.min(start + recordsPerPage, totalBooks);

        List<Book> booksOnPage = books.subList(start, end);

        totalPages = (int) Math.ceil((double) totalBooks / recordsPerPage);

        model.addAttribute("books", booksOnPage);
        model.addAttribute("totalBooks", totalBooks);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", currentPage);
        List<Category> categories = categoryService.getActiveCategories();
        model.addAttribute("categories", categories);
        

        return "customer/viewbooks";
    }
	
	@GetMapping("/detailbook/{id}")
	public String viewDetailBook(@PathVariable Integer id, Model model) {
		// Lấy thông tin về cuốn sách từ id
	    Book book = bookService.getActiveBookById(id);

	    // Lấy danh sách các danh mục
	    List<Category> categories = categoryService.getActiveCategories();

	    // Đặt thuộc tính vào model để sử dụng trong View
	    model.addAttribute("book", book);
	    model.addAttribute("categories", categories);

	    return "customer/detailbook";
	}

}
