create database webbookstore;

-- Sử dụng cơ sở dữ liệu sms 
USE webbookstore;

-- Tạo bảng category
CREATE TABLE Category (
  -- Khai báo thuộc tính id kiểu int, không được null, tăng tự động và là khóa chính
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  -- Khai báo thuộc tính name kiểu varchar(255), không được null
  name varchar(255) NOT NULL,
  -- Khai báo thuộc tính status kiểu int, không được null
  status INT NOT NULL
);

-- Tạo bảng book
CREATE TABLE Book (
  -- Khai báo thuộc tính id kiểu int, không được null, tăng tự động và là khóa chính
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  -- Khai báo thuộc tính name kiểu varchar(255), không được null
  name varchar(255) NOT NULL,
  -- Khai báo thuộc tính author kiểu varchar(255), không được null
  author varchar(255) NOT NULL,
  -- Khai báo thuộc tính price kiểu double, không được null
  price double NOT NULL,
  -- Khai báo thuộc tính category_id kiểu int và là khóa ngoại tham chiếu đến bảng Category
  category_id int,
  FOREIGN KEY (category_id) REFERENCES Category(id),
  -- Khai báo thuộc tính img kiểu char(255)
  img char(255),
  -- Khai báo thuộc tính publisher kiểu varchar(255), không được null
  publisher varchar(255) NOT NULL,
  -- Khai báo thuộc tính description kiểu text, có thể null
  description text,
  -- Khai báo thuộc tính status kiểu int, không được null
  status INT NOT NULL,
  -- Khai báo thuộc tính detail kiểu text, có thể null
  detail text,
  -- Khai báo thuộc tính quantity kiểu int, không được null
  quantity INT NOT NULL
);

-- Tạo bảng account
CREATE TABLE Account (
  -- Khai báo thuộc tính id kiểu int, không được null, tăng tự động và là khóa chính
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  -- Khai báo thuộc tính first_name kiểu varchar(255)
  first_name varchar(255),
  -- Khai báo thuộc tính last_name kiểu varchar(255)
  last_name varchar(255),
  -- Khai báo thuộc tính username kiểu varchar(255), không được null
  username varchar(255) NOT NULL,
  -- Khai báo thuộc tính password kiểu varchar(255), không được null
  password varchar(255) NOT NULL,
  -- Khai báo thuộc tính gender kiểu varchar(255)
  gender varchar(255),
  -- Khai báo thuộc tính img kiểu char(255)
  img char(255),
  -- Khai báo thuộc tính date_of_birth kiểu date
  date_of_birth DATE,
  -- Khai báo thuộc tính address kiểu varchar(255), không được null
  address VARCHAR(255) NOT NULL,
  -- Khai báo thuộc tính phone_number kiểu varchar(255), không được null
  phone_number varchar(255) NOT NULL,
  -- Khai báo thuộc tính email kiểu char(255), không được null
  email char(255) NOT NULL,
  -- Khai báo thuộc tính account_type kiểu int, không được null
  account_type INT NOT NULL,
  -- Khai báo thuộc tính status kiểu int, không được null
  status INT NOT NULL
);

-- Tạo bảng Cart
CREATE TABLE Cart (
  -- Khai báo thuộc tính id kiểu int, không được null, tăng tự động và là khóa chính
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  -- Khai báo thuộc tính account_id kiểu int, không được null và là khóa ngoại tham chiếu đến bảng Account 
  account_id INT NOT NULL,
  FOREIGN KEY (account_id) REFERENCES Account(id)
);

-- Tạo bảng CartItem
CREATE TABLE CartItem (
  -- Khai báo thuộc tính id kiểu int, không được null, tăng tự động và là khóa chính
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  -- Khai báo thuộc tính quantity kiểu int, không được null
  quantity INT NOT NULL,
  -- Khai báo thuộc tính cart_id kiểu int, không được null và là khóa ngoại tham chiếu đến bảng Cart
  cart_id INT NOT NULL,
  FOREIGN KEY (cart_id) REFERENCES Cart(id),
  -- Khai báo thuộc tính book_id kiểu int, không được null và là khóa ngoại tham chiếu đến bảng Book
  book_id INT NOT NULL,
  FOREIGN KEY (book_id) REFERENCES Book(id)
);

-- Tạo bảng Order
CREATE TABLE `Order` (
	-- Khai báo thuộc tính id kiểu int, không được null, tăng tự động và là khóa chính
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	-- Khai báo thuộc tính date_order kiểu Date, không được null
	date_order DATE NOT NULL,
	-- Khai báo thuộc tính total_price kiểu double, không được null
	total_price DOUBLE NOT NULL,
	-- Khai báo thuộc tính name kiểu varchar(255), không được null
	name VARCHAR(255) NOT NULL,
	-- Khai báo thuộc tính address kiểu varchar(255), không được null
	address VARCHAR(255) NOT NULL,
	-- Khai báo thuộc tính phone_number kiểu varchar(20), không được null
	phone_number VARCHAR(20) NOT NULL,
	-- Khai báo thuộc tính email kiểu char(255), không được null
	email CHAR(255) NOT NULL,
	-- Khai báo thuộc tính account_id kiểu int, không được null và là khóa ngoại tham chiếu đến bảng Account
	account_id INT NOT NULL,
	FOREIGN KEY (account_id) REFERENCES Account(id),
	-- Khai báo thuộc tính status kiểu int, không được null
	status INT NOT NULL
);


-- Tạo bảng OrderItem
CREATE TABLE OrderItem (
  -- Khai báo thuộc tính id kiểu int, không được null, tăng tự động và là khóa chính
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  -- Khai báo thuộc tính quantity kiểu int, không được null
  quantity INT NOT NULL,
  -- Khai báo thuộc tính price kiểu double, không được null
  price double NOT NULL,
  -- Khai báo thuộc tính book_id kiểu int, không được null và là khóa ngoại tham chiếu đến bảng Book
  book_id INT NOT NULL,
  FOREIGN KEY (book_id) REFERENCES Book(id),
  -- Khai báo thuộc tính order_id kiểu int, không được null và là khóa ngoại tham chiếu đến bảng Order
  order_id INT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES `Order`(id)
);

-- Thêm dữ liệu vào bảng Category
INSERT INTO Category (name, status) VALUES ("CHÍNH TRỊ - PHÁP LUẬT", 1);
INSERT INTO Category (name, status) VALUES ("GIÁO TRÌNH", 1);
INSERT INTO Category (name, status) VALUES ("KHOA HỌC CÔNG NGHỆ - KINH TẾ", 1);
INSERT INTO Category (name, status) VALUES ("TRUYỆN, TIỂU THUYẾT", 1);
INSERT INTO Category (name, status) VALUES ("TÂM LÝ, TÂM LINH, TÔN GIÁO", 1);
INSERT INTO Category (name, status) VALUES ("THIẾU NHI", 1);
INSERT INTO Category (name, status) VALUES ("VĂN HỌC NGHỆ THUẬT", 1);
INSERT INTO Category (name, status) VALUES ("VĂN HÓA XÃ HỘI - LỊCH SỬ", 1);

