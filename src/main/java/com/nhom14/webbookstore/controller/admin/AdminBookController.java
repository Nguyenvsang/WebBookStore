package com.nhom14.webbookstore.controller.admin;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
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
import com.nhom14.webbookstore.entity.Author;
import com.nhom14.webbookstore.entity.Book;
import com.nhom14.webbookstore.entity.BookAuthor;
import com.nhom14.webbookstore.entity.BookImage;
import com.nhom14.webbookstore.entity.Category;
import com.nhom14.webbookstore.service.AuthorService;
import com.nhom14.webbookstore.service.BookAuthorService;
import com.nhom14.webbookstore.service.BookService;
import com.nhom14.webbookstore.service.CategoryService;
import com.nhom14.webbookstore.service.CloudinaryService;
import com.nhom14.webbookstore.service.bookImageService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminBookController {

	private BookService bookService;
	private CategoryService categoryService;
	private CloudinaryService cloudinaryService;
	private BookAuthorService bookAuthorService;
	private AuthorService authorService;
	private bookImageService bookImageService;
	
	@Autowired
	public AdminBookController(BookService bookService, CategoryService categoryService,
			CloudinaryService cloudinaryService, BookAuthorService bookAuthorService,
			AuthorService authorService, bookImageService bookImageService) {
		super();
		this.bookService = bookService;
		this.categoryService = categoryService;
		this.cloudinaryService = cloudinaryService;
		this.bookAuthorService = bookAuthorService;
		this.authorService = authorService;
		this.bookImageService = bookImageService;
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
	    
	    List<BookAuthor> bookAuthors = bookAuthorService.getByBook(book);
	    String authors = "";
	    for (int i = 0; i < bookAuthors.size(); i++) {
	        authors += bookAuthors.get(i).getAuthor().getName();
	        if (i < bookAuthors.size() - 1) {
	            authors += ", ";
	        }
	    }

	    // Đặt thuộc tính vào model để sử dụng trong view
	    model.addAttribute("book", book);
	    model.addAttribute("authors", authors);

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
	    
        // Lấy danh sách tác giả của cuốn sách
        List<BookAuthor> bookAuthors = bookAuthorService.getByBook(book);
        List<Author> authors = new ArrayList<>();

	     // Lặp qua danh sách bookAuthors và lấy ra tác giả tương ứng
	     for (BookAuthor bookAuthor : bookAuthors) {
	         authors.add(bookAuthor.getAuthor());
	     }
        
        // Lấy danh sách tất cả tác giả
        List<Author> allAuthors = authorService.getAllAuthors();
        
        // Đặt thuộc tính vào model để sử dụng trong view
	    model.addAttribute("book", book);
	    List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);
        model.addAttribute("authors", authors);
        model.addAttribute("allAuthors", allAuthors);
        
        return "admin/updatebook";
	}
	
	@PostMapping("/updatebook")
	public String updateBook(@ModelAttribute("book") Book bookParam,
            @RequestParam("image1") MultipartFile image1,
            @RequestParam("image2") MultipartFile image2,
            @RequestParam("image3") MultipartFile image3,
            @RequestParam("image4") MultipartFile image4,
            @RequestParam("categoryId") Integer categoryId,
            @RequestParam("authorsIds") List<Integer> authorIds,
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
	    
	    // Lấy danh sách BookImage liên quan đến cuốn sách
	    List<BookImage> bookImages = bookImageService.getByBook(updateBook);

	    // Duyệt qua danh sách BookImage
	    for (BookImage bookImage : bookImages) {
	        // Lấy tên của BookImage
	        String imageName = bookImage.getName();
	        int imagePosition = bookImage.getPosition();

	        // Tạo biến MultipartFile tương ứng
	        MultipartFile imageFile = null;

	        // Dựa vào vị trí, xác định và gán ảnh mới cho biến imageFile
	        if (imagePosition == 1) {
	            imageFile = image1;
	        } else if (imagePosition == 2) {
	            imageFile = image2;
	        } else if (imagePosition == 3) {
	            imageFile = image3;
	        } else if (imagePosition == 4) {
	            imageFile = image4;
	        }

	        // Nếu imageFile không rỗng, lưu ảnh mới
	        if (imageFile != null && !imageFile.isEmpty()) {
	            // Lưu ảnh mới vào cùng vị trí
	            overwriteImage(imageFile, bookImage.getPath());
	        }
	    }
	    
	    //Cập nhật thông tin cho cuốn sách
	    updateBook.setName(bookParam.getName());
	    updateBook.setCostPrice(bookParam.getCostPrice());
	    updateBook.setSellPrice(bookParam.getSellPrice());
	    Category category = categoryService.getCategoryById(categoryId);
	    updateBook.setCategory(category);
	    updateBook.setPublisher(bookParam.getPublisher());
	    updateBook.setDescription(bookParam.getDescription());
	    updateBook.setStatus(bookParam.getStatus());
	    updateBook.setDetail(bookParam.getDetail());
	    updateBook.setQuantity(bookParam.getQuantity());
	   
	    
	    
	    // Kiểm tra trường hợp số lượng bằng 0 sẽ đưa về ngừng kinh doanh
        if (updateBook.getQuantity() == 0) {
        	updateBook.setStatus(0);
        }
        
        // Cập nhật sách trong cơ sở dữ liệu
        bookService.updateBook(updateBook);
        
        // Phần cập nhật tác giả cho cuốn sách
	    List<Author> newAuthors = new ArrayList<>();
	    
	    for (Integer authorId : authorIds) {
	        Author author = authorService.getAuthorById(authorId);
	        if (author != null) {
	            newAuthors.add(author);
	        }
	    }
	    
	    // Xóa các bản ghi cũ trong bảng BookAuthor
	    bookAuthorService.deleteBookAuthorsByBook(updateBook);
	    
	    // Tạo các bản ghi mới trong bảng BookAuthor cho tác giả mới
	    for (Author author : newAuthors) {
	        BookAuthor bookAuthor = new BookAuthor();
	        bookAuthor.setBook(updateBook);
	        bookAuthor.setAuthor(author);
	        bookAuthorService.addBookAuthor(bookAuthor);
	    }
        
        // Sinh giá trị ngẫu nhiên
        Random random = new Random();
        int randomNumber = random.nextInt();
        redirectAttributes.addAttribute("randomNumber", randomNumber);
        redirectAttributes.addAttribute("message", "Đã cập nhật sách thành công!");
        redirectAttributes.addAttribute("bookId", updateBook.getId());
        return "redirect:/updatebook";
	}
	
	private void overwriteImage(MultipartFile imageFile, String existingImagePath) {
	    try {
	        // Tạo đường dẫn tuyệt đối với thư mục lưu trữ ảnh
	        String absolutePath = "file:///D:/Baitapthumuc/HK1Nam4/Tieuluanchuyennganh/MoitruongchoAppBookSpringBoot/WebBookStore/src/main/resources/static" + existingImagePath;
	        Path existingImageFilePath = Paths.get(absolutePath);
	        
	        // Ghi đè tệp ảnh mới lên tệp ảnh cũ
	        Files.copy(imageFile.getInputStream(), existingImageFilePath, StandardCopyOption.REPLACE_EXISTING);
	        
	        // Cập nhật đường dẫn ảnh hiện tại với đường dẫn tệp tin mới
	        existingImagePath = existingImageFilePath.toString();

	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
}
