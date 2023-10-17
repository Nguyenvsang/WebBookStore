package com.nhom14.webbookstore.controller.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nhom14.webbookstore.entity.Account;
import com.nhom14.webbookstore.entity.Book;
import com.nhom14.webbookstore.entity.Category;
import com.nhom14.webbookstore.service.BookService;
import com.nhom14.webbookstore.service.CategoryService;
import com.nhom14.webbookstore.service.CloudinaryService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminBookController {

	private BookService bookService;
	private CategoryService categoryService;
	private CloudinaryService cloudinaryService;
	
	@Autowired
	public AdminBookController(BookService bookService, CategoryService categoryService,
			CloudinaryService cloudinaryService) {
		super();
		this.bookService = bookService;
		this.categoryService = categoryService;
		this.cloudinaryService = cloudinaryService;
	}
	
	@GetMapping("/managebooks")
	public String manageBooks(@RequestParam(value = "category", required = false) Integer categoryId,
            @RequestParam(value = "search", required = false) String searchKeyword,
            @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage,
            Model model,
            HttpSession session) {
		Account admin = (Account) session.getAttribute("admin");

	    // Kiểm tra xem admin đã đăng nhập hay chưa
	    if (admin == null) {
	        // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
	        return "redirect:/loginadmin";
	    }
		
		List<Book> books;
        int totalBooks;
        // Số sách hiển thị trên mỗi trang	
        int recordsPerPage = 10;
        int start;
        int end;
        int totalPages;
        
        if (categoryId == null) {
            books = bookService.getAllBooks();
        } else {
            books = bookService.getBooksByCategory(categoryId);
        }
        
        if (searchKeyword != null && !searchKeyword.isEmpty()) {
            books = bookService.searchBooksByKeyword(books, searchKeyword);
        }
        
        totalBooks = books.size();
        
        // Tính toán vị trí bắt đầu và kết thúc của sách trên trang hiện tại
        start = (currentPage - 1) * recordsPerPage;
        end = Math.min(start + recordsPerPage, totalBooks);
        
        // Lấy danh sách sách trên trang hiện tại
        List<Book> booksOnPage = books.subList(start, end);
        
        // Tính toán số trang
        totalPages = (int) Math.ceil((double) totalBooks / recordsPerPage);
        
        model.addAttribute("books", booksOnPage);
        model.addAttribute("totalBooks", totalBooks);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", currentPage);
        List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);

        return "admin/managebooks";
        
	}
	
	@PostMapping("/updatestatusbook")
	public ResponseEntity<String> updateStatusBook(@RequestParam("bookId") int bookId, 
			@RequestParam("status") int status,
			HttpSession session) {
	    
		Account admin = (Account) session.getAttribute("admin");

	    // Kiểm tra xem admin đã đăng nhập hay chưa
	    if (admin == null) {
	    	// Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Location", "/loginadmin");
	        return ResponseEntity.status(HttpStatus.FOUND)
	                .headers(headers)
	                .body("User not logged in");
	    }
		
	    // Lấy Book từ bookId 
		Book book = bookService.getBookById(bookId);
	    
	    if (book == null) {
	        return ResponseEntity.badRequest().body("Book not found");
	    }
	    
	    book.setStatus(status);
	    bookService.updateBook(book);
	    
	    return ResponseEntity.ok("success");
	}
	
	@GetMapping("/addbook")
	public String showAddBookForm(Model model, 
			HttpSession session) {
		Account admin = (Account) session.getAttribute("admin");

	    // Kiểm tra xem người dùng đã đăng nhập hay chưa
	    if (admin == null) {
	        // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
	        return "redirect:/loginadmin";
	    }
	    
	    List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);
		
		return "admin/addbook";
	}
	
	@PostMapping("/addbook")
	public String addBook(@ModelAttribute("book") Book bookParam,
            @RequestParam("image1") MultipartFile image1,
            @RequestParam("image2") MultipartFile image2,
            @RequestParam("image3") MultipartFile image3,
            @RequestParam("image4") MultipartFile image4,
            @RequestParam("categoryId") Integer categoryId,
            HttpSession session,
            Model model,
            RedirectAttributes redirectAttributes) {
		Account admin = (Account) session.getAttribute("admin");

	    // Kiểm tra xem người dùng đã đăng nhập hay chưa
	    if (admin == null) {
	        // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
	        return "redirect:/loginadmin";
	    }
	    
	    Book newBook = new Book();
	    
	    //Cập nhật thông tin cho cuốn sách mới
	    newBook.setName(bookParam.getName());
	    newBook.setAuthor(bookParam.getAuthor());
	    newBook.setPrice(bookParam.getPrice());
	    Category category = categoryService.getCategoryById(categoryId);
	    newBook.setCategory(category);
	    newBook.setPublisher(bookParam.getPublisher());
	    newBook.setDescription(bookParam.getDescription());
	    newBook.setStatus(bookParam.getStatus());
	    newBook.setDetail(bookParam.getDetail());
	    newBook.setQuantity(bookParam.getQuantity());
	    
	    try {
	    	if (!image1.isEmpty()&&!image2.isEmpty()&&!image3.isEmpty()&&!image4.isEmpty()) {
	    		// Add book để lấy được id thêm vào trong ảnh
	    		newBook.setImg("");
	    		bookService.addBook(newBook);
	    		newBook = bookService.getLastBook();
	        	// Tạo public ID cho hình ảnh trên Cloudinary (sử dụng id sach)
                String publicId1 = "WebBookStore/img_book/book_" + newBook.getId() + "/1";

                // Tải lên hình ảnh lên Cloudinary và lấy URL
                String imageUrl1 = cloudinaryService.uploadImage(image1, publicId1);

                // Lấy đường dẫn URL mà bỏ kí tự sau dấu / cuối cùng
                int lastSlashIndex = imageUrl1.lastIndexOf("/");
                String imageUrl1WithoutTrailingContent = imageUrl1.substring(0, lastSlashIndex + 1);
                
                // Cập nhật URL hình ảnh vào tài khoản
                newBook.setImg(imageUrl1WithoutTrailingContent);
                
                // Tạo public ID và tải 3 hình ảnh còn lại lên Cloudinary
                String publicId2 = "WebBookStore/img_book/book_" + newBook.getId() + "/2";
                String imageUrl2 = cloudinaryService.uploadImage(image2, publicId2);
                
                String publicId3 = "WebBookStore/img_book/book_" + newBook.getId() + "/3";
                String imageUrl3 = cloudinaryService.uploadImage(image3, publicId3);
                
                String publicId4 = "WebBookStore/img_book/book_" + newBook.getId() + "/4";
                String imageUrl4 = cloudinaryService.uploadImage(image4, publicId4);
	        }
		} catch (Exception e) {
			e.printStackTrace();
	        redirectAttributes.addAttribute("message", "Đã xảy ra lỗi khi thêm sách.");
	        return "redirect:/addbook";
		}
	    
	    // Kiểm tra trường hợp số lượng bằng 0 sẽ đưa về ngừng kinh doanh
        if (newBook.getQuantity() == 0) {
        	newBook.setStatus(0);
        }
        
        // Cập nhật sách trong cơ sở dữ liệu
        bookService.updateBook(newBook);
        
        redirectAttributes.addAttribute("message", "Đã thêm sách thành công!");
        return "redirect:/addbook";
	}
	
	@GetMapping("/managedetailbook")
	public String manageDetailBook(@RequestParam("bookId") Integer bookId, 
			Model model,
			HttpSession session) {
		Account admin = (Account) session.getAttribute("admin");

	    // Kiểm tra xem người dùng đã đăng nhập hay chưa
	    if (admin == null) {
	        // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
	        return "redirect:/loginadmin";
	    }
	    
	    // Truy xuất dữ liệu từ nguồn dữ liệu
	    Book book = bookService.getBookById(bookId);

	    // Đặt thuộc tính vào model để sử dụng trong view
	    model.addAttribute("book", book);

	    // Forward đến trang chi tiết sách
	    return "admin/managedetailbook";
	}
	
	@GetMapping("/updatebook")
	public String showUpdateBookForm(@RequestParam("bookId") Integer bookId,
			Model model,
			HttpSession session) {
		Account admin = (Account) session.getAttribute("admin");

	    // Kiểm tra xem người dùng đã đăng nhập hay chưa
	    if (admin == null) {
	        // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
	        return "redirect:/loginadmin";
	    }
	    
	    //Lấy sách theo Id
	    Book book = bookService.getBookById(bookId);
	    
	    // Đặt thuộc tính vào model để sử dụng trong view
	    model.addAttribute("book", book);
	    List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);
        
        return "admin/updatebook";
	}
	
	@PostMapping("/updatebook")
	public String updateBook(@ModelAttribute("book") Book bookParam,
            @RequestParam("image1") MultipartFile image1,
            @RequestParam("image2") MultipartFile image2,
            @RequestParam("image3") MultipartFile image3,
            @RequestParam("image4") MultipartFile image4,
            @RequestParam("categoryId") Integer categoryId,
            HttpSession session,
            Model model,
            RedirectAttributes redirectAttributes) {
		Account admin = (Account) session.getAttribute("admin");

	    // Kiểm tra xem người dùng đã đăng nhập hay chưa
	    if (admin == null) {
	        // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
	        return "redirect:/loginadmin";
	    }
	    
	    // Tạo sách để cập nhật 
	    Book updateBook = bookService.getBookById(bookParam.getId());
	    
	    //Cập nhật thông tin cho cuốn sách
	    updateBook.setName(bookParam.getName());
	    updateBook.setAuthor(bookParam.getAuthor());
	    updateBook.setPrice(bookParam.getPrice());
	    Category category = categoryService.getCategoryById(categoryId);
	    updateBook.setCategory(category);
	    updateBook.setPublisher(bookParam.getPublisher());
	    updateBook.setDescription(bookParam.getDescription());
	    updateBook.setStatus(bookParam.getStatus());
	    updateBook.setDetail(bookParam.getDetail());
	    updateBook.setQuantity(bookParam.getQuantity());
	    
	    try {
	        // Tạo public ID cho hình ảnh trên Cloudinary (sử dụng id sách)
	        String publicId = "WebBookStore/img_book/book_" + updateBook.getId();
	        
	        // Tạo một danh sách các nhiệm vụ tải lên ảnh
	        List<Callable<String>> uploadTasks = new ArrayList<>();
	        
	        // Kiểm tra và tạo nhiệm vụ tải lên ảnh cho từng ảnh
	        if (!image1.isEmpty()) {
	            uploadTasks.add(() -> cloudinaryService.uploadImage(image1, publicId + "/1"));
	        } else {
	            uploadTasks.add(() -> cloudinaryService.uploadImageFromUrl(updateBook.getImg() + "1", publicId + "/1"));
	        }
	        if (!image2.isEmpty()) {
	            uploadTasks.add(() -> cloudinaryService.uploadImage(image2, publicId + "/2"));
	        } else {
	            uploadTasks.add(() -> cloudinaryService.uploadImageFromUrl(updateBook.getImg() + "2", publicId + "/2"));
	        }
	        if (!image3.isEmpty()) {
	            uploadTasks.add(() -> cloudinaryService.uploadImage(image3, publicId + "/3"));
	        } else {
	            uploadTasks.add(() -> cloudinaryService.uploadImageFromUrl(updateBook.getImg() + "3", publicId + "/3"));
	        }
	        if (!image4.isEmpty()) {
	            uploadTasks.add(() -> cloudinaryService.uploadImage(image4, publicId + "/4"));
	        } else {
	            uploadTasks.add(() -> cloudinaryService.uploadImageFromUrl(updateBook.getImg() + "4", publicId + "/4"));
	        }
	        
	        // Tạo một ExecutorService để thực hiện các nhiệm vụ tải lên ảnh song song
	        ExecutorService executorService = Executors.newFixedThreadPool(uploadTasks.size());
	        
	        // Thực hiện các nhiệm vụ tải lên ảnh và lấy URL của ảnh đã tải lên
	        List<Future<String>> uploadResults = executorService.invokeAll(uploadTasks);
	        String imageUrl = "";
	        for (Future<String> uploadResult : uploadResults) {
	            imageUrl = uploadResult.get();
	            // Lấy đường dẫn URL mà bỏ kí tự sau dấu / cuối cùng
	            int lastSlashIndex = imageUrl.lastIndexOf("/");
	            String imageUrlWithoutTrailingContent = imageUrl.substring(0, lastSlashIndex + 1);
	            
	            // Cập nhật URL hình ảnh vào tài khoản
	            updateBook.setImg(imageUrlWithoutTrailingContent);
	        }
	        
	        // Đóng ExecutorService sau khi hoàn thành
	        executorService.shutdown();
	    } catch (Exception e) {
	        e.printStackTrace();
	        redirectAttributes.addAttribute("message", "Đã xảy ra lỗi khi cập nhật sách.");
	        return "redirect:/updatebook";
	    }
	    
	    // Kiểm tra trường hợp số lượng bằng 0 sẽ đưa về ngừng kinh doanh
        if (updateBook.getQuantity() == 0) {
        	updateBook.setStatus(0);
        }
        
        // Cập nhật sách trong cơ sở dữ liệu
        bookService.updateBook(updateBook);
        
        // Sinh giá trị ngẫu nhiên
        Random random = new Random();
        int randomNumber = random.nextInt();
        redirectAttributes.addAttribute("randomNumber", randomNumber);
        redirectAttributes.addAttribute("message", "Đã cập nhật sách thành công!");
        redirectAttributes.addAttribute("bookId", updateBook.getId());
        return "redirect:/updatebook";
	}
}