-- Thêm dữ liệu vào bảng Account
-- admin 
INSERT INTO Account(first_name, last_name, username, password, gender, img, date_of_birth, address, phone_number, email, account_type, status)
VALUES ("Minh", "Phạm", "phamthiminh", "$2a$10$lUfNHigfLAxtdO5TeYKf1ezzqdTquqtIL/HkdyD4LU0wlixIfpAZG", "Nữ", "", "2002-03-03", "Vũng Tàu", "0388394909", "minh09@gmail.com", 0, 1);
INSERT INTO Account(first_name, last_name, username, password, gender, img, date_of_birth, address, phone_number, email, account_type, status)
VALUES ("Mai", "Lâm", "lamngocmai", "$2a$10$ecLWKUctvRxMJoZLWHiwyuH8tGP7LFTrNEDoTiNsvkJOsAOZJh6eG", "Nữ", "", "2002-04-13", "Trà Vinh", "057399379", "mai79@gmail.com", 0, 1);
-- customer 
INSERT INTO Account(first_name, last_name, username, password, gender, img, date_of_birth, address, phone_number, email, account_type, status)
VALUES ("A", "Nguyễn", "nguyenvana", "$2a$10$2e.U.VeBZI9AI9M4HLpHeevfHaBn5fLHBILe6TIpTAORGKV/fa9wq", "Nam", "", "2002-06-10", "TP.HCM", "0388156408", "a08@gmail.com", 1, 1);
INSERT INTO Account(first_name, last_name, username, password, gender, img, date_of_birth, address, phone_number, email, account_type, status)
VALUES ("Sang", "Nguyễn", "nguyenvansang", "$2a$10$EOAYipGx4YVsEPCzLxXgFu/rlFA5R93lp6DPwjssLj.OGFYRKENHm", "Nam", "", "2002-09-10", "An Giang", "0288199567", "sang67@gmail.com", 1, 1);
INSERT INTO Account(first_name, last_name, username, password, gender, img, date_of_birth, address, phone_number, email, account_type, status)
VALUES ("Hạ", "Trần", "tranthiha", "$2a$10$fbmKZXKvk4APdj4p6becc.RHSG1bIKpjsNyQl6ml.OEx3.zfWqGL.", "Nữ", "", "2003-10-10", "Bến Tre", "0788467389", "ha89@gmail.com", 1, 1);
INSERT INTO Account(first_name, last_name, username, password, gender, img, date_of_birth, address, phone_number, email, account_type, status)
VALUES ("Tươi", "Trần", "tranvantuoi", "$2a$10$i30yFjhiZywZbfshpgiIA.MoDHert9OvSD7ZKXcqTvDO28AxZFh2y", "Nam", "", "2000-02-07", "Quảng Ngãi", "0977767587", "tuoi87@gmail.com", 1, 1);
INSERT INTO Account(first_name, last_name, username, password, gender, img, date_of_birth, address, phone_number, email, account_type, status)
VALUES ("Hoa", "Phan", "phanthihoa", "$2a$10$4cU9CFgSw1.pbTB/GbODUuzlGQLOGB2/O58Yyi1nygMEzWXDdNyEW", "Nữ", "", "1999-09-09", "Bắc Ninh", "0578695748", "hoa48@gmail.com", 1, 1);
INSERT INTO Account(first_name, last_name, username, password, gender, img, date_of_birth, address, phone_number, email, account_type, status)
VALUES ("Anh", "Nguyễn", "nguyendieuanh", "$2a$10$V0nioZSN5WopWcXyxAta3uTHB2v/ehixJ3GQV.4c35jfiYl733lKW", "Nữ", "", "1998-02-11", "Bắc Kạn", "0478399293", "anh93@gmail.com", 1, 1);
INSERT INTO Account(first_name, last_name, username, password, gender, img, date_of_birth, address, phone_number, email, account_type, status)
VALUES ("Bích", "Lê", "lengocbich", "$2a$10$cVxqCvC9fVqEfGd8jkFwXOPj0rcCMDLrxCMfcWmf/aVMHFgWXq75u", "Nữ", "", "1999-03-12", "Lâm Đồng", "0747749829", "bich29@gmail.com",1, 1);
INSERT INTO Account(first_name, last_name, username, password, gender, img, date_of_birth, address, phone_number, email, account_type, status)
VALUES ("Dung", "Đỗ", "domydung", "$2a$10$vwwuS0KBK4qdqZkBAzp8zuFrnedxMcInQPaHTRD.bYLQ7VeQxm1dq", "Nữ", "", "2002-08-04", "Long An", "0747483974", "dung74@gmail.com", 1, 1);


-- Thêm dữ liệu vào bảng Book  
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Luật Sở Hữu Trí Tuệ (Hiện Hành) (Sửa Đổi, Bổ Sung Năm 2009, 2022)", "Quốc Hội", 78000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694971592/PHOTO_LIST/Chinhtri_phapluat/001/", 
"NXB Chính Trị Quốc Gia", 
'"Luật Sở Hữu Trí Tuệ"
Nội dung cuốn sách là văn bản Luật Đấu thầu năm 2013 được nhất thể hóa với Luật sửa đổi, bổ sung Điều 6 và Phụ lục 4 về Danh mục ngành, nghề đầu tư kinh doanh có điều kiện của Luật đầu tư; Luật hỗ trợ doanh nghiệp nhỏ và vừa năm 2017; Luật kiến trúc năm 2019 và Luật đầu tư theo phương thức đối tác công tư năm 2020, giúp bạn đọc thuận tiện tra cứu, tham khảo.',
 1, "Tên Nhà Cung Cấp:	NXB Chính Trị Quốc Gia
Tác giả:	Quốc Hội
NXB:	Chính Trị Quốc Gia Sự Thật
Năm XB:	2022
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	220
Kích Thước Bao Bì:	19 x 13 x 1 cm
Số trang:	275
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Luật Doanh Nghiệp (Hiện Hành) (Sửa Đổi, Bổ Sung Năm 2022)", "Quốc Hội", 122000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694971592/PHOTO_LIST/Chinhtri_phapluat/002/", 
"NXB Chính Trị Quốc Gia", 
'"Luật Doanh Nghiệp"
Luật Doanh nghiệp (hiện hành) (sửa đổi, bổ sung năm 2022) gồm 10 chương, 218 điều, quy định về thành lập, tổ chức quản lý, tổ chức lại, giải thể và hoạt động có liên quan của doanh nghiệp, bao gồm công ty trách nhiệm hữu hạn, công ty cổ phần, công ty hợp danh và doanh nghiệp tư nhân; quy định về nhóm công ty. Luật Doanh nghiệp được Quốc hội khóa XIV kỳ họp thứ 9 thông qua ngày 17/6/2020, thay thế cho Luật Doanh nghiệp năm 2014.
Ngày 11/1/2022, tại kỳ họp bất thường lần thứ nhất, Quốc hội khóa XV đã thông qua Luật sửa đổi, bổ sung một số điều của Luật Đầu tư công, Luật Đầu tư theo phương thức đối tác công tư, Luật Đầu tư, Luật Nhà ở, Luật Đấu thầu, Luật Điện lực, Luật Doanh nghiệp, Luật Thuế tiêu thụ đặc biệt và Luật Thi hành án dân sự, trong đó có nội dung sửa đổi, bổ sung một số điều của Luật Doanh nghiệp năm 2020.
Cuốn sách Luật Doanh nghiệp (hiện hành) (sửa đổi, bổ sung năm 2022) là văn bản Luật hợp nhất của Luật Doanh nghiệp năm 2020 và các nội dung của lần sửa đổi năm 2022, tạo thành một văn bản Luật Doanh nghiệp thống nhất, hiện hành và mới nhất, thuận tiện trong sử dụng, tra cứu và học tập.', 
1, "Tên Nhà Cung Cấp:	NXB Chính Trị Quốc Gia
Tác giả:	Quốc Hội
NXB:	Chính Trị Quốc Gia Sự Thật
Năm XB:	2023
Trọng lượng (gr):	237
Kích Thước Bao Bì:	19 x 13 x 1.2 cm
Số trang:	295
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Kinh Doanh Sành Luật (Ứng Dụng Luật Doanh Nghiệp Năm 2020, Sửa Đổi, Bổ Sung Năm 2022 Và Quy Định Liên Quan)", "LS Trương Thanh Đức", 195000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694971592/PHOTO_LIST/Chinhtri_phapluat/003/", 
"NXB Chính Trị Quốc Gia", 
'"Kinh Doanh Sành Luật "
Trong bối cảnh xã hội hiện nay, xu hướng toàn cầu hóa, hội nhập quốc tế, cuộc Cách mạng công nghiệp lần thứ 4 và đặc biệt là dịch bệnh Covid-19 đã tác động nhiều chiều đến nền kinh tế Việt Nam cũng như hoạt động kinh doanh của các công ty. Để tận dụng lợi thế cũng như hạn chế các rủi ro trong hoạt động sản xuất - kinh doanh thì những người lãnh đạo, quản lý công ty, các luật sư tư vấn cần phải đưa ra các giải pháp pháp lý chính xác, kịp thời. Muốn vậy, chỉ hiểu biết pháp luật thôi thì chưa đủ, những người lãnh đạo, quản lý công ty, các luật sư tư vấn còn cần phải nắm vững và làm chủ được hoàn cảnh bằng cách vận dụng linh hoạt các quy định của pháp luật, phải trở thành những chuyên gia, những người “sành sỏi”, hiểu biết pháp luật nhằm đem lại hiệu quả cao nhất trong hoạt động kinh doanh. Xuất phát từ lý do này, Luật sư Trương Thanh Đức đã dành tâm huyết nghiên cứu và biên soạn cuốn sách Kinh doanh sành luật (Ứng dụng Luật Doanh nghiệp năm 2020 và quy định liên quan).
Cuốn sách được tác giả biên soạn dựa trên cơ sở kế thừa nội dung cuốn sách Luận giải về Luật Doanh nghiệp hiện hành (36 kế sách pháp lý của doanh nghiệp). Nội dung cuốn sách tổng hợp luận những điều khoản quan trọng của Luật Doanh nghiệp - 2020 cũng như các quy định liên quan giúp người đọc hệ thống hóa, nắm bắt được một cách toàn diện và khoa học các quy định pháp luật liên quan đến các vấn đề, vướng mắc thường gặp trong hoạt động đầu tư, kinh doanh. Đặc biệt, người đọc sẽ tìm thấy ở cuốn sách những điểm cần lưu ý và những giải pháp mang tính gợi mở cho các vấn đề cụ thể từng xảy ra trong thực tiễn. Bên cạnh đó, bằng việc so sánh giữa các quy định pháp luật qua các lần sửa đổi, bổ sung, người đọc sẽ có được cái nhìn hệ thống về tiến trình thay đổi, phát triển của Luật Doanh nghiệp nói riêng, pháp luật Việt Nam nói chung', 
1, "Tên Nhà Cung Cấp:	NXB Chính Trị Quốc Gia
Tác giả:	LS Trương Thanh Đức
NXB:	Chính Trị Quốc Gia Sự Thật
Năm XB:	2023
Trọng lượng (gr):	540
Kích Thước Bao Bì:	24 x 16 x 2.6 cm
Số trang:	524
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Tủ Sách Bác Hồ - Trung Thu Cháu Nhớ Bác Hồ", "Khánh Linh", 47000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694971592/PHOTO_LIST/Chinhtri_phapluat/004/", 
"NXB Lao Động", 
'"Tủ Sách Bác Hồ - Trung Thu Cháu Nhớ Bác Hồ"
Nằm trong "Tủ Sách Bác Hồ", Cuốn sách “Trung Thu Cháu Nhớ Bác Hồ”, là một tác phẩm viết về Bác Hồ và những câu chuyện của Bác với các em thiếu nhi. Cuốn sách do Nhà sách Tân Việt và NXB Văn Học liên kết hợp tác phát hành. Sách được xuất bản lần đầu năm 2017 và đã được công chúng nồng nhiệt đón nhận. Cuốn sách đã trở nên thân thiết với các bạn đọc với nhiều lứa tuổi khác nhau, đặc biệt là các cháu thiếu niên.', 
1, "Tên Nhà Cung Cấp:	Tân Việt
Tác giả:	Khánh Linh
NXB:	Lao Động
Năm XB:	2022
Trọng lượng (gr):	140
Kích Thước Bao Bì:	20.5 x 13.5 x 0.8 cm
Số trang:	192
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Luật Hấp Dẫn Và Sức Mạnh Tiềm Thức", "Joseph Murphy", 139000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694971592/PHOTO_LIST/Chinhtri_phapluat/005/", 
"NXB Lao Động", 
'"Luật Hấp Dẫn Và Sức Mạnh Tiềm Thức"
Nguồn gốc của phản ứng là tiềm thức và tư duy, và như luật hấp dẫn đã khẳng định một cách chắc chắn, chính tiềm thức và tư duy đang điều khiển cuộc sống của bạn.
Người giàu có và kẻ nghèo khổ, người thành công và kẻ thất bại, người sáng chói giữa vầng hào quang và kẻ thảm hại xám xịt ảm đạm, một thiên tài hay kẻ nằm ở dưới đáy… tất cả bọn họ đều chỉ khác nhau ở duy nhất một điểm. Đó là có người đã nhận ra, đồng thời ứng dụng rất tốt luật hấp dẫn trong cuộc sống của mình, một số khác thì không.
Trong cuốn sách này, tác giả sẽ đưa ra cho bạn những lời khuyên thực tế và hữu ích về:
Cách cư xử, ứng xử và giao tiếp với mọi người để giúp bạn sử dụng nhuần nhuyễn luật hấp dẫn, nâng cao sức mạnh của tiềm thức.
Phương pháp khơi nguồn và tận dụng mọi khả năng của mình, để ngày càng trở nên giàu có hơn và đạt được thành công trong cuộc sống.
Nếu như bạn muốn hiểu về luật hấp dẫn, muốn biết cách dựa vào nó để tìm thấy cảm hứng, niềm vui và nguồn năng lượng tích cực, chắc chắn Ứng dụng luật hấp dẫn là một sự lựa chọn sáng suốt dành cho bạn.', 
1, "Tên Nhà Cung Cấp:	1980 Books
Tác giả:	Joseph Murphy
Người Dịch:	Dương Bùi
NXB:	Lao Động
Năm XB:	2023
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	200
Kích Thước Bao Bì:	19 x 13 x 0.9 cm
Số trang:	180
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Chính Trị Luận (Tái Bản 2023)", "Aristotle", 189000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694971592/PHOTO_LIST/Chinhtri_phapluat/006/", 
"NXB Thế Giới", 
'"Chính Trị Luận"
Tác phẩm nổi tiếng viết về các khái niệm mà từ đó định hình các quốc gia và chính phủ. Mặc dù, Aristotle cổ vũ mạnh mẽ cho chế độ nô lệ lạc hậu, quan điểm của ông về Hiến pháp và cách điều hành chính phủ lại rất kinh điển. Dù chỉ thảo luận về nhà nước và các định chế thời Hy Lạp cổ nhưng tác phẩm này của ông đã đặt nền tảng cho khoa học chính trị hiện đại.
Tác phẩm này được xem là căn bản cho Chính trị học Tây phương. Chính trị luận nghiên cứu các vấn đề cơ bản về nhà nước, chính quyền, chính trị, tự do, công bằng, tài sản, quyền, luật và việc thực thi luật pháp của các cơ quan thẩm quyền.
Aristotle là biểu tượng của trí tuệ tư duy triết học. Mặc dù nội dung rất sâu sắc nhưng cách trình bày của ông lại rất dễ hiểu. Ông viết những suy nghĩ của mình một cách rõ ràng với độ chính xác siêu phàm. Học thuyết của ông có ảnh hưởng lớn đến những lĩnh vực hiện đại như : khoa học, chủ nghĩa duy thực và logic học
Theo Aristotle, là một người tốt không thôi chưa đủ. Nếu người dân tốt mà không tích cực tham gia vào đời sống chính trị của chế độ thì chế độ đó có cơ nguy trở thành thoái hóa và trở thành một chế độ xấu. – Dịch giả Nông Duy Trường', 
1, "Tên Nhà Cung Cấp:	Alpha Books
Tác giả:	Aristotle
Người Dịch:	Nông Duy Trường
NXB:	Thế Giới
Năm XB:	2023
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	474
Kích Thước Bao Bì:	20.5 x 14 x 2 cm
Số trang:	438
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Nghệ Thuật Suy Tưởng - Luận Lí Học Tổng Quát Và Phương Pháp Luận", "Trần Nhựt Tân", 98000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694971592/PHOTO_LIST/Chinhtri_phapluat/007/", 
"NXB Hồng Đức", 
'"Nghệ Thuật Suy Tưởng - Luận Lí Học Tổng Quát Và Phương Pháp Luận"
Con người sống là hành động: hành động để thỏa mãn nhu cầu thực tiễn hay để thỏa mãn lòng hiếu tri. Với khả năng giới hạn, khi hành động, họ lại thường gặp thất bại, hiểu biết lại thường sai lầm. Sau nhiều lần “thử” và “lầm” mà trí tuệ thức tỉnh, vẫn tra hỏi, vẫn tìm hiểu những tương quan khách quan: đó là lúc khoa học thực sự hình thành.
NGHỆ THUẬT SUY TƯỞNG tóm lược nhiều học thuyết triết học về các nguyên tắc, quy luật hướng dẫn cho việc suy tưởng đúng, nhất là luận lí học và nhận thức luận. Qua những phần được trình bày rất rõ ràng và dễ hiểu, tác giả đã thành công đưa những tri thức triết học và logic học khô khan, khó hiểu thành một đường dây xuyên suốt giúp người đọc dễ nắm bắt và trau dồi được nghệ thuật suy tưởng.', 
1, "Tên Nhà Cung Cấp:	Cty Văn Hóa Văn Lang
Tác giả:	Trần Nhựt Tân
NXB:	Hồng Đức
Năm XB:	2022
Trọng lượng (gr):	249
Kích Thước Bao Bì:	21 x 13.5 x 0.9 cm
Số trang:	231
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Chủ Quyền Biển Đảo Việt Nam Xưa Và Nay", "Lê Thái Dũng", 72000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694971592/PHOTO_LIST/Chinhtri_phapluat/008/", 
"NXB Hồng Đức", 
'"Chủ Quyền Biển Đảo Việt Nam Xưa Và Nay"
Quyển sách "Chủ quyền biển đảo Việt Nam xưa và nay" của tác giả Lê Thái Dũng được xuất bản bởi nhà xuất bản Hồng Đức vào năm 2020, gồm 216 trang, khổ 21cm. Sách tập hợp nhiều bài viết khác nhau, được trình bày theo lối lịch sử sắp xếp logic theo từng giai đoạn. Sách là một tài liệu quý khi đã khái quát và đưa ra được một số bằng chứng pháp lý từ thời phong kiến Việt Nam đã thực thi chủ quyền trên hai quần đảo Hoàng Sa và Trường Sa. Tác giả còn miêu tả rất cụ thể lực lượng thuỷ quân của Việt Nam trải qua từng thời kỳ, có những thăng tầm biến đổi lúc thịnh, lúc suy nhưng vẫn đảm bảo thực thi chủ quyền của mình. Sách “Chủ quyền biển đảo Việt Nam xưa và nay” chứa đựng nhiều kiến thức bổ ích và quý bảo về biển đảo Việt Nam, được tác giả viết rất dễ hiểu không nhàm chán, khô khan, ngược lại rất hay và giàu tính văn học nghệ thuật. Sách đang có tại Thư viện Nguyễn Đình Chiểu tỉnh Bến Tre.', 
1, "Tên Nhà Cung Cấp:	CÔNG TY CỔ PHẦN SÁCH TRÍ THỨC VIỆT
Tác giả:	Lê Thái Dũng
NXB:	NXB Hồng Đức
Năm XB:	2020
Trọng lượng (gr):	220
Kích Thước Bao Bì:	20.5 x 13 cm
Số trang:	215
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Siêu Cường - Ba Lựa Chọn Về Vai Trò Của Hoa Kỳ Đối Với Thế Giới", "Ian Bremmer", 140000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694971592/PHOTO_LIST/Chinhtri_phapluat/009/", 
"NXB Trẻ", 
'"Siêu Cường - Ba Lựa Chọn Về Vai Trò Của Hoa Kỳ Đối Với Thế Giới"
Trong tương lai gần, Hoa Kỳ vẫn sẽ là siêu cường duy nhất trên thế giới. Nhưng đó là kiểu siêu cường như thế nào? Hoa Kỳ sẽ đóng vai trò gì trên thế giới? Và bạn muốn Hoa Kỳ đóng vai trò gì?
Trong tác phẩm Siêu cường, Ian Bremmer lập luận rằng chính sách đối ngoại thiếu định hướng của Washington vừa tốn kém lại nguy hiểm. Kể từ khi kết thúc chiến tranh lạnh, Mỹ đã sẩy chân trong nhiều cuộc khủng hoảng ở Afghanistan, Iraq, Iran, Libya, Syria và Ukraine mà không có chiến lược rõ ràng. Bremmer khuyến khích chúng ta nghĩ kĩ hơn về vai trò mà nước Mỹ nên đảm nhiệm và cách sử dụng địa vị siêu cường, với ba lựa chọn khác biệt:
Nước Mỹ độc lập: Nước Mỹ không nên nhận trách nhiệm giải quyết vấn đề của dân tộc khác mà nên lãnh đạo bằng cách nêu gương.
Nước Mỹ thực dụng: Nước Mỹ không thể giải quyết mọi thách thức quốc tế nhưng nước Mỹ có thể và nên tập trung vào các cơ hội và bảo vệ lợi ích của mình khi chúng bị đe dọa.
Nước Mỹ thiết yếu: Sự ổn định toàn cầu đang ngày càng phụ thuộc vào những giá trị mà chỉ có nước Mỹ mới bảo vệ được. Người Mỹ không bao giờ có thể sống trong hòa bình nếu các dân tộc khác bị từ chối các quyền tự do cơ bản nhất.
Có nhiều lập luận vững chắc để ủng hộ và phản đối mỗi lựa chọn, nhưng nước Mỹ cần đưa ra lựa chọn của mình.
Sách cũng giúp độc giả hiểu thêm về đường hướng của tổng thống Donald Trump trong chính sách ngoại giao và điều phối kinh tế của nước Mỹ hiện nay.', 
1, "Tên Nhà Cung Cấp:	NXB Trẻ
Tác giả:	Ian Bremmer
Người Dịch:	Phạm Trang Nhung
NXB:	NXB Trẻ
Năm XB:	2019
Trọng lượng (gr):	360
Kích Thước Bao Bì:	13 x 20.5
Số trang:	350
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Nhà Trắng - Những Chuyện Chưa Kể", "Kate Andersen Brower_ Kim Anh dịch", 125000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694971592/PHOTO_LIST/Chinhtri_phapluat/010/", 
"NXB Trẻ", 
'"Nhà Trắng - Những Chuyện Chưa Kể"
Cuốn cuốn sách về cuộc sống công tư của các gia đình tổng thống Mỹ, từ gia đình Kennedy, Clinton, đến gia đình Obama. Sách được viết dựa trên hàng trăm tiếng đồng hồ phỏng vấn các nhân viên phục vụ, hầu phòng, bếp trưởng, thợ cắm hoa, gác cửa và các nhân viên khác trong Nhà Trắng. Qua giọng kể của chính các nhân viên làm việc trong tư dinh tổng thống, sách mang đến cho người đọc cái nhìn sâu sắc về cuộc sống hàng ngày và những thách thức mà các gia đình tổng thống Mỹ phải đối mặt. Từ những khoảnh khắc thân mật trong cuộc sống hôn nhân của gia đình Kennedy, vụ lùm xùm xoay quanh Bill và Hillary Clinton, cho đến sự hiện diện lịch sử mang tính đột phá của Barack và Michelle Obama trong Nhà Trắng. Cuốn sách này không chỉ mang lại kiến thức về lịch sử Mỹ mà còn giúp người đọc hiểu rõ hơn về cuộc sống thực sự bên trong Nhà Trắng.
•    Vợ chồng Tổng thống Kennedy – từ khoảnh khắc thân mật gần gũi trong đời sống hôn nhân của họ đến quãng thời gian hỗn loạn sau ngày Tổng thống Kennedy bị ám sát.
•    Vợ chồng Tổng thống Johnson – nêu bật câu chuyện kỳ quái về nỗi ám ảnh của Tổng thống Johnson với hệ thống vòi sen trong Nhà Trắng.
•    Vợ chồng Tổng thống Nixon – kể cả sự xuất hiện bất ngờ của ông Richard Nixon trong căn bếp Nhà Trắng buổi sáng ngày ông từ chức.
•    Vợ chồng Tổng thống Reagan – từ đám cháy gây nguy hiểm cho ông Ronald Reagan ở cuối nhiệm kỳ hai của ông đến việc bà Nancy kiểm soát mọi chi tiết từ lớn đến bé trong Nhà Trắng.
•    Vợ chồng Tổng thống Clinton – cặp vợ chồng khiến các gia nhân đứng ngồi không yên với những trận cãi vã ác liệt cùng những màn chén bay đĩa bay của họ.
•    Vợ chồng Tổng thống Obama – cặp vợ chồng cùng khiêu vũ theo một bài hát của nữ ca sĩ da đen Mary J. Blige trong đêm đầu tiên dọn vào Nhà Trắng.', 
1, "Tác giả:	Kate Andersen Brower_ Kim Anh dịch
Người Dịch:	Nguyễn Thị Kim Anh
NXB:	NXB Trẻ
Năm XB:	2018
Trọng lượng (gr):	400
Kích Thước Bao Bì:	15.5 x 23 x 2
Số trang:	320
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Chuyên Đề Ôn Tập Và Luyện Thi Hóa Học 12", "Nhiều tác giả", 45000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020353/PHOTO_LIST/Giao_trinh/001/", 
"NXB Hà Nội", 
'"Chuyên đề ôn tập và luyện thi Hóa Học 12"
Cuốn sách "Chuyên đề ôn tập và luyện thi hóa học 12" sẽ cung cấp tài liệu tham khảo cần thiết cho các thầy, cô giáo và các em học sinh ôn tập để nâng cao kiến thức chất lượng kỳ thi tốt nghiệp THPT và kỳ thi tuyển sinh Đại học, Cao đẳng, đảm bảo người tốt nghiệp đạt chuẩn kiến thức, kỹ năng đã quy định cho cấp THPT...
Nội dung cuốn sách gồm 3 phần:
Phần thứ nhất: Đề thi tốt nghiệp trung học phổ thông
Phần thứ hai: Đề thi đại học, cao đẳng
Phần thứ ba: Đáp án
Phần thứ nhất với 11 đề kiểm tra và thi tốt nghiệp THPT; phần thứ hai gồm 27 đề thi đại học, cao đẳng. Cuốn sách giúp các em học sinh ôn tập kiến thức cơ bản và làm quen với các dạng bài tập, các dạng đề thi và kiểm tra.', 
1, "Nhà xuất bản: NXB Hà Nội
Nhà phát hành: Kinh Đô 2
Khối lượng: 374.00 gam
Định dạng: Bìa mềm
Kích thước: 17 x 24 cm
Ngày phát hành: 17/2024
Số trang: 280", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Super Môn Toán - Tập 1: Hình Học Không Gian 11&12", "Trần Công Diêu", 99000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020353/PHOTO_LIST/Giao_trinh/002/", 
"NXB Đại học Quốc gia Hà Nội", 
'"Super Môn Toán - Tập 1: Hình Học Không Gian 11&12"
Với mong muốn giúp học sinh yêu thích và giải quyết tốt các bài toán hình học không gian trong các đề thi tốt nghiệp và đề thi học sinh giỏi, chúng tôi xin giới thiệu đến các bạn đọc cuốn sách: Super Môn Toán - Tập 1: Hình Học Không Gian 11&12. Cuốn sách bao gồm 9 chủ đề:
Trong mỗi chủ đề các tác giả nêu ra một số các định nghĩa, định lí cơ bản trong Sách giáo khoa. Sau đó là phương pháp giải các dạng toán thường xuyên xuất hiện trong các đề thi tốt nghiệp Trung học Phổ thông. Hệ thống các bài tập từ dễ đến khó và tổng hợp tất cả các bài toán hình không gian trong các đề thi Tốt nghiệp THPT và trong các đề thi đại học gần đây.
Với nội dung súc tích, các tác giả đã cố gắng sắp xếp, lựa chọn các bài toàn tiêu biểu cho từng dạng bài toán tương ứng với các câu hỏi về hình học. Chúng tôi hi vọng cuốn sách này là một tài liệu thiết thực, bổ ích cho người dạy học và học, đặc biệt là các em học sinh yêu thích Hình học không gian và chuẩn bị thi tốt nghiệp THPT hay học sinh giỏi.', 
1, "Tác giả: Trần Công Diêu
Nhà xuất bản: NXB Đại học Quốc gia Hà Nội
Nhà phát hành: TCDBooks
Khối lượng: 600.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 23.5 x 16.5 cm
Ngày phát hành: 01/2021
Số trang: 392", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Cẩm Nang Định Hướng Đột Phá Học Tiếng Anh", "Nhiều tác giả", 200000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020353/PHOTO_LIST/Giao_trinh/003/", 
"NXB Thế Giới", 
'"Cẩm Nang Định Hướng Đột Phá Học Tiếng Anh"
Cuốn sách gồm tất cả các định hướng chiến lược cách học như thế nào,  kiến thức học tiếng Anh cấp tốc. Với hơn 2000 câu thông dụng và hơn 1000 từ mới cần thiết giao tiếp hay gặp trong cuộc sống thường nhật.
Tác giả Lê Thị Hiệp biên soạn cùng các cộng tác viên Mr. Donald Sovie, Mr. Alex Sutton, Mr. Richarch Scase, Dr. Stuart Kewley đến từ Đại học Oxford tại Vương Quốc Anh đưa ra các ý kiến nhằm hỗ trợ định hướng cho các bạn học tiếng anh con đường học phát triển ngôn ngữ. Từ đó đột phá được các học tiếng Anh tối ưu nhất. Tạo ra động lực mạnh mẽ cho người học.
Cẩm nang còn cung cấp một số kiến thức về các nước nói tiếng Anh, cách gọi tên các Tổ chức quốc tế bằng tiếng Anh, các quy đổi đo lường trên thế giới cùng các dự báo một số tình hình kinh tế, thương mại, khí hậu, y tế cùng tình hình giáo dục hiện nay.
Mục đích: Tiếp cận nhanh chóng với cách học tiếng anh bài bản, nâng cao năng lực học tiếng anh. Củng cố kiến thức trọng điểm và gia tăng hiểu biết xu hướng chung một số mảng đời sống xã hội ở thế giới. Định hướng con đường học cho các bạn đang "Nản" khi học tiếng Anh', 
1, "Tác giả: Nhiều tác giả
Nhà xuất bản: NXB Thế giới
Nhà phát hành: AIED
Khối lượng: 242.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 13 x 20 cm
Ngày phát hành: 08/09/2020
Số trang: 220", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Bộ Đề Kiểm Tra Đánh Giá Năng Lực - Môn Lịch Sử - Lớp 9", "Nguyễn Văn Ninh", 80000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020353/PHOTO_LIST/Giao_trinh/004/", 
"NXB Đại học Quốc gia Hà Nội", 
'"Bộ Đề Kiểm Tra Đánh Giá Năng Lực - Môn Lịch Sử - Lớp 9"
Cuốn sách này được biên soạn theo chương trình giáo dục phổ thông tổng thể và chuẩn kiến thức, kĩ năng của Bộ Giáo dục và Đào tạo. Sách gồm 3 phần cơ bản: Phần 1 là một số đề thi trắc nghiệm, Phần 2 là một số đề thi trắc nghiệm kết hợp với tự luận và Phần 3 là đáp án. Cuốn sách này giúp học sinh ôn tập, tự kiểm tra và đánh giá kết quả của mình, cũng như giáo viên và phụ huynh có thể sử dụng để tham khảo và hướng dẫn học sinh.', 
1, "Tác giả: Nguyễn Văn Ninh
Nhà xuất bản: Nxb Đại học Quốc gia Hà Nội
Nhà phát hành: Công Nghệ Giáo Dục VN
Khối lượng: 310.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 17 x 24 cm
Ngày phát hành: 2020
Số trang: 220", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("E-Test Luyện Đề Môn Toán - Chinh Phục Kì Thi THPT Quốc Gia", "Nguyễn Thị Lanh, 
Phan Huy Khải", 139000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020353/PHOTO_LIST/Giao_trinh/005/", 
"NXB Đại học Quốc gia Hà Nội", 
'"E-Test Luyện Đề Môn Toán - Chinh Phục Kì Thi THPT Quốc Gia"
Bộ sách E-test luyện đề - chinh phục kì thi THPT Quốc gia được biên soạn bởi Công ty Cổ phần Sách và Công nghệ Giáo dục Việt Nam - Eduking, bám sát ma trận đề thi THPT Quốc gia của Bộ Giáo dục và Đào tạo. Bộ sách gồm hai phần chính: Phần 1 là một số đề thi tham khảo và Phần 2 là đáp án. Bộ sách còn được tích hợp Ứng dụng thi thử trực tuyến theo Công nghệ 4.0 E-test, cho phép học sinh ôn luyện, làm bài thi thử miễn phí trên nền tảng website và smartphone với số lượng đề thi đa dạng và phong phú. Khi sử dụng ứng dụng, các em học sinh có thể chủ động trong việc thi thử trên máy tính và smartphone ở mọi nơi, mọi lúc với chế độ tự động chấm thi và phân tích năng lực học sinh theo từng đơn vị kiến thức.', 
1, "Tác giả: Nguyễn Thị Lanh , Phan Huy Khải
Nhà xuất bản: Nxb Đại học Quốc gia Hà Nội
Nhà phát hành: Công Nghệ Giáo Dục VN
Khối lượng: 770.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 20.5 x 29 cm
Ngày phát hành: 03/2019
Số trang: 352", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Phát Triển Năng Lực Thi Trắc Nghiệm Môn Địa Lí", "Đỗ Ngọc Tiến", 109000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020353/PHOTO_LIST/Giao_trinh/006/", 
"NXB Đại học Quốc gia Hà Nội", 
'"Phát Triển Năng Lực Thi Trắc Nghiệm Môn Địa Lí"
Cuốn sách là tài liệu tham khảo quý giá đối với giáo viên dạy bộ môn Địa lí trong việc định hướng, tổ chức học và ôn tập cho học sinh lớp 12 có trọng tâm và đạt kết quả cao.
Nội dung cuốn sách được chia làm 3 phần:
Phần 1: Lí thuyết: gồm các câu hỏi trắc nghiệm khách quan 4 lựa chọn, bám sát nội dung trọng tâm trong chương trình Địa lí lớp 11 và các bài trong sách giáo khoa Địa lí 12.
Phần 2: Thực hành
Phần 3: Một số đề thi chính thức của Bộ Giáo dục và Đào tạo', 
1, "Tác giả: Đỗ Ngọc Tiến
Nhà xuất bản: Nxb Đại học Quốc gia Hà Nội
Nhà phát hành: Công Nghệ Giáo Dục VN
Khối lượng: 440.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 19 x 27 cm
Ngày phát hành: 09/2019
Số trang: 260", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Bài Giảng Ôn Thi Theo Chủ Đề Hình Học 11", "Nhiều tác giả", 99000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020353/PHOTO_LIST/Giao_trinh/007/", 
"NXB Đại học Quốc gia Hà Nội", 
'"Bài Giảng Ôn Thi Theo Chủ Đề Hình Học 11 "
Cuốn sách này giúp học sinh học tốt môn hình học 11 và chuẩn bị tốt cho kì thi THPT quốc gia môn Toán. Cuốn sách gồm có 2 chương: Quan hệ song song và Quan hệ vuông góc trong không gian. Với lối viết khoa học, sinh động, các ví dụ được chọn lọc và sắp xếp theo thứ tự từ dễ đến khó, cuốn sách giúp các em tiếp cận môn Toán một cách nhẹ nhàng tự nhiên. Hi vọng Bài Giảng Ôn Thi Theo Chủ Đề Hình Học 11 sẽ mang lại sự tự tin để các bạn chinh phục kì thi THPT quốc gia và đạt kết quả tốt nhất.', 
1, "Tác giả: Nhiều tác giả
Nhà xuất bản: Nxb Đại học Quốc gia Hà Nội
Nhà phát hành: Sigmabooks
Khối lượng: 374.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 17 x 24 cm
Ngày phát hành: 06/2019
Số trang: 276", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Bộ Đề Minh Họa Luyện Thi THPT Quốc Gia Năm 2019 Môn Hóa Học", "Lưu Văn Dầu, 
Nguyễn Văn Luyện", 119000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020353/PHOTO_LIST/Giao_trinh/008/", 
"NXB Đại học Quốc gia Hà Nội", 
'"Bộ Đề Minh Họa Luyện Thi THPT Quốc Gia Năm 2019 Môn Hóa Học"
Căn cứ chủ trương của Bộ GD&ĐT, Công ty Cổ phần Sách và Công nghệ Giáo dục Việt Nam tổ chức biên soạn và phát hành bộ sách Bộ đề minh họa luyện thi THPT Quốc gia năm 2019 theo các môn thi. Bộ sách hướng tới 2 mục tiêu: đảm bảo yêu cầu cơ bản cho học sinh ôn luyện thi để xét tốt nghiệp THPT và cung cấp các kiến thức phân hóa cao để học sinh ôn luyện thi xét tuyển vào các trường Đại học, Cao đẳng năm 2019. Nội dung mỗi cuốn sách đã bao quát chương chình toàn cấp THPT theo các mức độ đánh giá năng lực học sinh. Hi vọng rằng với việc luyện tập thành thạo các đề thi tham khảo trong bộ sách này, các em học sinh sẽ tự trang bị và bồi dưỡng kiến thức, củng cố kỹ năng để có tâm lý vững vàng, tự tin trong kì thi THPT Quốc gia năm 2019.', 
1, "Tác giả: Lưu Văn Dầu , Nguyễn Văn Luyện
Nhà xuất bản: Nxb Đại học Quốc gia Hà Nội
Nhà phát hành: Công Nghệ Giáo Dục VN
Khối lượng: 616.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 20.5 x 29.5 cm
Ngày phát hành: 03/2019
Số trang: 308", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Hướng Dẫn Ôn Luyện Thi Vào Lớp 10 Năm 2019 Môn Lịch Sử", "Nguyễn Văn Ninh", 55000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020353/PHOTO_LIST/Giao_trinh/009/", 
"NXB Đại học Quốc gia Hà Nội", 
'"Hướng Dẫn Ôn Luyện Thi Vào Lớp 10 Năm 2019 Môn Lịch Sử"
Nội dung của mỗi cuốn sách được xây dựng bám sát chuẩn kiến thức, kĩ năng thuộc chương trình THCS hiện hành theo mức độ đánh giá năng lực học sinh và yêu cầu về phương án tổ chức kì thi vào lớp 10 năm 2019 của Bộ Giáo dục và Đào tạo. Kiến thức, đề thi ôn tập các môn Toán, Ngữ văn, Tiếng Anh, Lịch sử đảm bảo các cấp độ nhận thức: nhận biết, thông hiểu, vận dụng và vận dụng cao.', 
1, "Tác giả: Nguyễn Văn Ninh
Nhà xuất bản: Nxb Đại học Quốc gia Hà Nội
Nhà phát hành: Công Nghệ Giáo Dục VN
Khối lượng: 220.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 17 x 24 cm
Ngày phát hành: 03/2019
Số trang: 144", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Ôn Luyện Thi THPT Quốc Gia Năm 2019 Bài Thi Khoa Học Tự Nhiên", "Nhiều tác giả", 79500, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020353/PHOTO_LIST/Giao_trinh/010/", 
"NXB Đại học Quốc gia Hà Nội", 
'"Ôn Luyện Thi THPT Quốc Gia Năm 2019 Bài Thi Khoa Học Tự Nhiên"
Nội dung bộ sách bám sát yêu cầu của phương án tổ chức kì thi THPT Quốc gia năm 2019 của Bộ Giáo Dục và Đào Tạo.
Bộ sách hướng tới hai mục tiêu: đảm bảo yêu cầu cơ bản cho học sinh ôn luyện thi để xét công nhận tốt nghiệp THPT và cung cấp kiến thức phân hóa cao để học sinh ôn luyện thi xét tuyển vào Đại học, Cao đẳng năm 2019.
Nội dung của mỗi cuốn sách bao quát chương trình toàn cấp THPT theo các mức độ đánh giá năng lực học sinh. Cấu trúc mỗi cuốn gồm hai phần chính:
Phần 1: Hệ thống kiến thức và câu hỏi ôn tập theo chủ đề môn học.
Phần 2: Một số đề tham khảo và hướng dẫn thang điểm.', 
1, "Tác giả: Nhiều tác giả
Nhà xuất bản: Nxb Đại học Quốc gia Hà Nộ
Nhà phát hành: Công Nghệ Giáo Dục VN
Khối lượng: 660.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 17 x 24 cm
Ngày phát hành: 12/2018
Số trang: 484", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Cơn Lốc Quản Trị - Ba Trụ Cột Của Văn Hóa Doanh Nghiệp", "Phan Văn Trường", 105000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021586/PHOTO_LIST/Khoahoc_congnghe_kinhte/001/", 
"NXB Trẻ", 
'"Cơn Lốc Quản Trị - Ba Trụ Cột Của Văn Hóa Doanh Nghiệp"
Doanh nghiệp nào cũng có lúc gặp phải những vấn đề không nhất thiết mang tính kỹ thuật, như sự thiếu vắng động lực, hoặc tinh thần tương tác và làm việc nhóm thấp, thậm chí là mâu thuẫn giữa các thành viên, trong đó có cả các lãnh đạo cấp trung và cấp cao. Chẳng công cụ quản lý nào cho phép giải quyết được những vấn đề bắt nguồn từ sự ganh tị, đố kị, thiên vị, hoặc tệ hơn nữa là nạn bè đảng hay tham nhũng nội bộ.
Các mô hình quản lý chỉ mang lý luận kỹ thuật cục bộ hạn hẹp và những giải pháp cấu trúc có sẵn cho doanh nghiệp. Chỉ văn hóa mới có khả năng vào sâu một cách uyển chuyển các vấn đề trong mối quan hệ giữa người với người. Và đây chính là những vấn đề mà các doanh nghiệp Việt Nam thường gặp phải.
Trong tác phẩm mới nhất về văn hóa doanh nghiệp, tác giả Phan Văn Trường phát triển và đi sâu hơn nữa về chủ đề khá trừu tượng này. Vẫn giữ nguyên phong cách tiếp cận dựa trên những câu chuyện từ thực tế trải nghiệm của mình, ông dẫn dắt độc giả trên con đường tìm hiểu vai trò của văn hóa doanh nghiệp, đồng thời đi sâu giải thích ba phong cách văn hóa mà chính ông đã tiên phong áp dụng cho những doanh nghiệp mình từng tham gia quản trị.', 
1, "Tên Nhà Cung Cấp:	NXB Trẻ
Tác giả:	Phan Văn Trường
NXB:	Trẻ
Năm XB:	2023
Ngôn Ngữ:	Tiếng Trung
Trọng lượng (gr):	260
Kích Thước Bao Bì:	23 x 15.5 x 1.2 cm
Số trang:	248
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Doanh Nghiệp Của Thế Kỷ 21 (Tái Bản 2019)", "Robert T Kiyosaki, John Fleming, Kim Kiyosaki", 85000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021586/PHOTO_LIST/Khoahoc_congnghe_kinhte/002/", 
"NXB Trẻ", 
'"Doanh Nghiệp Của Thế Kỷ 21 (Tái Bản 2019)"
Một quyển sách khác của tác giả bộ sách nổi tiếng Dạy con làm giàu. Trong cuốn sách này, Robert T. Kiyosaki sẽ chỉ ra cho bạn đọc thấy lý do tại sao mình cần phải gây dựng doanh nghiệp riêng của mình và chính xác đó là doanh nghiệp gì. Nhưng đây không phải là việc thay đổi loại hình doanh nghiệp mình đang triển khai mà đó là việc thay đổi chính bản thân. Tác giả còn cho bạn đọc biết cách thức tìm kiếm những gì mình cần để phát triển doanh nghiệp hoàn hảo, nhưng để doanh nghiệp của mình phát triển thì mình cũng sẽ phải phát triển theo.', 
1, "Tên Nhà Cung Cấp:	NXB Trẻ
Tác giả:	Robert T Kiyosaki, John Fleming, Kim Kiyosaki
NXB:	NXB Trẻ
Năm XB:	2019
Trọng lượng (gr):	280
Kích Thước Bao Bì:	13 x 20.5
Số trang:	260
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Tư Duy Ngược Dịch Chuyển Thế Giới - Originals: How Non-Conformists Move The World", "Adam Grant", 142000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021586/PHOTO_LIST/Khoahoc_congnghe_kinhte/003/", 
"NXB Tổng Hợp TPHCM", 
'"Tư Duy Ngược Dịch Chuyển Thế Giới - Originals: How Non-Conformists Move The World"
Adam Grant là tác giả của cuốn sách “Give and Take” (tựa tiếng Việt là “Cho và Nhận”), được The New York Times bình chọn là sách bán chạy nhất. Trong cuốn sách này, Adam đã chỉ cho mọi người cách thức để bảo vệ thành công những ý tưởng mới, cũng như phương pháp để các nhà lãnh đạo có thể khuyến khích sự đa dạng và khác biệt trong suy nghĩ và hành động của tổ chức mình.
Với cuốn sách “Tư Duy Ngược Dịch Chuyển Thế Giới”, Adam Grant giải quyết vấn đề làm sao để cải thiện thế giới, từ góc nhìn mới “trở nên khác biệt”: Chọn đi “ngược dòng”, đấu tranh với tính tuân thủ cứng nhắc và đập tan các truyền thống lỗi thời. Qua nghiên cứu và câu chuyện trong lĩnh vực kinh doanh, chính trị, thể thao và giải trí, Grant đã khám phá ra phương pháp để nhận biết một ý tưởng hay, cách lên tiếng mà không bị cô lập, xây dựng liên minh, chọn thời điểm thích hợp để hành động, kiểm soát nỗi sợ hãi và nghi ngờ; cũng như cách thức để các bậc phụ huynh và giáo viên có thể nuôi dưỡng khả năng sáng tạo độc đáo ở trẻ; và giải pháp để các nhà lãnh đạo đấu tranh với tư duy "bầy đàn".', 
1, "Tên Nhà Cung Cấp:	FIRST NEWS
Tác giả:	Adam Grant
NXB:	NXB Tổng Hợp TPHCM
Năm XB:	2020
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	350
Kích Thước Bao Bì:	24 x 16 x 0.5 cm
Số trang:	344
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Netflix: Phá Bỏ Nguyên Tắc Để Bứt Phá - No Rules Rules: Netflix And The Culture Of Reinvention", "Reed Hastings, Erin Meyer", 198000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021586/PHOTO_LIST/Khoahoc_congnghe_kinhte/004/", 
"NXB Trẻ", 
'"Netflix: Phá Bỏ Nguyên Tắc Để Bứt Phá - No Rules Rules: Netflix And The Culture Of Reinvention"
Từ trước đến nay chưa từng có công ty nào như Netflix. Họ đã dẫn dắt cuộc cách mạng trong ngành giải trí, thu về hàng tỉ đôla doanh thu hằng năm bằng cách thu hút trí tưởng tượng của hàng trăm triệu khách hàng trên hơn 190 quốc gia.
Ra đời năm 1988 là một dịch vụ cho thuê DVD trực tuyến, nhà sáng lập Reed Hastings của Netflix đã từ bỏ những cách làm truyền thống mà nhiều công ty khác vẫn vận hành. Thay vào đó, ông xây dựng một văn hóa tập trung vào tự do và trách nhiệm, giúp Netflix tự tái tạo hết lần đến lần khác, thích nghi và đổi mới khi nhu cầu của thế giới xung quanh cũng như của các thành viên công ty thay đổi.
Hastings đặt ra những tiêu chuẩn mới, xem trọng con người hơn quy trình, nhấn mạnh đổi mới hơn hiệu quả, và trao cho nhân viên bối cảnh thay vì kiểm soát họ. Netflix không có chính sách ngày phép hay quy định công tác phí. Tại Netflix, người có kết quả làm việc bình thường nhận được gói trợ cấp thôi việc hào phóng, và làm việc chăm chỉ là không cần thiết. Tại Netflix, bạn không cần cố gắng làm hài lòng cấp trên, bạn phải đưa ra phản hồi trung thực.
Lần đầu tiên, trong tác phẩm này, Hastings và Erin Meyer, tác giả cuốn sách "The Culture Map" và là một trong những nhà tư tưởng kinh doanh có tầm ảnh hưởng lớn nhất, cùng đi sâu vào các triết lý gây tranh cãi là tâm điểm của tinh thần Netflix. Dựa trên phỏng vấn nhân viên Netflix từ khắp thế giới và những câu chuyện chưa từng được tiết lộ về sự nghiệp của Hastings, "Netflix: Phá bỏ nguyên tắc để bứt phá" (tựa gốc: No Rules Rules) là câu chuyện thú vị nhưng chưa từng được kể về một trong những công ty đột phá, sáng tạo, và thành công nhất thế giới.
Văn hóa độc đáo “Nguyên tắc là không có nguyên tắc” giải thích sự chuyển mình với tốc độ ánh sáng của một dịch vụ cho thuê DVD qua đường bưu điện thành một trong những doanh nghiệp đột phá và thành công nhất trong lịch sử: thống lĩnh thị trường phát trực tuyến toàn cầu, thách thức những công ty như Disney.
Bất cứ ai làm công việc kiến tạo, lãnh đạo, hay khát khao muốn đột phá đều muốn đọc cuốn sách này!', 
1, "Tên Nhà Cung Cấp:	NXB Trẻ
Tác giả:	Reed Hastings, Erin Meyer
Người Dịch:	Trần Thị Ngân Tuyến
NXB:	NXB Trẻ
Năm XB:	2022
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	560
Kích Thước Bao Bì:	23 x 15.5 x 1.8 cm
Số trang:	405
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Nghệ Thuật Bán Hàng Của Người Do Thái (Tái Bản 2020)", "Yaniv Zaid", 88000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021586/PHOTO_LIST/Khoahoc_congnghe_kinhte/005/", 
"NXB Tổng Hợp TPHCM", 
'"Nghệ Thuật Bán Hàng Của Người Do Thái (Tái Bản 2020)"
Nghệ thuật bán hàng của người Do Thái là một cuốn sách của tác giả Yaniv Zaid, nơi ông chia sẻ những bí quyết marketing và thương thuyết sáng tạo mà ông đã tích lũy được sau nhiều năm nghiên cứu về chủ đề thành công cũng như hoạt động trên thương trường. Được mệnh danh là “quốc gia khởi nghiệp”, Israel là nơi sản sinh ra nhiều doanh nhân thành công trong nhiều lĩnh vực và ở mọi quốc gia. Để làm được điều này, người Do Thái đã tiếp thu và thấm nhuần những triết lý và công cụ để tạo dựng uy tín, xây dựng và duy trì một cộng đồng khách hàng trung thành, thực hiện marketing sáng tạo và tối đa hóa doanh số cho công ty của mình – những phương pháp mà người Do Thái đã áp dụng từ rất lâu.
Qua những mẩu chuyện nhỏ và nhiều ví dụ thực tế trong quyển sách này, bạn đọc sẽ lần lượt tìm được câu trả lời cho những câu hỏi mà một chuyên gia marketing, một nhân viên bán hàng hay bất kỳ ai muốn nâng cao kỹ năng thương thuyết đều có thể quan tâm. Khi đọc quyển sách này, bạn sẽ thấy rằng những chân lý và triết lý thành công không nằm ở đâu xa mà hiện diện và được ứng dụng ngay trong đời sống hằng ngày.
Sâu sắc nhưng không giáo điều, hiệu quả mà vô cùng đơn giản và dễ hiểu chính là điểm khác biệt của quyển sách Nghệ thuật bán hàng của người Do Thái của tác giả Yaniv Zaid – một luật sư và nhà kinh tế học, đồng thời là diễn giả đã có hơn 1.650 bài giảng và rất nhiều hội thảo tại bốn châu lục. Quyển sách này được các tờ báo Sài Gòn Giải Phóng và Doanh Nhân Plus đánh giá cao.', 
1, "Tên Nhà Cung Cấp:	FIRST NEWS
Tác giả:	Yaniv Zaid
Người Dịch:	Ca Dao, Cẩm Xuân
NXB:	NXB Tổng Hợp TPHCM
Năm XB:	2020
Trọng lượng (gr):	200
Kích Thước Bao Bì:	20.5 x 14.5 cm
Số trang:	184
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Mishkin - Kinh Tế Học Về Tiền, Ngân Hàng Và Thị Trường Tài Chính", "Frederic S Mishkin", 888000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021586/PHOTO_LIST/Khoahoc_congnghe_kinhte/006/", 
"NXB Tài Chính", 
'"Mishkin - Kinh Tế Học Về Tiền, Ngân Hàng Và Thị Trường Tài Chính"
Những ngày gần đây, giới tài chính – đầu tư trên toàn thế giới đang hưng phấn tột bậc nhưng cũng ưu tư tột cùng khi chứng kiến mức tăng và lập đỉnh kỷ lục của đồng tiền mật mã đang được quan tâm nhất hiện nay: Bitcoin. Không chỉ bitcoin, những đồng tiền tương tự cũng đang được quan tâm và trở thành một phần trong danh mục đầu tư của hàng triệu người, thậm chí ngay cả những định chế lớn toàn cầu. Trong khi đó, tại Việt Nam những ngày này, hàng triệu cá nhân và doanh nghiệp đang theo dõi sát sao những biến động của lãi suất và hành động điều tiết chính sách tiền tệ của Ngân hàng Nước nhằm phục hồi nền kinh tế hậu đại dịch covid-19.
Vậy những đồng tiền mã hóa kia có giá trị gì mà khiến cả thế giới phải chú ý như vậy? Tại sao cứ mỗi khi nền kinh tế bất ổn hoặc có dấu hiệu suy thoái, mọi con mắt sẽ đổ dồn về phía Ngân hàng Trung ương?
Từ khóa cho những câu hỏi này có lẽ là chữ TIỀN.
Vậy, tiền là gì? Tiền từ đâu mà ra? Nó được lưu chuyển như thế nào trong nền kinh tế? Điều gì đảm bảo tiền có giá trị? Bitcoin có phải là đồng tiền của tương lai? Những câu hỏi như thế này đang được đặt ra hàng ngày, hàng giờ trên các lớp học cả nhập môn lẫn nâng cao về tài chính, tiền tệ. Và nó càng thiết thực hơn bao giờ hết trong thời điểm này.
Bắt đầu được du nhập vào Việt Nam từ những năm 1990, tác phẩm Kinh tế học về Tiền, Ngân hàng và Thị trường Tài chính của Giáo sư Frederic S. Mishkin – Nguyên Phó Chủ tịch điều hành, Cục Dự trữ Liên bang Hoa Kỳ (FED) từ lâu đã trở thành cẩm nang gối đầu giường của các sinh viên, các nhà hoạch định chính sách tài chính, tiền tệ trong nhiều năm qua. Mặc dù được sử dụng chủ yếu trong việc giảng dạy ở bậc Đại học, cuốn sách giáo khoa này có thể là một dẫn nhập cho bất cứ ai quan tâm và muốn tìm hiểu bước đầu về Tài chính, Tiền tệ, Ngân hàng.', 
1, "Nhà Cung Cấp:	Cty Văn Hóa HN
Tác giả:	Frederic S Mishkin
Người Dịch:	PGS TS Phan Trần Trung Dũng
NXB:	NXB Tài Chính
Năm XB:	2021
Trọng lượng (gr):	2027
Kích Thước Bao Bì:	25.4 x 20.3 x 3.8 cm
Số trang:	622
Hình thức:	Bìa Cứng", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Thống Kê Trong Kinh Tế Và Kinh Doanh - Statistics For Business And Economics", "David Anderson, Dennis Sweney, Thomas Williams", 470000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021586/PHOTO_LIST/Khoahoc_congnghe_kinhte/007/", 
"NXB Kinh Tế Thành Phố Hồ Chí Minh", 
'"Thống Kê Trong Kinh Tế Và Kinh Doanh - Statistics For Business And Economics"
Sách Thống kê trong Kinh Tế và Kinh Doanh cung cấp cho sinh viên, những người chủ yếu trong lĩnh vực quản trị kinh doanh và kinh tế, giới thiệu về lĩnh vực thống kê và nhiều ứng dụng của thống kê. Nội dung của cuốn sách là những ứng dụng được định hướng và được viết cho những người không chuyên về toán; và điều kiện tiên quyết về kiến thức toán học để đọc được sách này chỉ là kiến thức về đại số. Đây là một sự chuẩn bị tốt cho việc nghiên cứu các tài liệu thống kê cao cấp hơn.
SG Trading xin giới thiệu quyển sách Thống Kê Ứng Dụng Trong Kinh Tế Và Kinh Doanh, quyển sách 889 trang này được dịch từ ấn phẩm Statistics For Business And Economics của nhà xuất bản nổi tiếng Cengage Learning, góp phần cho những bạn đọc được tiếp cận với những kiến thức thống kê được các trường đại học kinh doanh hàng đầu trên thế giới giảng dạy. Nhằm nâng cao kiến thức, tư duy nguồn nhân lực chất lượng cao trong lĩnh vực thống kê, phân tích dữ liệu trong kinh doanh.
Thống kê là một trong những lợi thế của doanh nghiệp nếu biết dùng chúng và phân tích đúng trong thời kì cách mạng công nghệ 4.0. Thống kê hiện nay đang là thách thức cho tất cả các doanh nghiệp khai thác thông tin từ hàng tỉ thông tin mỗi ngày. Doanh nghiệp nào nắm được phân tích thông tin từ thống kê, doanh nghiệp đó sẽ có nhiều lợi thế hơn hết trên thương trường.
Hiện nay doanh nghiệp Việt Nam đang bỏ qua nhiều cơ hội từ dữ liệu thống kê. Những khóa đào tạo khai thác dữ liệu thống kê, phân tích dữ liệu vẫn còn ít và chưa được quan tâm. Hi vọng quyển sách sẽ là nguồn tài liệu tự học quý giá cho bạn đọc.', 
1, "Tên Nhà Cung Cấp:	Cengage
Tác giả:	David Anderson, Dennis Sweney, Thomas Williams
Người Dịch:	Hoàng Trọng
NXB:	Kinh Tế Thành Phố Hồ Chí Minh
Năm XB:	2023
Trọng lượng (gr):	1060
Kích Thước Bao Bì:	23.5 x 15.5 x 3.5 cm
Số trang:	892
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Content Bạc Tỷ (Tái Bản)", "Diệp Tiểu Ngư", 179000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021586/PHOTO_LIST/Khoahoc_congnghe_kinhte/008/", 
"NXB Công Thương", 
'"Content Bạc Tỷ (Tái Bản)"
"Content bạc tỷ" là một cuốn sách của tác giả Diệp Tiểu Ngư, trong đó ông chỉ ra cho bạn 4 bước cụ thể để xây dựng chiến dịch viết một bài quảng cáo chuyên nghiệp: “Nói những gì – Nói với ai – Nói ở đâu – Nói thế nào”. Cuốn sách này sẽ giới thiệu những bí quyết cụ thể, giúp bạn phân tích “đối tượng tán gẫu” cũng chính là nhóm người mà chúng ta gọi là “đối tượng content hướng đến”. Để giúp bạn nắm vững phương pháp triển khai nội dung và dàn bài của một bài content tốt hơn, tác giả Diệp Tiểu Ngư đã liệt kê các ví dụ trong từng phần.
"Content bạc tỷ" với nội dung thiết thực, giải thích cặn kẽ, diễn đạt khéo léo, không chỉ dành riêng cho những Copywriter mà còn cho tất cả những ai có hứng thú với việc viết content. Nếu bạn là một tân binh trong lĩnh vực Copywriting, cuốn sách này sẽ giúp bạn đi đúng đường ngay từ khi mới bắt đầu, còn nếu bạn đã kinh nghiệm, nó sẽ giúp bạn có một tư duy nhạy bén hơn trong việc viết content.', 
1, "Tên Nhà Cung Cấp:	1980 Books
Tác giả:	Diệp Tiểu Ngư
Người Dịch:	Hương Nghi
NXB:	Công Thương
Năm XB:	2022
Trọng lượng (gr):	400
Kích Thước Bao Bì:	20.5 x 13 cm x 1.9
Số trang:	384
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Boxset Textbook Services Marketing (Bộ 2 cuốn)", "Nhiều tác giả", 700000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021586/PHOTO_LIST/Khoahoc_congnghe_kinhte/009/", 
"NXB Công Thương", 
'"Boxset Textbook Services Marketing (Bộ 2 cuốn)"
Bộ sách Services Marketing gồm hai cuốn – Quản trị chiến lược marketing dịch vụ và Quản trị vận hành marketing dịch vụ. Bộ sách này được phát triển dựa trên nội dung của cuốn sách Services Marketing nổi tiếng của hai tác giả – giáo sư Jochen Wirtz và giáo sư Christopher Lovelock – vốn là kinh thánh trong quản trị dịch vụ trên toàn thế giới, được dùng làm tài liệu giảng dạy tại các trường kinh doanh hàng đầu và đã được tái bản đến lần thứ 9.
Quyển một trong bộ sách này là Quản trị chiến lược marketing dịch vụ. Quyển sách miêu tả cụ thể về ngành dịch vụ cũng như các chiến lược marketing dịch vụ. Nối tiếp quyển Quản trị chiến lược marketing dịch vụ, quyển Quản trị vận hành marketing dịch vụ hướng dẫn chi tiết về khía cạnh marketing vận hành, từ quản trị tương tác khách hàng, cân bằng nhu cầu và công suất, cho đến việc xây dựng văn hóa dịch vụ xuất sắc thông qua các phương thức cải thiện chất lượng dịch vụ và năng suất.
Tóm lại, bộ sách này đặt các vấn đề về marketing trong bối cảnh chung khái quát dưới góc nhìn quản trị. Bộ sách cung cấp là một “hộp công cụ” được thiết kế và biên soạn tỉ mỉ dành cho các nhà quản trị ngành dịch vụ. Người đọc sẽ tìm hiểu cách sử dụng các khái niệm, lý thuyết và mô hình một cách tốt nhất để phân tích và giải quyết những thách thức đa dạng mà các nhà quản trị kinh doanh dịch vụ đang phải đối mặt.', 
1, "Tên Nhà Cung Cấp:	Saigon Books
Tác giả:	Nhiều Tác Giả
NXB:	Công Thương
Năm XB:	2023
Trọng lượng (gr):	1690
Kích Thước Bao Bì:	27.5 x 20.5 x 3 cm
Số trang:	652
Hình thức:	Bộ Hộp", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Tiktok Marketing", "Markus Rach", 139000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021586/PHOTO_LIST/Khoahoc_congnghe_kinhte/010/", 
"NXB Thanh Niên", 
'"Tiktok Marketing"
Đây là một cuốn sách của tác giả Markus Rach, trong đó ông trả lời những câu hỏi của các nhà marketing khi nghĩ về TikTok, gợi ý những cách thức khả thi mà các thương hiệu có thể tận dụng tối đa TikTok. Nhiều thương hiệu kết hợp việc điều hành các kênh riêng của họ và làm việc với những người có ảnh hưởng để truyền bá nội dung đến đối tượng rộng hơn. Các thương hiệu cũng có thể thực hiện chiến dịch TikTok marketing của mình bằng cách khuyến khích các thử thách kèm hashtag trên TikTok.
Tác giả Markus Rach đã chia sẻ những kinh nghiệm và học hỏi từ thử nghiệm trên TikTok, giúp người đọc hiểu được cách thức và xu thế marketing mới, mở rộng kiến thức về nền tảng TikTok. Nó sẽ dạy cho bạn những nguyên tắc cơ bản của nền tảng này. Vai trò của một nhà marketing phải biết những thay đổi của môi trường kiến tạo. Chúng ta cần hiểu sự tương tác của công nghệ và xã hội. Chúng ta cần hiểu công nghệ tác động đến hành vi của khách hàng như thế nào và tất nhiên, chúng ta cần điều chỉnh tương tác thị trường thương hiệu của mình như thế nào sao cho vẫn phù hợp. Cho cả hiện tại và tương lai!
Nếu muốn tìm hiểu về marketing trên TikTok, “TikTok marketing” vẫn là cuốn sách dành cho bạn. Bạn có thể mua sách này qua các trang web sách trực tuyến.', 
1, "Tên Nhà Cung Cấp:	1980 Books
Tác giả:	Markus Rach
Người Dịch:	1980Books
NXB:	NXB Thanh Niên
Năm XB:	2020
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	300
Kích Thước Bao Bì:	20 x 13 cm x 1.3
Số trang:	268
Hình thức:	Bìa Mềm", 100);
-- Phần bạn Huy thêm dữ liệu vào Book 


-- Thêm dữ liệu vào bảng Cart
INSERT INTO Cart(account_id) VALUES (3), (4);

-- Thêm dữ liệu vào bảng CartItem
INSERT INTO CartItem(quantity, cart_id, book_id) VALUES (2, 1, 1);
INSERT INTO CartItem(quantity, cart_id, book_id) VALUES (2, 1, 2);
INSERT INTO CartItem(quantity, cart_id, book_id) VALUES (2, 1, 3);
INSERT INTO CartItem(quantity, cart_id, book_id) VALUES (2, 1, 4);
INSERT INTO CartItem(quantity, cart_id, book_id) VALUES (2, 1, 5);
