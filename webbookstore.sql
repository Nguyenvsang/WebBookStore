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
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Chiến Binh Cầu Vồng (Tái Bản 2020)", "Andrea Hirata", 109000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695025933/PHOTO_LIST/Sach_truyen_tieuthuyet/001/", 
"NXB Hội Nhà Văn", 
'"Chiến Binh Cầu Vồng (Tái Bản 2020)"
“Thầy Harfan và cô Mus nghèo khổ đã mang đến cho tôi tuổi thơ đẹp nhất, tình bạn đẹp nhất, và tâm hồn phong phú, một thứ gì đó vô giá, thậm chí còn có giá trị hơn những khao khát mơ ước. Có thể tôi lầm, nhưng theo ý tôi, đây thật sự là hơi thở của giáo dục và linh hồn của một chốn được gọi là trường học.” - (Trích tác phẩm)
Trong ngày khai giảng, nhờ sự xuất hiện vào phút chót của cậu bé thiểu năng trí tuệ Harun, trường Muhammadiyah may mắn thoát khỏi nguy cơ đóng cửa. Nhưng ước mơ dạy và học trong ngôi trường Hồi giáo ấy liệu sẽ đi về đâu, khi ngôi trường xập xệ dường như sẵn sàng sụp xuống bất cứ lúc nào, khi lời đe dọa đóng cửa từ viên thanh tra giáo dục luôn lơ lửng trên đầu, khi những cỗ máy xúc hung dữ đang chực chờ xới tung ngôi trường để dò mạch thiếc…? Và liệu niềm đam mê học tập của những Chiến binh Cầu vồng đó có đủ sức chinh phục quãng đường ngày ngày đạp xe bốn mươi cây số, rồi đầm cá sấu lúc nhúc bọn ăn thịt người, chưa kể sự mê hoặc từ những chuyến phiêu lưu chết người theo tiếng gọi của ngài pháp sư bí ẩn trên đảo Hải Tặc, cùng sức cám dỗ khôn cưỡng từ những đồng tiền còm kiếm được nhờ công việc cu li toàn thời gian ...?
Chiến binh Cầu vồng có cả tình yêu trong sáng tuổi học trò lẫn những trò đùa tinh quái, cả nước mắt lẫn tiếng cười – một bức tranh chân thực về hố sâu ngăn cách giàu nghèo, một tác phẩm văn học cảm động truyền tải sâu sắc nhất ý nghĩa đích thực của việc làm thầy, việc làm trò và việc học.
Tác phẩm đã bán được trên năm triệu bản, được dịch ra 26 thứ tiếng, là một trong những đại diện xuất sắc nhất của  văn học Indonesia hiện đại.', 
1, "Tên Nhà Cung Cấp:	Nhã Nam
Tác giả:	Andrea Hirata
Người Dịch:	Dạ Thảo
NXB:	NXB Hội Nhà Văn
Năm XB:	2020
Trọng lượng (gr):	450
Kích Thước Bao Bì:	20.5 x 14 cm
Số trang:	428
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Chú Bé Mang Pyjama Sọc (Tái Bản)", "John Boyne", 79000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695025933/PHOTO_LIST/Sach_truyen_tieuthuyet/002/", 
"NXB Hội Nhà Văn", 
'"Chú Bé Mang Pyjama Sọc (Tái Bản)"
Rất khó miêu tả câu chuyện về Chú bé mang pyjama sọc này. Thường thì chúng tôi vẫn tiết lộ vài chi tiết về cuốn sách trên bìa, nhưng trong trường hợp này chúng tôi nghĩ làm như vậy sẽ làm hỏng cảm giác đọc của bạn. Chúng tôi nghĩ điều quan trọng là bạn nên đọc mà không biết trước nó kể về điều gì.
Nếu bạn định bắt đầu đọc cuốn sách thật, bạn sẽ cùng được trải qua một hành trình với một cậu bé chín tuổi tên là Bruno (dù đây không hẳn là sách cho trẻ chín tuổi). Và chẳng sớm thì muộn bạn sẽ cùng Bruno đến một hàng rào. Những hàng rào như vậy vẫn tồn tại ở khắp nơi trên thế giới. Chúng tôi hy vọng không ai trong chúng ta phải vượt qua một hàng rào như vậy trong đời.', 
1, "Tên Nhà Cung Cấp:	Nhã Nam
Tác giả:	John Boyne
Người Dịch:	Lê Nguyễn Lê
NXB:	Hội Nhà Văn
Năm XB:	2023
Trọng lượng (gr):	280
Kích Thước Bao Bì:	20.5 x 13 cm
Số trang:	253
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Một Cuốn Sách Trầm Cảm", "macmart", 106000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695025933/PHOTO_LIST/Sach_truyen_tieuthuyet/003/", 
"NXB Thanh Niên", 
'"Một Cuốn Sách Trầm Cảm"
“Ở nơi đây mình không bán nụ cười
mình chỉ bán nước mắt và buồn hiu
ở nơi đây mình không bán tình yêu
chỉ có cô liêu và những ngày quạnh quẽ.”
Một cuốn sách trầm cảm hay còn có tên Một cuốn sách của macmart là quyển tản văn và thơ bộc bạch những tâm tư, cảm xúc của một người trẻ, một trái tim non dại, một tâm hồn chênh vênh, khắc khoải, đớn đau khi phải đối mặt với hiện thực cuộc sống từ những ngày biết tự ý thức cho đến những bước chân tập tễnh đầu tiên trên hành trình tự trưởng thành, mà chắc hẳn ai cũng từng một lần cảm thấy.
Bắt đầu bằng những câu chuyện kể, những lời độc thoại cô đơn với chính mình, nhưng rồi sự xuất hiện của gia đình, bạn bè, của những người xa lạ đã mang đến cho “đứa trẻ” muôn vàn cảm xúc khác biệt. Có thể là chút hy vọng nhỏ nhoi, cũng có thể là nỗi đau tột cùng hay sự thất vọng ngập tràn, tuy nhiên dường như bấy giờ tâm trạng của nhân vật đã không còn đơn độc. Từ đó, có sự xuất hiện của những biến đổi trong cảm xúc, trong chính con người thật của “đứa trẻ” ấy. Và cuối cùng là niềm hi vọng được nhìn thấy ánh sáng tích cực, chút niềm tin về cuộc sống bé nhỏ như một bông hoa mọc ra trên vách đá mà tác giả gửi gắm.', 
1, "Tên Nhà Cung Cấp:	AZ Việt Nam
Tác giả:	macmart
NXB:	Thanh Niên
Năm XB:	2022
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	250
Kích Thước Bao Bì:	19 x 13 cm
Số trang:	208
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Lời Tiên Tri Celestine", "James Redfield", 248000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695025933/PHOTO_LIST/Sach_truyen_tieuthuyet/004/", 
"NXB Dân Trí", 
'"Lời Tiên Tri Celestine"
“Lời tiên tri Celestine” của tác giả James Redfield là một cuốn sách đặc biệt về tâm linh, mang đến sự khai sáng thông qua những cuộc gặp gỡ định mệnh và sự kiện không ngờ tới. Câu chuyện xoay quanh hành trình của nhân vật chính tìm kiếm một bản cổ thư tại Peru, qua đó khám phá ra những Sự Khai sáng về cuộc sống và con người.
Mỗi Sự Khai sáng trong bản cổ thư mang lại những nhận thức mới về ý nghĩa thực sự của cuộc sống. Qua những trăn trở nội tâm và nguy hiểm rình rập, nhân vật chính đã gặp gỡ những người bạn hữu duyên và từng bước khám phá ra thông điệp sâu sắc từ những sự kiện ngẫu nhiên trong cuộc đời mình.
Cuốn sách không chỉ là một trải nghiệm tâm linh thú vị mà còn là một lời nhắc nhở về việc duy trì sự thức tỉnh bên trong, hướng đến một cuộc sống có mức rung động năng lượng cao hơn, nơi con người có thể tìm thấy nguồn cảm hứng và sáng tạo vô tận.
“Lời tiên tri Celestine” đã trở thành hiện tượng xuất bản với hàng chục triệu bản được bán ra, được dịch ra 34 thứ tiếng và nằm trong danh sách sách bán chạy nhất của tờ New York Times trong ba năm liền. Nó cũng là nguồn cảm hứng cho album ca nhạc của Christopher Franke và đã được chuyển thể thành phim vào năm 2006.', 
1, "Tên Nhà Cung Cấp:	FIRST NEWS
Tác giả:	James Redfield
Người Dịch:	Trần Tuyết
NXB:	Dân Trí
Năm XB:	2022
Trọng lượng (gr):	550
Kích Thước Bao Bì:	20.5 x 14.5 cm
Số trang:	532
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Thằng Nớ Con Nhà Ai?", "Trương Điện Thắng", 100000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695025933/PHOTO_LIST/Sach_truyen_tieuthuyet/005/", 
"NXB Hội Nhà Văn", 
'"Thằng Nớ Con Nhà Ai?"
Nỗi ám ảnh tuy mang tên chung Thằng nớ con nhà ai?, nhưng cũng là “Tôi con nhà ai, chúng ta con nhà ai?” trong mối quan hệ và va đập của văn hóa làng xã. Và rộng ra, nỗi ám ảnh ấy cứ như tra khảo ta từng ngày, khuôn định lối sống, cách ứng xử từ của mỗi cá thể đến mỗi cộng đồng. Nhờ vậy, con người sẽ bị tha hóa chậm đi trong cơn lốc của vật chất và thời đại.
Điều rất rõ là, đời sống đô thị khiến mỗi cá thể trở nên vô danh, càng ngày càng vô danh, do đó anh tha hồ đánh mất danh dự, lòng tự trọng, nhân phẩm. Còn ở nơi thôn dã, con người được minh định về nhân thân trong mỗi liên kết huyết thống, tộc họ, làng xóm. Trong thiết chế đó, anh không dám “làm bậy”! Mà lỡ anh sai sót, anh có thể có cơ hội kịp phản tỉnh và điều chỉnh vì anh luôn biết tự vấn mình là ai.
Một nhà văn Nga, Solzenitsin từng nhắc lại một câu tục ngữ của quê hương ông trong diễn từ Nobel 1972, đại ý rằng: Hãy tin vào mắt bạn, dù đôi mắt đó bị lé! Tập truyện của tôi đa phần hình thành từ những trải nghiệm của bản thân mình ở một làng quê, vì vậy tôi tin nó sẽ được đón nhận và đối xử như một đóng góp mang tính riêng rẽ vào dòng chảy văn chương hôm nay!', 
1, "Tên Nhà Cung Cấp:	Saigon Books
Tác giả:	Trương Điện Thắng
NXB:	NXB Hội Nhà Văn
Năm XB:	2017
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	200
Kích Thước Bao Bì:	20.5 x 13 x 0.5 cm
Số trang:	186
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Thám Tử Hoang Dã", "Roberto Bolaño", 390000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695025933/PHOTO_LIST/Sach_truyen_tieuthuyet/006/", 
"NXB Hội Nhà Văn", 
'"Thám Tử Hoang Dã"
Đây là chuyện về các thám tử. Những thám tử kiêm nhà thơ, truy tìm dấu vết một người mất tích – một nhà thơ khác. Một cuộc truy tìm trải suốt nhiều năm, diễn ra khắp ba châu lục nhưng trước hết là Mỹ la tinh, miền đất mênh mông của vô vàn phức tạp, nhộn nhạo, bạo tàn và đẹp, với hầu như mọi thứ trên đời: đế quốc, cách mạng, độc tài, loạn lạc, rượu, ma túy, cảnh sát, mại dâm, tội phạm, nhà thơ. Nhà thơ, một nòi lạ, ngu ngơ, rồ dại, đẹp, nảy nòi một cách khó hiểu và hữu cơ trên bối cảnh tạp nham đầy bất trắc này, và, xuyên suốt câu chuyện dài, ngồn ngộn chi tiết và cảm xúc, tán xạ qua hàng chục giọng khác nhau, hai nhà thơ đơn độc đi tìm nhà thơ đơn độc thứ ba, như hành trình tìm lại một thành viên của cái bộ tộc hiếm gồm những kẻ yêu cái đẹp và đau đời đó, hầu khôi phục một mảnh nhỏ của bộ tộc ấy.

“Hiện hữu một cách đầy tính thơ trong thời hiện đại là một cách hiện hữu hiểm nghèo,” Bolaño nói. Thám tử hoang dã là câu chuyện về sự hiện hữu hiểm nghèo, ngây ngô, hoang dại, nực cười của nhà thơ, một giống nòi ngày càng lạc lõng giữa thế giới hiện đại. Là khúc tụng ca ngời chói và bi tráng, có lẽ là cuối cùng, về các nhà thơ.

Roberto Bolaño (1953-2003) nhà văn kiệt xuất người Chile, tác giả nhiều tiểu thuyết, truyện ngắn và tiểu luận văn chương. Năm 1999 ông đoạt giải thưởng Rómulo Gallegos cho tiểu thuyết Thám tử hoang dã, và năm 2008 ông được truy tặng Giải thưởng Hội Phê bình sách Toàn quốc (National Book Critics Circle Award) của Hoa Kỳ cho tiểu thuyết 2666.

Thời báo New York gọi Bolaño là “tiếng nói văn chương Mỹ la tinh quan trọng nhất trong thế hệ của ông”.', 
1, "Tên Nhà Cung Cấp:	Nhã Nam
Tác giả:	Roberto Bolaño
Người Dịch:	Trần Tiễn Cao Đăng
NXB:	Hội Nhà Văn
Năm XB:	2023
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	930
Kích Thước Bao Bì:	25 x 17 x 3 cm
Số trang:	585
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Hãy Là Tất Cả, Hoặc Không Là Gì", "Xu", 149000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695025933/PHOTO_LIST/Sach_truyen_tieuthuyet/007/", 
"NXB Thế Giới", 
'"Hãy Là Tất Cả, Hoặc Không Là Gì"
Nếu tuổi trẻ của bạn là vô vàn thương tích, nhưng bạn vẫn chẳng biết cách để trở nên cứng cỏi, can trường.
Nếu bạn luôn than trách cuộc đời bất công, trong khi bản thân chỉ nghĩ về những ước mơ chứ chưa từng nỗ lực.
Bạn đi qua những hoang mang, ngờ vực như thế bằng sự non nớt, không dám vượt thoát khỏi vùng an toàn, không dám nghĩ đến ngày mai. Nhưng bạn biết không:
Tuổi trẻ đáng tiếc nhất không phải thử rồi sai.
Tuổi trẻ đáng tiếc nhất là phải nói hai chữ “giá như” vì chưa từng dám thử.
Nếu bạn đang có một ngày chênh vênh như thế, hãy để “HÃY LÀ TẤT CẢ, HOẶC KHÔNG LÀ GÌ” ở bên, tiếp thêm dũng khí để bạn đối diện với cuộc đời không bằng phẳng. Cầm cuốn sách trên tay, bạn sẽ hiểu: hành trình tuổi trẻ dù có chông gai đến đâu cũng không thể cản bạn đi tới tương lai rực rỡ.
Chúng ta chỉ có duy nhất cuộc đời này để sống. Nên hãy sống đến mức tốt nhất có thể: Mua những món đồ đẹp đẽ và giá trị nhất; Yêu một người xinh xắn và xứng đáng nhất; Theo đuổi một ước mơ kỳ vĩ và phi thường nhất; Ngẩng đầu làm một người thành thật và hiên ngang nhất…
Trở thành tất cả những gì bản thân có thể, thay vì an phận tựa một hạt cát vô danh.', 
1, "Tên Nhà Cung Cấp:	Công Ty Cổ Phần Time Books
Tác giả:	| Xu |
NXB:	Thế Giới
Năm XB:	2023
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	360
Kích Thước Bao Bì:	20.5 x 14.5 x 1.7 cm
Số trang:	348
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Tủ Sách Nobel Văn Chương Tao Đàn - Người Mẹ", "Grazia Deledda", 180000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695025933/PHOTO_LIST/Sach_truyen_tieuthuyet/008/", 
"NXB Hội Nhà Văn", 
'"Tủ Sách Nobel Văn Chương Tao Đàn - Người Mẹ"
VỊ CHA XỨ trẻ tuổi được giáo dân kính trọng, sẽ phải làm gì khi một bên là người mẹ đã hy sinh tất cả chỉ mong con trai trở thành linh mục, còn bên kia là Agnese, cô gái mà anh say đắm? Mối tình cấm kỵ ấy đã đẩy anh vào thế lưỡng nan. Một mặt, anh trân quý những rung động của tình yêu. Mặt khác, anh bị giày vò trong niềm sợ hãi sẽ bị ô nhục và nỗi ăn năn vì trót phụ lòng đấng sinh thành. Người Mẹ - cuốn tiểu thuyết thành công nhất của Grazia Deledda là những giằng xé nội tâm của Paolo trong cuộc chiến dai dẳng giữa bổn phận và ái tình, đạo hiếu và nhục cảm. Trong suốt hành trình ấy, người mẹ đau khổ đã luôn ở bên anh, như tiếng gọi thức tỉnh của lương tri, ngõ hầu cứu rỗi vị linh mục trẻ khỏi những “tội lỗi trần gian”.', 
1, "Tên Nhà Cung Cấp:	Cty Sách Tao Đàn
Tác giả:	Grazia Deledda
Người Dịch:	Trần Thị Khánh Vân
NXB:	Hội Nhà Văn
Năm XB:	2023
Trọng lượng (gr):	243
Kích Thước Bao Bì:	20.5 x 14 x 1.1 cm
Số trang:	207
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Vô Thường (Tái Bản)", "Nguyễn Bảo Trung", 140000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695025933/PHOTO_LIST/Sach_truyen_tieuthuyet/009/", 
"NXB Dân Trí", 
'“Sống chậm lại, yêu thương nhiều hơn”
Đây là cuốn sách của bác sĩ Nguyễn Bảo Trung, một người làm việc tại phòng cấp cứu. Qua những câu chuyện về bệnh nhân sắp qua đời, tác giả muốn gửi gắm thông điệp về sự vô thường của cuộc sống và khuyến khích mọi người sống có ý nghĩa hơn. Cuốn sách khuyên chúng ta nên sống chậm lại, đón nhận sóng gió với tâm thế hứng khởi, an nhiên hơn. Những câu chuyện trong sách đã chạm đến trái tim của người đọc, khiến họ nhận ra rằng hạnh phúc là những điều thật bình dị, cuộc đời rất ngắn ngủi nên hãy bao dung, sống chan hòa và vui vẻ. Khi hiểu được tất cả mọi thứ trên đời này đều là vô thường, con người sẽ tự động tránh xa những thú vui tạm bợ để tìm thấy giá trị chân thật, hạnh phúc đơn giản từ những điều bé nhỏ xung quanh mình.', 
1, "Tác giả:	Nguyễn Bảo Trung
NXB:	Dân Trí
Năm XB:	2022
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	250
Kích Thước Bao Bì:	19 x 12 cm
Số trang:	232
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Con Nhân Mã Ở Trong Vườn", "Moarcy Scilar", 209000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695025933/PHOTO_LIST/Sach_truyen_tieuthuyet/010/", 
"NXB Văn Học", 
'"Con Nhân Mã Ở Trong Vườn"
Có hai loại hạnh phúc ở trên đời. Hạnh phúc được hơn người khác và hạnh phúc được như người khác. Dạng hạnh phúc thứ hai giản dị hơn nhưng đôi khi lại xa vời hơn. Bạn đọc đang cầm trong tay một cuốn tiểu thuyết lớn, đủ sức khám phá những ngóc ngách kì bí của niềm hạnh phúc này.
Được xuất bản lần đầu năm 1985, Con nhân mã ở trong vườn nhanh chóng nổi tiếng toàn thế giới, và được đánh giá như một trong những tác phẩm vĩ đại nhất của văn học Do Thái. Tác phẩm được kể bằng ngôi thứ nhất, về một chàng trai tên Guedali trót ra đời với nửa thân hình người, nửa thân hình ngựa. Giữa một gia đình nghèo khó, giữa một xã hội người nhập cư nhiều định kiến, Nhân mã Guedali phải tự thích nghi với cuộc đời lạc loài, đấu tranh với những hắt hủi, và rồi vẫn phải tìm cách sống, đau khổ hay tỏa sáng theo thân phận riêng của mình. Tuy nhiên, đau đáu trong lòng anh là câu hỏi, là ước mơ có thể được sống như người khác, phải sống như thế nào? Chấp nhận hay không chấp nhận? Làm nhân mã hay làm người thường?
Cuộc đời lạc lõng của nhân mã trong thế giới của những người bình thường, với gia đình, với tình yêu, tuyệt vọng và những hạnh phúc riêng biệt, đã chinh phục độc giả toàn thế giới và làm nên tên tuổi của nhà văn người Brazil Moacyr Scliar. Ông là bậc thầy của những câu chuyện đầy tính ẩn dụ về bản chất con người bằng thứ ngôn ngữ uyên nguyên độc đáo, đầy mộng mơ và huyền ảo Mỹ Latin. Linh Lan Books hân hạnh giới thiệu bản dịch mới của tác phẩm này. Rốt cuộc hồn ma đó là ai, có liên quan gì tới cái chết của bố mẹ cô? Tại sao hết lần này tới lần khác đều xuất hiện trước lưỡi hái tử thần, dang đôi tay đổi cho cô một mạng?
Đây là câu chuyện muôn thưở cực kỳ hấp dẫn về mối mâu thuẫn giữa cá nhân và xã hội, giữa bản ngã cá thể và luật chơi bầy đoàn. Nếu bạn đã nhiều lúc phải giấu diếm dẹp bỏ những cái độc đáo khác biệt của mình để có được sự chấp nhận của mọi người, và thường khắc khoải về chuyện đó, thì "Con nhân mã ở trong vườn" chắc chắn là câu chuyện tâm đắc của bạn.', 
1, "Tác giả:	Moarcy Scilar
Người Dịch:	Nhật Phi
NXB:	Văn Học
Năm XB:	2022
Trọng lượng (gr):	450
Kích Thước Bao Bì:	20.5 x 14 x 2 cm
Số trang:	396
Hình thức:	Bìa Mềm", 100);
-- Phần bạn Huy thêm dữ liệu vào Book 
-- TÂM LÝ, TÂM LINH, TÔN GIÁO
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Being Buddha At Work - Ứng Dụng Giáo Lý Đức Phật Ở Chốn Công Sở Để Đạt Đến An Lạc Và Trí Tuệ", "Franz Metcalf  
BJ Gallagher", 119000, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027037/PHOTO_LIST/Tamly_Tamlinh_Tongiao/001/", 
"NXB Hồng Đức", 
'"Being Buddha At Work - Ứng Dụng Giáo Lý Đức Phật Ở Chốn Công Sở Để Đạt Đến An Lạc Và Trí Tuệ"
Cuốn sách “Being Buddha at Work” của tác giả BJ Gallagher và Franz Metcalf giới thiệu cách áp dụng triết lý Phật giáo vào công việc để giải quyết căng thẳng và lo lắng. Cuốn sách được chia thành 3 phần chính: Chương 1 đề cập đến trí tuệ của Đức Phật cho công việc của chúng ta, Chương 2 tập trung vào cách làm việc của người khác, và Chương 3 đề cập đến các chủ đề tổ chức rộng lớn hơn. Cuốn sách này cho thấy cách thức hiện diện tâm trí Phật trong sự căng thẳng và ồn ào của nơi làm việc, giúp chúng ta giảm bớt căng thẳng hàng ngày và đón nhận thử thách với sự thức tỉnh, bình tĩnh và hài hước.', 1, "Nhà xuất bản: NXB Hồng Đức
Ngày xuất bản: 31/12/2022
Nhà phát hành: Bizbooks
Kích thước: 14.0 x 20.5 x 2.0 cm
Số trang: 112 trang
Trọng lượng: 200 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Một Pháp", "Joseph Goldstein", 109500, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027077/PHOTO_LIST/Tamly_Tamlinh_Tongiao/002/", 
"NXB Hà Nội", 
'"Một Pháp"
Joseph Goldstein là một trong những giáo viên vipassana đầu tiên của Mỹ, đồng sáng lập Hiệp hội Thiền Minh Quán (IMS) cùng với Jack Kornfield và Sharon Salzberg, tác giả đương đại của nhiều cuốn sách nổi tiếng về Phật giáo, giáo viên hướng dẫn cư trú tại IMS và lãnh đạo các khóa tu trên toàn thế giới về thiền tu chánh niệm (vipassana) và từ bi (metta)1. Thay vì bám chặt vào một truyền thống duy nhất, ông đã học với rất nhiều vị thầy, kết nối các phương diện khác nhau của nhiều truyền thống Phật giáo vào sự thực hành của mình. Sự thực hành Phật giáo bao gồm những thành phần căn bản như sự thực hành chú niệm, tâm từ, tâm bi, không dính mắc và trí tuệ. Những chủ đề chung này là những gì mà Joseph đã tập trung trong quyển sách có tựa đề "Một Pháp".', 1, "Nhà xuất bản: NXB Hà Nội
Ngày xuất bản: 31/08/2022
Nhà phát hành: Thái Hà
Kích thước: 15.0 x 23.0 x 2.0 cm
Số trang: 288 trang
Trọng lượng: 180 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Sự Tỉnh Thức Của Loài Gấu", "Ajahn Brahm", 91500, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027106/PHOTO_LIST/Tamly_Tamlinh_Tongiao/003/", 
"NXB Hồng Đức", 
'"Sự Tỉnh Thức Của Loài Gấu"
Trong bất kỳ cuốn sách nào trình bày về giáo lý của Đức Phật, rõ ràng trọng tâm là lời giáo huấn, nhưng vẫn còn nhiều thắc mắc ngoài những gì được nói ra. Sự tỉnh thức của loài gấu tập hợp những câu hỏi và trả lời ở các khóa thiền do Ajahn Brahm chủ trì ở Trung tâm Jhana Grove, Australia, từ 2010 đến 2013.
Ajahn Brahm được biết đến rộng rãi và yêu thích không chỉ bởi nội dung các bài giảng mà còn nhờ phong cách truyền đạt và óc khôi hài. Những câu chuyện vui “kỳ cục” của ông giúp người đọc thư thái và mở lòng với một quan điểm nhân ái và từ bi hơn, nhưng mục đích chính trong mọi câu chuyện là giải quyết những vấn đề đang cản trở chúng ta trên con đường giác ngộ.
Đọc cuốn sách này, bạn hãy tưởng tượng mình đang ở trong thiền đường với Ajahn Brahm, đã dành ngày hôm đó để thiền định, và ông đang nói với chính bạn.', 1, "Nhà xuất bản: NXB Hồng Đức
Ngày xuất bản: 30/11/2018
Nhà phát hành: Văn Lang
Kích thước: 13.5 x 21.0 x 1.4 cm
Số trang: 278 trang
Trọng lượng: 450 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Tin Hiểu Nhân Quả", "Thích Hoằng Trí", 49000, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027128/PHOTO_LIST/Tamly_Tamlinh_Tongiao/004/", 
"NXB Hà Nội", 
'"Tin Hiểu Nhân Quả"
Nhân quả là định luật khách quan và phổ biến, chi phối tất cả mọi sự vật hiện tượng từ thế giới vật lý đến thế giới tâm lý. Quy luật nhân quả không chỉ ảnh hưởng đến một cá nhân nào đó trước mắt mà nó còn liên hệ chằng chịt đến vạn vật trong vũ trụ và cộng hưởng bởi nghiệp thức chung của toàn nhân loại. Trong cuốn sách “Tin hiểu nhân quả”, tác giả sẽ lý giải thấu đáo sự vận hành của nhân quả như một định luật khách quan, không mê tín, không thiên kiến, cũng như cách áp dụng nhân quả vào đời sống thực tiễn thường ngày để chúng ta tránh được những rủi ro làm tổn hại thân tâm.', 1, "Nhà xuất bản: NXB Hà Nội
Ngày xuất bản: 06/02/2020
Nhà phát hành: Thái Hà
Kích thước: 13.0 x 19.0 x 2.0 cm
Số trang: 152 trang
Trọng lượng: 176 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Trái Tim Không", "Phan Việt", 50000, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027154/PHOTO_LIST/Tamly_Tamlinh_Tongiao/005/", 
"NXB Hội Nhà Văn", 
'"Trái Tim Không"
"Mùa mưa, tôi tác ý sẽ nhập định 3 ngày 3 đêm để tri ân Tam Bảo.
Một tháng trước khi nhập định, tôi bắt đầu nhịn ăn. Lúc đầu, tôi chỉ uống nước quả cả ngày. Sau đó chỉ uống nước lọc. Từ ngày nhập định thì dừng tất cả. Tôi bắt đầu nhập định như thường lệ bằng quan sát và nhận biết hơi thở. Rồi hơi thở trở nên vi tế, không nhận biết được hơi thở nữa. Chỉ còn cái biết thuần khiết. Tiếp đó thì không biết gì nữa. Giống như tôi đã biến mất trogn 3 ngày. Trong thời gian này, người từ Bangkok và nhiều nơi đến xem. Khi tôi bất động 3 ngày 3 đêm, nhiều người khóc. Họ nghĩ tôi đã chết. Khi tôi xuất định, họ cũng khóc. Nhưng đây là sự thật. Định chỉ là Định. Định không phải Niết Bàn. Định nghĩa là vẫn trong luân hồi. Vẫn khổ. Niết Bàn không phải là không biết cái gì cả. Thấu triệt hoàn toàn nhưng không dính mắc với bất kỳ cái gì.
Tâm hoàn toàn rõ. Sáng. Tự do."', 1, "Nhà xuất bản: NXB Hội Nhà Văn
Ngày xuất bản: 01/11/2021
Nhà phát hành: Nhã Nam
Kích thước: 14.5 x 20.5 x 2.0 cm
Số trang: 324 trang
Trọng lượng: 600 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Trái Tim KhôngBản Ngã - Thấu Hiểu Và Tan Biến", "David R Hawkins", 109500, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027172/PHOTO_LIST/Tamly_Tamlinh_Tongiao/006/", 
"NXB Lao Động", 
'"Bản Ngã - Thấu Hiểu Và Tan Biến"
Cuốn sách “Bản Ngã – Thấu hiểu và tan biến” của tác giả David R. Hawkins là một hành trình đi tìm cái tôi chân thực, phá vỡ mọi ảo ảnh và ngụy biện sai lệch để ánh sáng thực tại và hạnh phúc chiếu rọi. Cuốn sách tập hợp những thông điệp truyền cảm hướng từ các tác phẩm nổi tiếng của Tiến sĩ David R. Hawkins, từ đó người đọc được nhắc nhở về bản chất ảo tưởng của cái tôi cá nhân và những con đường trực tiếp để vượt thoát những cạm bẫy của bản ngã/tâm trí.', 1, "Nhà xuất bản: NXB Lao Động
Ngày xuất bản: 30/06/2021
Nhà phát hành: 1980 Books
Kích thước: 13.0 x 20.0 x 1.0 cm
Số trang: 204 trang
Trọng lượng: 500 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Kính Sợ Và Run Rẩy (Tái bản 2023)", "Soren Kierkegaard", 167400, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027189/PHOTO_LIST/Tamly_Tamlinh_Tongiao/007/", 
"NXB Hồng Đức", 
'"Kính Sợ Và Run Rẩy (Tái bản 2023)"
Kính sợ và Run rẩy là tác phẩm có nhiều ảnh hưởng nhất trong thần học và triết lý, văn chương của thế kỷ 19 và 20. Soren Kierkegaard đã bắt một cây cầu suy tưởng nối văn chương, thần học và triết học. Đây cũng là tác phẩm độc đáo, hay nhất và gây tranh cãi nhất của ông; gây kinh ngạc đối với độc giả phổ thông và cả giới nghiên cứu chuyên sâu.
“Bản dịch này – có lẽ là lần đầu tiên của một tác phẩm quan trọng của Kierkegaard sang tiếng Việt – nhuần nhị, say mê không chỉ trong văn phong mà cả trong sự thâm cảm của dịch giả với tác phẩm, bất chấp bao ngăn cách” – Dịch giả Bùi Văn Nam Sơn.
Tác giả Soren Kierkegaard là triết gia vĩ đại người Đan Mạch; được xem là ông tổ của Chủ nghĩa Hiện sinh. Các tác phẩm tiêu biểu của ông: Kính sợ và Run rẩy (1843), Lặp lại (1843), Những mảnh vụn triết học (1844), Những chặng đường đời (1845)…', 1, "Nhà xuất bản: NXB Hồng Đức
Ngày xuất bản: 15/07/2023
Nhà phát hành: PhanBook
Kích thước: 13.0 x 20.5 x 1.5 cm
Số trang: 312 trang
Trọng lượng: 500 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Minh Triết Phương Tây", "Bertrand Russell", 234000, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027208/PHOTO_LIST/Tamly_Tamlinh_Tongiao/008/", 
"NXB Đà Nẵng", 
'"Minh Triết Phương Tây"
Bertrand Arthur William Russell, 3rd Earl Russell (1872-1970) là một triết gia, nhà Logic học, toán học, sử gia và nhà phê phán xã hội người Anh. Ông khởi xướng phong trào “phản-lý tưởng” đầu thế kỷ XX và được coi như một trong những người đặt nền tảng cho học thuyết Triết lý Phân tích. Ông cũng được vinh danh như nhà Lôgic hàng đầu ở thế kỷ XX. Công trình khoa học của B. Russell ảnh hưởng đến sự triển khai của nhiều ngành như Logic, Toán, Lý thuyết Tập hợp, Vi tính, Triết học, và đặc biệt nhất là Ngôn ngữ học dưới góc độ Triết giải, Nhận thức luận và Siêu hình học.
Russell còn là một người phản chiến nổi tiếng và từng tù tội vì tranh đấu cho hòa bình vào thời Thế chiến I. Sau đó, ông bài bác Adolf Hitler, phê phán chế độ toàn trị Stalinist và kết tội nước Mỹ đã tiến hành chiến tranh Việt Nam1. Năm 1950, Russell được trao Giải thưởng Nobel Văn học vì “đã viết những điều có ý nghĩa phục vụ những lý tưởng nhân bản và quyền tự do tư duy”.
Mặc dù có nhiều nhận xét tích cực về công trình của Russell, có lẽ đáng nhớ nhất vẫn là tóm lược của chính Russell về đời sống và công trình của mình. Ông kể: “Ba đam mê, giản đơn nhưng cực kỳ mạnh mẽ đã chi phối đời tôi, là sự khao khát tình yêu, cuộc truy lùng tri thức, và niềm thương xót những nỗi đau thương của loài người… Đó đã là đời tôi, tôi vẫn thấy đáng sống” (1967).', 1, "Nhà xuất bản: NXB Đà Nẵng
Ngày xuất bản: 09/10/2020
Nhà phát hành: Domino Books
Kích thước: 14.0 x 20.5 x 2.5 cm
Số trang: 512 trang
Trọng lượng: 720 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Tư Duy Như Một Triết Gia", "Sophie Boizard, Laurent Audouin", 25500, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027250/PHOTO_LIST/Tamly_Tamlinh_Tongiao/009/", 
"NXB Kim Đồng", 
'"Tư Duy Như Một Triết Gia"
Cùng hai “triết gia” nhí của cuốn sách này khám phá 37 câu nói nổi tiếng của các triết gia tên tuổi, được giải thích bằng những câu chuyện thú vị với những hình ảnh minh họa sinh động.
Không giống như những tuyển tập danh ngôn khác, cuốn sách này giúp bạn hiểu được những tư tưởng chính yêú  của các triết gia lớn: về con người và con vật, về cái ác và cái thiện, về thời gian, hạnh phúc và rất nhiều đề tài khác.', 1, "Nhà xuất bản: NXB Kim Đồng
Ngày xuất bản: 06/05/2016
Nhà phát hành: NXB Kim Đồng
Kích thước: 14.5 x 20.5 cm
Số trang: 70 trang
Trọng lượng: 200 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Nghệ Thuật Sống", "Epictetus", 45500, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027291/PHOTO_LIST/Tamly_Tamlinh_Tongiao/010/", 
"NXB Hồng Đức", 
'"Nghệ Thuật Sống"
Epictetus là một triết gia người Hy Lạp, được xem là “Thầy của các vị thầy” và có sự hấp dẫn lâu bền và ảnh hưởng rộng khắp. Ông diễn đạt thông điệp của mình một cách rõ ràng và nồng nhiệt, gửi đến tất cả những ai quan tâm đến việc sống một cuộc đời tỉnh thức về đạo đức. Epictetus vững tin vào sự tất yếu của việc rèn luyện để dần dần tinh lọc tính cách và hạnh kiểm cá nhân.
Epictetus ra đời như là một nô lệ vào khoảng năm 55 sau Công nguyên tại Hierapolis, Phrygia, phía Đông của Đế quốc La Mã. Chủ của ông là Epaphroditus, Bí thư hành chánh của Nero. Từ khi còn rất nhỏ Epictetus đã biểu lộ một tài năng xuất chúng về tri thức; và Epaphroditus quá bị ấn tượng, đến nỗi ông gửi chàng trai trẻ đến La Mã để học với vị thầy Khắc kỷ chủ nghĩa nổi tiếng, Gaius Musonius Rufus. Epictetus trở thành môn đệ nổi tiếng nhất của Rufus, và sau cùng được giải phóng khỏi tình trạng nô lệ.', 1, "Nhà xuất bản: NXB Hồng Đức
Ngày xuất bản: 16/12/2016
Nhà phát hành: Khai Tâm
Kích thước: 13.0 x 20.0 x 0.8 cm
Số trang: 136 trang
Trọng lượng: 300 gram", 100);

-- THIẾU NHI
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Xứ Sở Miên Man - Tặng Kèm Bookmark", "Jun Phạm", 187000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027915/PHOTO_LIST/Thieu_nhi/001/", 
"NXB Phụ Nữ Việt Nam", 
'"Xứ Sở Miên Man"
Đây là một cuốn sách của Jun Phạm, kể về cuộc sống của ông Thảo và bé Mì Gói, đứa con gái nhỏ được ông nhận nuôi tại Tiệm cắt tóc Tân Kỳ. Cuốn sách mở ra trước mắt bạn đọc bức tranh đối lập trong cuộc sống bình dị của hai nhân vật. Mỗi ngày trôi qua, ông Thảo luôn cảm thấy mệt mỏi vì cơm áo gạo tiền, ông bị cuốn vào cuộc chiến với một con quái vật mang tên Cuối Tháng. Còn Mì Gói thì lúc nào cũng có hàng tá câu hỏi hoang đường về các nàng tiên và những bức vẽ về vùng đất “Minamun” do cô bé tự tạo ra. Sau cuộc cãi vã với ông Thảo, bé Mì Gói bị bắt đến xứ Xứ sở miên man kỳ ảo và cuộc hành trình đi giải cứu Mì Gói đầy điều bất ngờ của ông Thảo và chú Tò he chính thức bắt đầu. Cuốn sách chứa đựng những góc nhìn sâu sắc về cuộc sống của Jun Phạm qua lăng kính đầy màu sắc trẻ thơ trong nhân vật bé Mì Gói.', 1, "Nhà xuất bản: NXB Phụ Nữ Việt Nam
Ngày xuất bản: 20/07/2023
Nhà phát hành: SkyBooks
Kích thước: 14.5 x 20.5 x 1.3 cm
Số trang: 264 trang
Trọng lượng: 430 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Du Kí Vòng Quanh Nước Ý - Ngàn Kì Quan", "Geronimo Stilton", 140000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027927/PHOTO_LIST/Thieu_nhi/002/", 
"NXB Kim Đồng", 
'"Du Kí Vòng Quanh Nước Ý - Ngàn Kì Quan"
Các bạn đọc Gặm Nhấm thân mến,
Hãy cài dây an toàn và chuẩn bị sẵn sàng nào: một chuyến đi tuyệt diệu đang chờ đón chúng ta. Lên đường cùng chúng tôi nhé!
Đấy là một buổi sáng mùa hạ đẹp trời, tôi - Geronimo Stilton - đang ngồi trên máy bay, sẵn sàng cho một kì nghỉ thư thái với gia đình. Nhưng… đấy không hẳn là một kì nghỉ, mà còn là khởi đầu của một chuyến đi đáng nhớ vô cùng! Mời các bạn cùng tham gia vào chuyến phiêu lưu kì thú băng qua các vùng đất và tìm hiểu nền văn hoá của nước Ý: Một đất nước của NGÀN KÌ QUAN!', 1, "Độ Tuổi	7+
Tên Nhà Cung Cấp:	Nhà Xuất Bản Kim Đồng
Tác giả:	Geronimo Stilton
Người Dịch:	Phương Nga
NXB:	Kim Đồng
Năm XB:	2023
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	240
Kích Thước Bao Bì:	20.5 x 14.5 x 1 cm
Số trang: 224
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Mẹ Con Sư Tử", "Thích Nhất Hạnh", 125000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027932/PHOTO_LIST/Thieu_nhi/003/", 
"NXB Phụ Nữ", 
'"Mẹ Con Sư Tử"
“Sư tử mẹ nhìn sư tử con mỉm cười. Nó nhảy qua bên kia bờ suối đi vào rừng thì sư tử con cũng mỉm cười, nhảy theo mẹ, vượt qua suối vào rừng. Sư tử con biết rằng, nó không phải là khỉ, nó là sư tử. Từ đó hai mẹ con được đoàn tụ hạnh phúc”…
Câu chuyện giản dị, gần gũi được Sư Ông THÍCH NHẤT HẠNH kể lại như một ngụ ngôn giàu hàm nghĩa, khơi nguồn những điều thiện hảo trong tâm hồn.
Hãy là chú sư tử mạnh mẽ trong đời.
Về Thiền sư THÍCH NHẤT HẠNH
“Thích Nhất Hạnh là một trong những tiếng nói quan trọng nhất của thời đại chúng ta. Hơn bao giờ hết, đây là lúc chúng ta cần lắng nghe vị thầy này.” – Sogyal Rinpoche.', 1, "Tên Nhà Cung Cấp:	Phanbook
Tác giả:	Thích Nhất Hạnh, Hùng Lê
NXB:	Phụ Nữ Việt Nam
Năm XB:	2022
Trọng lượng (gr):	475
Kích Thước Bao Bì:	26 x 19 x 1 cm
Số trang:	37
Hình thức:	Bìa Cứng", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Chuyện Kể Về Chàng Bơ Bị Lãng Quên", "Tấn Nguyễn Toàn", 51000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027944/PHOTO_LIST/Thieu_nhi/004/", 
"NXB Kim Đồng", 
'"Chuyện Kể Về Chàng Bơ Bị Lãng Quên"
Các em đã từng được nghe nhắc tới chàng Bơ chưa? Vào một ngày mùa xuân, chàng Bơ lau sạch đôi giày, xỏ chân vào, buộc dây giày lại. Chàng buộc dây giày làm sao để nó không lê thê trên đất, không bò ra mọi phía như những con giun, để không bị vấp chân vào đó. Rồi Bơ lên đường.
Chuyến chu du khắp thiên hạ của Bơ có rất nhiều điều thú vị. Chàng tới nhiều nơi và dừng chân ở nhiều ngôi làng. Nhưng đâu mới là nơi Bơ ở lại? Và vì sao chàng chọn nơi đó là điểm dừng chân cuối cùng?
Mời các em cùng đọc truyện để biết câu trả lời nhé!', 1, "Tên Nhà Cung Cấp:	Nhà Xuất Bản Kim Đồng
Tác giả:	Tấn Nguyễn, Toàn
NXB:	Kim Đồng
Năm XB:	2023
Trọng lượng (gr):	100
Kích Thước Bao Bì:	23 x 20 cm
Số trang:	64
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Nghé Ọ Hai Xoáy", "Phạm Anh Xuân", 55000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027959/PHOTO_LIST/Thieu_nhi/005/", 
"NXB Văn Học", 
'“Nghé ọ Hai Xoáy” 
Tác giả Phạm Anh Xuân đã kể về cuộc sống của những đứa trẻ nơi làng quê, sự hòa nhập cùng thiên nhiên và các trò chơi dân gian. Nhân vật chính trong truyện là Hùng, một cậu bé có ước mơ và khát vọng học tập. Cuốn sách đưa người đọc trở về với làng quê thân thương, nơi có tình cảm xóm làng chân thành, có những đứa trẻ chăn trâu cắt cỏ hòa mình cùng thiên nhiên thanh bình, với những trò chơi của những đứa trẻ hồn nhiên trong sáng. Cuốn sách phù hợp với mọi lứa tuổi và giúp người đọc hiểu và thêm yêu cuộc sống vùng nông thôn hơn.', 1, "Tên Nhà Cung Cấp:	Tân Việt
Tác giả:	Phạm Anh Xuân
NXB:	Văn Học
Năm XB:	2022
Trọng lượng (gr):	150
Kích Thước Bao Bì:	20.5 x 13.5 cm x 0.8
Số trang:	124
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Gerda - Câu Chuyện Cá Voi", "Peter Kavecký, Adrián Macho", 139000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027991/PHOTO_LIST/Thieu_nhi/006/", 
"NXB Thanh Niên", 
'“Gerda - Câu Chuyện Cá Voi” 
Đây là một câu chuyện đầy cảm động về ước mơ, niềm tin và khát vọng của cá voi nhỏ Gerda. Tuổi thơ hạnh phúc của Gerda đột nhiên kết thúc bởi một biến cố bất ngờ. Bị bỏ lại một mình, không gia đình ở bên, cô lang thang khắp đại dương và trải qua nhiều ngọt bùi cay đắng, để rồi đến cuối hành trình cô tìm được một chốn đầy yêu thương gọi là nhà. Cuốn sách được minh hoạ bởi Adrián Macho, tác giả sách thiếu nhi bán chạy hàng đầu ở Slovakia (Đông Âu), và mang bài học về sức mạnh niềm tin và khát vọng cũng như thông điệp bảo vệ môi trường. Từ 2018 đến nay, “Gerda - Câu Chuyện Cá Voi” đã được dịch ra 16 thứ tiếng và được trẻ em trên toàn thế giới yêu thích.', 1, "Tác giả: Peter Kavecký , Adrián Macho
Nhà xuất bản: NXB Thanh Niên
Nhà phát hành: SAN HÔ
Mã Sản phẩm: 8935333710130Giấy phép XB: -QĐ/NXB ThN
Khối lượng: 400.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 20.5 x 26 cm
Ngày phát hành: 2022
Số trang: 40", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Vũ Trụ Qua Lăng Kính Số", "Paul Rockett", 169000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695028006/PHOTO_LIST/Thieu_nhi/007/", 
"NXB Thể giới", 
'"Vũ Trụ Qua Lăng Kính Số"
Đây là một cuốn sách đầy thông minh! Nhờ những hình ảnh minh họa đầy màu sắc và sinh động trong cuốn sách này mà những dãy số khổng lồ khô khan trở nên thật dễ hình dung và lý thú.
Thông qua cuốn sách này, các bạn nhỏ sẽ được tiếp cận với các loại biểu đồ cột, biểu đồ tròn, bảng biểu và hình họa. Khiến việc học tập và nghiên cứu số liệu trở nên hấp dẫn hơn. Đúng như cái tên của mình, “Vũ trụ qua lăng kính số” đem đến lượng tri thức đồ sộ trong mọi lĩnh vực, từ động vật, thực vật, vũ trụ cho tới thể thao, kinh tế, kiến trúc, ...Chỉ với cuốn sách tuyệt vời này, các bạn nhỏ sẽ học được biết bao điều kỳ diệu!', 1, "Tác giả: Paul Rockett
Người dịch: Hà My
Nhà xuất bản: Nxb Thế giới
Nhà phát hành: Nhã Nam
Khối lượng: 1000.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa cứng
Kích thước: 26 x 20.5 cm
Ngày phát hành: 2021
Số trang: 112", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Lần Đầu Tớ Đi Máy Bay", "Shu chong Wen hua", 20000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695028020/PHOTO_LIST/Thieu_nhi/008/", 
"NXB Kim Đồng", 
'"Lần Đầu Tớ Đi Máy Bay"
Những trải nghiệm đầu tiên với bé luôn đi kèm những thắc mắc, tò mò. Cha mẹ hãy cùng con đọc bộ sách này để giúp bé đỡ bỡ ngỡ và trở nên tự tin hơn trước những trải nghiệm đầu đời nhé! Chắc chắn bé sẽ thấy mọi điều trong cuộc sống của chúng ta đều rất thú vị, dù đôi khi cũng có những rắc rối nho nhỏ.
Mời bạn đón đọc.', 1, "Tác giả: Shu chong Wen hua
Người dịch: Sâu Ong
Nhà xuất bản: NXB Kim Đồng
Nhà phát hành: NXB Kim Đồng
Khối lượng: 66.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 17.5 x 20.5 cm
Ngày phát hành: 06/2018
Số trang: 24", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Ngủ Ngon Bé Yêu - Đừng Sợ Bóng Tối", "Maike Xiao Kui", 30000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695028037/PHOTO_LIST/Thieu_nhi/009/", 
"NXB Kim Đồng", 
'"Ngủ Ngon Bé Yêu - Đừng Sợ Bóng Tối"
Những câu chuyện ấm áp trước giờ đi ngủ trò chuyện cùng bé về ý nghĩa của tình yêu thương, sự sẻ chia, lòng dũng cảm... đặc biệt là những kĩ năng sống cần thiết: cách đối diện với nỗi sợ, có được mở cửa cho người lạ không, hay làm thế nào để chăm sóc vật nuôi đúng cách...
Bộ sách xinh xắn này là món quà tặng đáng yêu nhất mà cha mẹ có thể mang tới cho các bé nhà mình vào mỗi tối trước khi đi ngủ. Hãy cùng bé yêu của bạn đọc những câu chuyện ấm áp yêu thương và vui vẻ này để bé đi vào giấc ngủ dễ dàng và ngon lành hơn nhé!
Sách dành cho các bé 2-6 tuổi và rất phù hợp để cha mẹ cùng đọc với con.
Mời bạn đón đọc.', 1, "Tác giả: Maike Xiao Kui
Người dịch: Hoàng Phương Thúy
Nhà xuất bản: NXB Kim Đồng
Nhà phát hành: NXB Kim Đồng
Khối lượng: 110.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 18 x 23 cm
Ngày phát hành: 05/2018
Số trang: 36", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Bộ Kỹ Năng Ứng Xử - Trò Đùa Của Chuồn Chuồn", "Võ Mạnh Hảo", 32000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695028058/PHOTO_LIST/Thieu_nhi/010/", 
"NXB Tổng hợp TP.HCM", 
'"Bộ Kỹ Năng Ứng Xử - Trò Đùa Của Chuồn Chuồn"
Bộ sách này giúp trẻ em học cách ứng xử trong các tình huống thường ngày một cách tự nhiên và nhẹ nhàng thông qua những câu chuyện vừa cổ tích, vừa hiện đại. Bộ sách gồm 5 cuốn, mỗi cuốn là một tập hợp riêng của 5 cây bút viết về thiếu nhi quen thuộc: Hồ Huy Sơn, Võ Thu Hương, Trương Quỳnh Như Trân, Nguyễn Thị Kim Hòa, Võ Mạnh Hảo. Những câu chuyện dễ thương và gần gũi từ mỗi trang sách sẽ giúp trẻ làm quen với cách ứng xử trong các tình huống thường ngày. Từ đó, trẻ sẽ biết cách phân biệt đúng sai, hiểu được tại sao nên làm thế này mà không nên làm thế khác. Không những thế, qua bộ sách này các bé học được cách đọc hiểu và biết kể lại những câu chuyện xảy ra trong cuộc sống hằng ngày. Từ đó, nuôi dưỡng tình yêu sách và khơi gợi năng khiếu văn học ở trẻ.', 1, "Tác giả: Võ Mạnh Hảo
Nhà xuất bản: Nxb Tổng hợp TP.HCM
Nhà phát hành: Trí Việt
Khối lượng: 132.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 18.5 x 18.5 cm
Ngày phát hành: 03/2017
Số trang: 56", 100);

-- VĂN HỌC NGHỆ THUẬT
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Biên Niên Ký Sao Hỏa", "Ray Bradbury", 165000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695031040/PHOTO_LIST/Van_hoc_nghe_thuat/001/", 
"NXB Văn Học", 
'“Biên niên ký Sao Hỏa”
Đây là một cuốn sách của tác giả Ray Bradbury, được dịch bởi Lê Hồng Vân và xuất bản bởi Văn Học vào năm 2023. Dẫu được tôn vinh vào hàng kinh điển trong dòng sách khoa học viễn tưởng, khoa học lại mờ nhạt đến gần như vắng bóng trong cuốn sách này. Sao Hỏa, trong trí tưởng tượng của Bradbury những năm bốn mươi của thế kỷ hai mươi, không có gì giống với hành tinh lạnh lẽo khô khốc chúng ta biết tới ngày nay. Đó là một nơi có bầu khí quyển gần như Trái Đất, sinh sống một giống loài thông minh khá giống loài người. Đó là xứ sở của những rặng núi xanh lam, của những dòng kênh xanh lục, của những cây cột pha lê, của lớp bụi mờ phủ lên những thành phố tráng lệ đã chết. Sao Hỏa của Bradbury là một chốn của hy vọng, của ảo mộng và của ẩn dụ. Chính ở nơi đây, những kẻ xâm lược Trái Đất đã đến, tháo chạy khỏi một thế giới không tương lai đến một miền đất hứa, một giấc mơ Mỹ thứ hai. Người Trái Đất tràn lên Sao Hỏa, để rồi bị chính Sao Hỏa ru ngủ trong những tiện nghi thân quen lọc lừa, rù quến trong ánh hào quang còn sót lại của chủng loài bản địa cổ xưa đầy bí hiểm. Cuốn tiểu thuyết chắp nối từ những truyện ngắn về Sao Hỏa này khiến ta ngộp thở trước vẻ đẹp của nó và trăn trở trước những vấn đề nó đặt ra về bản chất loài người.', 1, "Tên Nhà Cung Cấp:	Nhã Nam
Tác giả	Ray Bradbury
Người Dịch:	Lê Hồng Vân
NXB:	Văn Học
Năm XB:	2023
Trọng lượng (gr):	600
Kích Thước Bao Bì:	20.5 x 14 x 2 cm
Số trang:	402
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Kafka Bên Bờ Biển (Tái Bản 2020)", "Haruki Murakami", 158000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695031055/PHOTO_LIST/Van_hoc_nghe_thuat/002/", 
"NXB Văn Học", 
'“Kafka bên bờ biển”
Đây là một cuốn sách của tác giả Haruki Murakami. Cuốn sách có hai câu chuyện song song, một kể về cậu bé Kafka Tamura, một kể về lão già Nakata. Kafka Tamura luôn có một bản ngã là Quạ theo bên cạnh. Cậu bé mười lăm tuổi này sống với cha sau khi mẹ và chị gái bỏ đi. Cậu luôn bị một lời nguyền của cha ám ảnh: mày sẽ ngủ với mẹ và chị gái mày sau khi giết cha. Kinh sợ, Kafka bỏ nhà ra đi. Cậu chìm đắm trong một thư viện sách khổng lồ ở Takamatsu. Rồi những chuyện bí ẩn xảy ra, cậu gặp cô gái Sakura và bà Miss Saeki, những người mà cậu luôn băn khoăn không biết có phải là chị và mẹ mình. Bố Kafka bị giết, và cậu nghĩ, không biết có phải lời nguyền đã ứng? Trong khi đó, ở bên kia bờ biển, ông già Nakata cũng có một cuộc hành trình đến Takamatsu. Bị một tai nạn từ nhỏ, Nakata mất trí nhớ và khả năng đọc, viết; tuy nhiên bù lại ông có thể giao tiếp với loài mèo. Vì thế ông nhận sứ mệnh đi tìm con quỷ giết mèo hàng loạt, tìm một phiến đá bí ẩn… Kỳ lạ, bí ẩn, pha trộn với hiện đại, Kafka bên bờ biển khiến cho mọi con đường văn học, mọi cách tiếp cận văn học đều bàng hoàng, choáng ngợp.', 1, "Tên Nhà Cung Cấp:	Nhã Nam
Tác giả:	Haruki Murakami
Người Dịch:	Dương Tường
NXB:	NXB Văn Học
Năm XB:	2020
Trọng lượng (gr):	550
Kích Thước Bao Bì:	15.5 x 24 cm x 2.6
Số trang:	539
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Vương Triều Tudor Cuối Cùng", "Philippa Gregory", 220000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695031072/PHOTO_LIST/Van_hoc_nghe_thuat/003/", 
"NXB Văn Hóa - Nghệ Thuật", 
'"Vương Triều Tudor Cuối Cùng"
Vương triều Tudor cuối cùng được Philippa Gregory cấu trúc thành ba phần theo ba tuyến nhân vật chính – ba chị em gái nhà Tudor. Đó là Jane Grey, Cửu Nhật Nữ vương (The Nine Day Queen), người còn được xưng tụng như một Thánh nữ Tử vì Đạo; là Katherine Grey, cô em gái xinh đẹp, kiêu kỳ và nổi loạn; và cô em út Mary Grey, người có hình thể nhỏ nhắn và khiếm khuyết nhưng ẩn chứa bên trong một bản lĩnh và ý chí vô cùng mạnh mẽ và thuần khiết.
Ma thuật ngòi bút của Philippa sẽ khiến bạn lập tức thấy mình là nhân vật chính chỉ sau vài trang sách. Bạn sẽ bước vào một cuộc hành trình ngược dòng lịch sử đến nước Anh thời Tudor thế kỷ XVI đầy biến động với những mưu đồ đen tối, những cuộc thanh trừng đẫm máu, những con buôn chính trị sừng sỏ, những cuộc tình vụng trộm, những kiêu hãnh và định kiến, vài hạnh phúc hiếm hoi cùng nỗi thống khổ triền miên và sự hối tiếc. Có những lúc bạn nghe cảm xúc trào dâng trước một tình yêu nguyên sơ, đẹp đẽ; có những khi bạn chìm trong giận dữ đến cùng cực của lòng thù hận trước những toan tính tàn nhẫn và bạn chỉ muốn đạp tung tất cả, từ gông cùm của đoạn đầu đài cho đến những quy tắc hoàng gia, những luật lệ bất thành văn khắc nghiệt còn sót lại từ đêm trường Trung cổ.', 1, "Tên Nhà Cung Cấp:	Saigon Books
Tác giả:	Philippa Gregory
Người Dịch:	Vương Bảo Long
NXB:	NXB Văn hóa - Văn nghệ
Năm XB:	2019
Trọng lượng (gr):	620
Kích Thước Bao Bì:	16 x 24 x 2.9
Số trang:	604
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Hai Vạn Dặm Dưới Đáy Biển", "Jules Verne", 83000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695031087/PHOTO_LIST/Van_hoc_nghe_thuat/004/", 
"NXB Văn Học", 
'“Hai vạn dặm dưới đáy biển” 
Đây là một tiểu thuyết khoa học viễn tưởng kinh điển của nhà văn người Pháp Jules Verne, xuất bản vào năm 1870. Câu chuyện kể về Thuyền trưởng Nê-mô, một người thù ghét đất liền và con tàu ngầm Nau-ti-lux có một không hai của ông ta, từ quan điểm của giáo sư A-rô-nắc. Trong một chuyến đi khảo sát sinh vật biển bí ẩn trên chiếc tàu Lin-côn, giáo sư A-rô-nắc, trợ lý Công-xây và chàng thợ đánh bắt cá voi cừ khôi Nét Len, tất cả bị rơi khỏi tàu và vô tình bị bắt vào tàu ngầm Nau-ti-lux của thuyền trưởng Nê-mô. Từ đây họ bắt đầu một hành trình khám phá thế giới đại dương huyền ảo với thuyền trưởng Nê-Mô và các thủy thủ trên tàu Nau-ti-lux. Chiếc tàu Nau-ti-lux được xây dựng bí mật và đi lang thang khắp vùng biển không có bất kỳ chính phủ nào. Động lực của thuyền trưởng Nê-mô ngụ ý là sự khát khao về tri thức khoa học và là mong muốn nền văn minh vượt bậc. Nê-mô giải thích rằng tàu ngầm của ông được cung cấp điện và có thể thực hiện nghiên cứu sinh học biển tiên tiến; ông cũng nói với hành khách mới của mình rằng mặc dù ông đánh giá cao cuộc trò chuyện với một chuyên gia như A-rô-nắc, duy trì sự bí mật của sự tồn tại của ông và con tàu nên ông không bao giờ để chúng để lại.', 1, "Tên Nhà Cung Cấp:	Cty Văn Hóa Minh Lâm
Tác giả:	Jules Verne
NXB:	Văn Học
Năm XB:	2015
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	352
Kích Thước Bao Bì:	20.5 x 13.5 x 1.7 cm
Số trang:	411
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Hiệu Sách Cuối Cùng Ở London - Tiểu Thuyết Về Chiến Tranh Thế Giới Thứ Hai", "Madeline Martin", 180000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695031126/PHOTO_LIST/Van_hoc_nghe_thuat/005/", 
"NXB Văn Học", 
'“Hiệu sách cuối cùng ở London” 
Đây là một cuốn tiểu thuyết tình cảm hấp dẫn của tác giả Madeline Martin, được dịch bởi Phương Hạ và xuất bản bởi Văn Học vào năm 2022. Cuốn sách ghi lại quãng thời gian khó khăn của người dân London trong Chiến tranh Thế giới thứ Hai và được truyền cảm hứng từ quá khứ có thật của số ít hiệu sách còn tồn tại sau cuộc oanh kích của Đức quốc xã. Cuốn sách kể lại một câu chuyện về những mất mát của thời chiến, về tình yêu và sức mạnh của văn chương giúp con người ta vượt qua giai đoạn đen tối nhất. Cuốn sách đưa bạn quay trở lại thời điểm tháng 8 năm 1939, lúc ấy người dân London đang ráo riết chuẩn bị cho chiến tranh khi lực lượng của Hitler tràn qua châu Âu. Người hùng trong cuốn sách, Grace Bennett, là một cô gái luôn ấp ủ mong ước được chuyển đến London sinh sống. Khi cô cùng người bạn thân Viv đặt chân đến đây thì chiến tranh sắp sửa nổ ra. Hai cô gái đến sống cùng người bạn thân nhất của mẹ Grace, bà Weatherford, và cậu con trai của bà. Sau đó, Grace được giới thiệu tới làm việc tại hiệu sách Đồi Primrose. Trong quãng thời gian Grace làm việc tại hiệu sách Đồi Primrose, chiến tranh đã nổ ra. Đức quốc xã cho ném bom khắp thành phố London, phá hủy biết bao tòa nhà và cướp đi mạng sống của hàng nghìn người. Nhưng nhờ được làm việc trong hiệu sách và được truyền cảm hứng từ những người cô gặp nơi đây, Grace dần yêu thích sách hơn, và đồng thời cô đem tình yêu sách đó lan tỏa tới mọi người. Trải qua những đợt giới nghiêm, những đêm mưa bom bão đạn triền miên, cô đã khám phá ra sức mạnh của việc gắn kết cộng đồng thông qua việc đọc sách – một sức mạnh chiến thắng ngay cả trong những đêm đen tối nhất của cuộc chiến.', 1, "Tên Nhà Cung Cấp:	Tân Việt
Tác giả:	Madeline Martin
Người Dịch:	Phương Hạ
NXB:	Văn Học
Năm XB:	2022
Trọng lượng (gr):	400
Kích Thước Bao Bì:	20.5 x 14.5 x 1.3 cm
Số trang:	402
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Chuyên Gia Hóa Học - The Chemist", "Stephenie Meyer", 270000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695032189/PHOTO_LIST/Van_hoc_nghe_thuat/006/", 
"NXB Trẻ", 
'"Chuyên Gia Hóa Học - The Chemist"
Cô từng làm việc cho chính phủ Mỹ. Là chuyên gia trong lĩnh vực của mình, cô thuộc về vùng bí mật đen tối nhất của một cơ quan cũng bí mật đến nỗi không hề có tên. Và rồi, không một lời cảnh báo, tổ chức ráo riết săn lùng cô. Kể từ đây, cô bắt đầu hành trình của những dịch chuyển.
Giờ thì vị sếp cũ đề nghị được mở đường thoát cho cô: công việc cuối cùng để đổi lấy tự do. Tuy nhiên, khi chuẩn bị cho nhiệm vụ khốc liệt nhất đời mình, cô bắt đầu nhận ra bản thân đang phải lòng một người đàn ông mà mình cần phải đưa vào tròng. Cô buộc phải lựa chọn: trở về với bóng tối, bị săn đuổi và đơn độc, hay đứng dậy và chiến đấu.
“Cuốn hút… Một hành trình gai góc… Chuyên gia hóa học diễn tiến ở ngưỡng tốc độ cao, nhất là năng lực sử dụng hóa chất của cô gái có vóc người nhỏ nhắn, nhưng không ai muốn ở gần những chiếc nhẫn trên ngón tay của cô - không thể nói trước được điều gì.” - USA Today
“Meyer biết cách kiểm soát hình huống căng thẳng một cách khéo léo, như trong bất kỳ tác phẩm nào của cô. Ở đó, các nhân vật tự bộc lộ mình.” - Washington Post
“Một cuộc so kè về tài năng và mưu mẹo của các nhà khoa học tài năng, với sự dàn dựng của một tổ chức bí ẩn.” - Cosmopolitan', 1, "Tên Nhà Cung Cấp:	NXB Trẻ
Tác giả:	Stephenie Meyer
Người Dịch:	Dã Thảo
NXB:	Trẻ
Năm XB:	2023
Trọng lượng (gr):	760
Kích Thước Bao Bì:	20 x 14 x 3.7 cm
Số trang:	744
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Vương Triều Tudor Cuối Cùng", "Philippa Gregory", 220000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695032207/PHOTO_LIST/Van_hoc_nghe_thuat/007/", 
"NXB Văn Hóa - Nghệ Thuật", 
'"Vương Triều Tudor Cuối Cùng"
Vương triều Tudor cuối cùng được Philippa Gregory cấu trúc thành ba phần theo ba tuyến nhân vật chính – ba chị em gái nhà Tudor. Đó là Jane Grey, Cửu Nhật Nữ vương (The Nine Day Queen), người còn được xưng tụng như một Thánh nữ Tử vì Đạo; là Katherine Grey, cô em gái xinh đẹp, kiêu kỳ và nổi loạn; và cô em út Mary Grey, người có hình thể nhỏ nhắn và khiếm khuyết nhưng ẩn chứa bên trong một bản lĩnh và ý chí vô cùng mạnh mẽ và thuần khiết.
Ma thuật ngòi bút của Philippa sẽ khiến bạn lập tức thấy mình là nhân vật chính chỉ sau vài trang sách. Bạn sẽ bước vào một cuộc hành trình ngược dòng lịch sử đến nước Anh thời Tudor thế kỷ XVI đầy biến động với những mưu đồ đen tối, những cuộc thanh trừng đẫm máu, những con buôn chính trị sừng sỏ, những cuộc tình vụng trộm, những kiêu hãnh và định kiến, vài hạnh phúc hiếm hoi cùng nỗi thống khổ triền miên và sự hối tiếc. Có những lúc bạn nghe cảm xúc trào dâng trước một tình yêu nguyên sơ, đẹp đẽ; có những khi bạn chìm trong giận dữ đến cùng cực của lòng thù hận trước những toan tính tàn nhẫn và bạn chỉ muốn đạp tung tất cả, từ gông cùm của đoạn đầu đài cho đến những quy tắc hoàng gia, những luật lệ bất thành văn khắc nghiệt còn sót lại từ đêm trường Trung cổ.', 1, "Tên Nhà Cung Cấp:	Saigon Books
Tác giả:	Philippa Gregory
Người Dịch:	Vương Bảo Long
NXB:	NXB Văn hóa - Văn nghệ
Năm XB:	2019
Trọng lượng (gr):	620
Kích Thước Bao Bì:	16 x 24 x 2.9
Số trang:	604
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Tào Tháo - Thánh Nhân Đê Tiện - Tập 3 (Tái Bản 2018)", "Vương Hiểu Lỗi", 199000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695032218/PHOTO_LIST/Van_hoc_nghe_thuat/008/", 
"NXB Văn Học", 
'"Tào Tháo - Thánh Nhân Đê Tiện - Tập 3 (Tái Bản 2018)"
Tào Tháo là nhân vật có tính cách phức tạp và nhiều hình tượng nhất trong lịch sử Trung Quốc. Vừa giảo hoạt gian trá, lại thẳng thắn chân thành; vừa khoan dung độ lượng, lại đa nghi khôn cùng; vừa hào sảng, lại hẹp hòi; khí phách anh hùng, tình cảm dạt dào; hành động tàn nhẫn, tâm địa Bồ Tát. Tào Tháo là một nghệ nhân Biến Diện tài tình, lúc thì mang gương mặt này, thoắt cái lật sang gương mặt khác. Có thể hợp nhất những tính cách phức tạp như vậy trong một con người, là điều vô cùng khó, vậy mà tất cả những thứ ấy đều hội tụ nơi ông. Dường như con người Tào Tháo là tổng hòa của mọi mâu thuẫn trên thế gian.
Vương Hiểu Lỗi, người Thiên Tân, được mệnh danh là “Thiên tài sử học” bí ẩn, chưa từng công khai lộ diện trước giới truyền thông Trung Quốc. Qua mười năm chuyên tâm nghiên cứu sử liệu, thuộc nằm lòng từng câu từng chữ trong sử tịch, lắp ghép xâu chuỗi từng chi tiết, từng sự kiện, nắm bắt một cách chính xác bốn đặc trưng nổi bật của Tào Tháo bao gồm mưu lược, đạo đức, tình cảm, tài hoa, cuối cùng đã viết nên bộ trường thiên tiểu thuyết đầy đủ nhất, sống động nhất, mới mẻ nhất về cuộc đời của Tào Tháo – Thánh nhân đê tiện.', 1, "Tên Nhà Cung Cấp:	Alpha Books
Tác giả:	Vương Hiểu Lỗi
NXB:	NXB Văn Học
Năm XB:	2018
Trọng lượng (gr):	710
Kích Thước Bao Bì:	14 x 20.5
Số trang:	704
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Điềm Lành - Những Lời Tiên Tri Tuyệt Đích Và Chuẩn Xác Của Phù Thủy Agnes Nutter", "NEIL GAIMAN, TERRY PRATCHETT", 220000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695032271/PHOTO_LIST/Van_hoc_nghe_thuat/009/", 
"NXB Phụ Nữ", 
'"Điềm Lành - Những Lời Tiên Tri Tuyệt Đích Và Chuẩn Xác Của Phù Thủy Agnes Nutter"
Đây là một cuốn sách về Tận Thế, được viết bởi Neil Gaiman và Terry Pratchett, dịch bởi Lê Minh Đức và xuất bản bởi Phụ Nữ vào năm 2022. Cuốn sách kể về Quỷ Crowley và thiên thần Aziraphale biết rằng Tận Thế sắp sửa đến với thế giới này, với sự giáng lâm của Kẻ Chống Chúa trong hình hài đứa trẻ sơ sinh. Đáng lẽ cả hai phải lấy làm sung suớng: cuộc chiến tối hậu giữa thiên đường và địa ngục, dù phe nào thắng, thì cũng sẽ hủy diệt thế giới này, kết thúc cuộc giằng co hàng thiên niên kỷ giữa Thiện và Ác. Nhưng khốn nỗi, cả Crowley và Aziraphale lại thấy nuối tiếc thế giới của nhân loại. Thế giới con người vừa nhếch nhác, ngu xuẩn, lại vừa độc địa, thế nhưng nó cũng thú vị ghê gớm, đến nổi viễn cảnh phải sống ở một nơi toàn địa ngục hay toàn thiên đường trở nên không thể chịu đựng nổi với cả hai. Thiên thần và ác quỷ cùng tham gia vào một mưu đồ vừa khôn ngoan, vừa dớ dẩn, để cứu thế giới khỏi họa diệt vong.', 1, "Tên Nhà Cung Cấp:	Nhã Nam
Tác giả:	NEIL GAIMAN, TERRY PRATCHETT
Người Dịch:	Lê Minh Đức
NXB:	Phụ Nữ
Năm XB:	2022
Trọng lượng (gr):	600
Kích Thước Bao Bì:	24 x 15.5 x 2 cm
Số trang:	448
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Lời Tiên Tri Celestine", "James Redfield", 248000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695032299/PHOTO_LIST/Van_hoc_nghe_thuat/010/", 
"NXB Dân Trí", 
'“Lời tiên tri Celestine” 
Đây là một cuốn sách của tác giả James Redfield, kể về hành trình của nhân vật chính khi tình cờ biết đến sự tồn tại của một bản cổ thư, hay còn gọi là Thủ bản, thông qua một người bạn cũ. Sự hấp dẫn của lời tiên tri về một cuộc chuyển hóa lớn lao sắp xảy ra trong thiên niên kỷ mới khiến anh quyết định dấn thân vào một hành trình đầy mạo hiểm đến khu vực rừng núi ở Peru để khám phá bản cổ thư. Khi anh lần dò theo dấu vết của chín Sự Khai sáng, thông qua những cuộc gặp gỡ “dường như là định mệnh”, cổ thư dần hé lộ cho anh và những người bạn đồng hành thấy được hành trình tiến hóa đầy bí ẩn của cuộc đời mình cũng như của nhân loại. Bản cổ thư giúp họ nhìn nhận lại cuộc sống của con người qua các giai đoạn tiến hóa từ thời khởi thủy, dẫn đến hiện trạng của thế giới ngày nay. Mỗi Sự Khai sáng của bản cổ thư mang đến những nhận thức rất mới mẻ về ý nghĩa thật sự của cuộc sống đằng sau những sự kiện xảy ra trong đời mỗi người. Đối diện với những trăn trở của nội tâm, sự nguy hiểm luôn rình rập trong những cuộc chạy trốn, nhân vật chính trong câu chuyện đã gặp gỡ những người bạn hữu duyên và đón nhận từng sự kiện ngẫu nhiên xảy đến với mình để từ đó nhận ra những thông điệp sâu sắc.', 1, "Tên Nhà Cung Cấp:	FIRST NEWS
Tác giả:	James Redfield
Người Dịch:	Trần Tuyết
NXB:	Dân Trí
Năm XB:	2022
Trọng lượng (gr):	550
Kích Thước Bao Bì:	20.5 x 14.5 cm
Số trang:	532
Hình thức:	Bìa Mềm", 100);

-- VĂN HÓA XÃ HỘI - LỊCH SỬ
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Tàu Hũ, Bánh, Trà Và Cà Phê", "Đào Thị Thanh Tuyền", 120000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042488/PHOTO_LIST/Vanhoaxahoi_lichsu/001/", 
"NXB Tổng Hợp Thành Phố Hồ Chí Minh", 
'"Tàu Hũ, Bánh, Trà Và Cà Phê"
Tàu hủ, bánh, trà và cà phê là cuốn sách thứ 15 trong 25 năm viết văn của Đào Thị Thanh Tuyền, một gia tài văn chương đáng ao ước và ngưỡng mộ.
ững câu chuyện quá đỗi đời thường, từ trong nhà ra ngoài ngõ, ở quán nước, trên chuyến xe, một bóng hình xưa, một vườn hồng cũ, một chỗ ngồi ngắm sô mà bất cứ ai cũng đều có thể nhìn thấy, chạm phải, hoặc ít nhất là ngang qua nhưng lại bỏ quên đâu đó. Hạnh phúc và khổ đau, đoàn tụ và ly tán, phản bội và chung thủững đề tài tưởng nhàm chán nhưng đi qua cái nhìn và ghi chép của một nhà văn nữ bao giờ cũng có sức lay động bởi sự mềm mại và rung cảm rất riêng. Mảng thời sự trong truyện ngắn cũng là một thế mạnh của tác giả vốn làm báo song hành, sự uyển chuyển từ tư liệu báo chí thành tác phẩm văn học là điều không hề dễ dàng. Báo chí phục vụ người đọc phải đúng thời điểm như là tiêu chí đầu tiên còn văn chương thì không đòi hỏi phải như vậy. Mà chỉ cần một ngày nọ, bây giờ hoặc mai sau, cây cầu văn chương do tác giả bắc qua hôm nay sẽ giúp người đọc nối lại ngọn nguồn, tự mình chiêm nghiệm và khám phá.', 1, "Tên Nhà Cung Cấp:	NXB Tổng Hợp TPHCM
Tác giả:	Đào Thị Thanh Tuyền
NXB:	Tổng Hợp Thành Phố Hồ Chí Minh
Năm XB:	2023
Trọng lượng (gr):	380
Kích Thước Bao Bì:	20.5 x 13 x 1.8 cm
Số trang:	360
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Những Di Sản Văn Hóa Vật Thể Và Thiên Nhiên Thế Giới Tại Việt Nam", "Nguyễn Văn Tân", 52000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042508/PHOTO_LIST/Vanhoaxahoi_lichsu/002/", 
"NXB Hà Nội", 
'“Những Di Sản Văn Hóa Và Thiên Nhiên Thế Giới Tại Việt Nam” 
Đây là một cuốn sách giới thiệu về 8 di sản thế giới tại Việt Nam được UNESCO công nhận từ năm 1993 đến 2014. Sách nhấn mạnh tầm quan trọng của việc bảo tồn và phát huy những di sản văn hóa và thiên nhiên quý giá này. Đây là những tài sản quý giá của dân tộc cần được khai thác, lưu giữ và phát huy. Cuốn sách là nguồn tài liệu quý giá cho những ai quan tâm đến văn hóa và lịch sử Việt Nam.', 1, "Công ty phát hành: Công Ty Cổ Phần Tri thức Văn Hóa Sách Việt Nam
Ngày xuất bản: 2023-06-23 14:55:11
Loại bìa: Bìa gập
Số trang: 160
Nhà xuất bản: Nhà Xuất Bản Hà Nội", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Việt Nam Văn Hoá Sử Cương - Bìa Cứng", "Đào Duy Anh", 390000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042531/PHOTO_LIST/Vanhoaxahoi_lichsu/003/", 
"NXB Đại Học Sư Phạm", 
'"Việt Nam Văn Hoá Sử Cương - Bìa Cứng"
Việt Nam văn hoá sử cương là một nỗ lực của học giả Đào Duy Anh nhằm giải quyết cuộc va chạm giữa văn hóa Việt Nam truyền thừa từ bao đời và văn hóa Âu tây mới lan tràn. Đào Duy Anh nhìn nhận cuộc va chạm ấy chính là “bi kịch hiện thời” của dân tộc, một bi kịch đến từ “sự xung đột của những giá trị cổ truyền của văn hóa cũ ấy với những điều mới lạ của văn hóa Tây phương”. Và để giải quyết sự xung đột này, Đào Duy Anh đề nghị “một mặt phải xét lại cho biết nội dung của văn hóa xưa là thế nào, một mặt phải nghiên cứu cho biết chân giá trị của văn hóa mới”. Tác phẩm Việt-nam văn-hóa sử-cương chính là lời giải cho nan đề đầu tiên của tác giả: văn hóa xưa là thế nào?
Ấn bản Việt Nam văn hoá sử cương của Đông A dựa theo bản in lần đầu năm 1938 của Quan-hải tùng-thư, có tham khảo một số chi tiết trong bản in năm 1951 của Xuất bản Bốn phương, Viện Giáo khoa - Hiên Tân Biên. Trong lần in này, ban biên tập Đông A sử dụng một số minh họa trong các bản sách tiếng Pháp về Đông Dương và các nguồn tư liệu ở bảo tàng, tranh dân gian, sách báo xưa...
Với diện mạo mới này, người làm sách kỳ vọng sẽ đem đến cho bạn đọc một ấn bản trang nhã, tương xứng với giá trị lâu dài của tác phẩm.', 1, "Tên Nhà Cung Cấp:	Đông A
Tác giả:	Đào Duy Anh
NXB:	Đại Học Sư Phạm
Năm XB:	2023
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	500
Kích Thước Bao Bì:	26.5 x 18.5 x 2 cm
Số trang:	368
Hình thức:	Bìa Cứng", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Tìm Hiểu Văn Hóa Úc", "Nguyễn Mai Chi", 66300, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042553/PHOTO_LIST/Vanhoaxahoi_lichsu/004/", 
"NXB Hà Nội", 
'“Việt Nam có hơn bốn nghìn năm lịch sử dựng nước và giữ nước”
Đây  là một cuốn sách giới thiệu về văn hóa và lịch sử của Việt Nam, cũng như những di sản văn hóa và thiên nhiên quý giá của đất nước này. Sách khám phá những đặc trưng văn hóa độc đáo của Việt Nam, từ những phong tục, tập quán, lễ hội, trang phục, ẩm thực, văn học, nghệ thuật, thể thao cho đến các khu du lịch nổi tiếng. Đây là một nguồn tài liệu quý giá cho những ai quan tâm đến văn hóa và lịch sử Việt Nam.', 1, "Tác giả: Nguyễn Mai Chi
Ngày xuất bản: 04 - 2023
Nhà xuất bản: NXB Hà Nội
Hình thức bìa: Bìa mềm
Số trang: 156", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Khám Phá Thế Giới - Trang Phục Cổ Truyền Khắp Năm Châu", "Giovanna Alessio, Chaaya Prab", 130000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042572/PHOTO_LIST/Vanhoaxahoi_lichsu/005/", 
"NXB Kim Đồng", 
'"Khám Phá Thế Giới - Trang Phục Cổ Truyền Khắp Năm Châu"
Trên khắp thế giới, người dân mặc trang phục truyền thống để tôn vinh bản sắc văn hoá dân tộc mình.
Trong từng đường kim mũi chỉ, từng sợi tơ sợi vải, mỗi bộ trang phục truyền của mỗi dân tộc đều mang trong mình một câu chuyện văn hóa, thể hiện rằng họ là ai, họ sinh sống ở đâu và tín ngưỡng của họ là gì.
Khám Phá Thế Giới - Trang Phục Cổ Truyền Khắp Năm Châu tựa như một vũ hội hoành tráng để tôn vinh trang phục và văn hóa đa dạng trên toàn thế giới.
Nào kimono đa sắc, nào váy flamenco lộng lẫy, nào những chiếc mặt nạ mặt nạ sặc sỡ… từng trang sách đưa ta du ngoạn qua nhiều quốc gia, khám phá và tụng ca nét đẹp muôn vẻ của những bộ trang phục cổ truyền.', 1, "Tên Nhà Cung Cấp:	Nhà Xuất Bản Kim Đồng
Tác giả:	Giovanna Alessio, Chaaya Prabhat
Người Dịch:	Kiều Nga
NXB:	Kim Đồng
Năm XB:	2023
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	435
Kích Thước Bao Bì:	30.5 x 24.5 x 0.7 cm
Số trang:	79
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Lăng Gia Long", "Léopold Michel Cadière", 249000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042590/PHOTO_LIST/Vanhoaxahoi_lichsu/006/", 
"NXB Khoa Học Xã Hội", 
'"Lăng Gia Long"
Ấn phẩm thứ hai thuộc bộ sách “Huế kỳ bí” có tên “Lăng Gia Long” - tác giả là Linh mục Léopold Cadière, với phần thơ của Charles Patris. Ngay sau khi Hội những người bạn Cố đô Huế được thành lập, L. Cadière đã tham gia Dự án nghiên cứu lập bản đồ lăng mộ tang lễ vùng phụ cận Huế và hội này đã sớm có được những con số tổng hợp đầu tiên rất ấn tượng. Năm 1928, trên tập san Đô thành hiếu cổ (tên gọi quen thuộc hơn của tập san Những người bạn Cố đô Huế), chính L.Cadière đã công bố bài viết đầu tiên về chủ đề “Lăng mộ của người An Nam trong vùng phụ cận Huế”.
Ngược về thượng nguồn qua ngả đồi Nam Giao, ngang qua quần thể lăng Thiệu
Trị để vào hữu ngạn Hương Giang, băng qua khe Chu Ê để đến ngã ba Chợ Tuần, vượt qua bến đò Lăng Gia Long, rồi đi dọc bờ sông Tả Trạch một quãng đến làng Định Môn. “Ngự đạo”, con đường từ tả ngạn sông dẫn vào lăng vị vua nổi tiếng triều Nguyễn, Hoàng đế Gia Long dần hiện ra dẫn ta vào một trong những nơi huyền bí của vùng đất Huế. Quần thể lăng Gia Long giấu mình trong những vạt đồi, thung lũng, rừng cây, con suối, ẩn hiện một cách nhẹ nhàng. Từ đây, chúng ta được tác giả giới thiệu tỉ mỉ từng công trình một của quần thể với những phân tích khảo cứu kỹ lưỡng, mô phỏng một bức tranh toàn diện về dấu ấn triều đại xưa.
Qua từng chương của cuốn sách, bạn đọc sẽ hiểu hơn về vị Hoàng đế đầu tiên của triều Nguyễn, cùng những quan niệm nhân sinh quan mà chính Gia Long đã gửi vào quần thể lăng tẩm mình. Bên cạnh đó “Lăng Gia Long” không những là một khảo cứu tỉ mỉ, mà nó còn mang giá trị ứng dụng rất cao, khi tác giả tập sách với ngòi bút khoáng đạt và lịch lãm của mình đã hướng tới một cuốn sách mà ngày nay ta quen gọi là sách “Hướng dẫn du lịch” - rất chuyên nghiệp - và phục vụ mục tiêu “du lịch tâm linh”.
Qua thiên khảo cứu này của L. Cadière, bạn đọc có thể biết thêm những “sử liệu” sống động liên quan đến một trong những lăng tẩm lớn nhất, tiêu biểu nhất của xứ Huế: Lăng Gia Long, cũng như chúng ta có dịp được nghiệm sinh sâu sắc hơn trong “đời sống tâm linh”, thế giới bên kia của các đấng đế vương triều Nguyễn và những giá trị văn hóa nghệ thuật vật thể hay phi vật thể ở không gian đặc biệt này quanh Cố đô Huế.', 1, "Tên Nhà Cung Cấp:	Công ty TNHH Quốc Tế Mai Hà
Tác giả:	Léopold Michel Cadière
Người Dịch:	Nguyễn Thúy Yên, Thu Uyên
NXB:	Khoa Học Xã Hội
Năm XB:	2022
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	550
Kích Thước Bao Bì:	24 x 16 x 1.5 cm
Số trang:	130
Hình thức:	Bìa Cứng", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Bốn Ngọn Gió - The Four Winds", "Kristin Hannah", 285000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042612/PHOTO_LIST/Vanhoaxahoi_lichsu/007/", 
"NXB Văn Học", 
'"Bốn Ngọn Gió - The Four Winds"
Cuốn tiểu thuyết tráng lệ về tình yêu, chủ nghĩa anh hùng và niềm hy vọng (Hơn 480,000 lượt bình chọn trên Goodreads).
Trong cuộc Đại suy thoái năm 1934 đầy bất trắc và hiểm nguy, có hàng triệu mảnh đời đã rơi vào cảnh khốn cùng. Elsa Martinelli—giống như rất nhiều người hàng xóm của cô—phải đưa ra một lựa chọn đau đớn: chiến đấu cho vùng đất cô yêu hoặc đi về phía tây, tới California, để tìm kiếm một cuộc sống tốt đẹp hơn. BỐN NGỌN GIÓ là một bức chân dung không thể xóa nhòa về nước Mỹ và Giấc mơ Mỹ, được nhìn qua con mắt của một người phụ nữ bất khuất, người có lòng dũng cảm và sự hy sinh sẽ định hình nên một thế hệ.
Dù ở thời đại nào, lý tưởng, lòng dũng cảm và sự sẵn sàng cống hiến sẽ luôn là thứ quyền năng giúp chúng ta vượt qua mọi nghịch cảnh.', 1, "Tên Nhà Cung Cấp:	Huy Hoang Bookstore
Tác giả:	Kristin Hannah
Người Dịch:	Lộc Diệu Linh
NXB:	Văn học
Năm XB:	2023
Trọng lượng (gr):	713
Kích Thước Bao Bì:	20.5 x 13.5 x 3.2 cm
Số trang:	704
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Sài Gòn Hay Ta!", "Thăng Fly Comics, Bình Bồng Bột", 198000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042646/PHOTO_LIST/Vanhoaxahoi_lichsu/008/", 
"NXB Phụ Nữ Việt Nam", 
'"Sài Gòn Hay Ta!"
"Ở thành phố này, không ai buồn quá lâu đâu. Nghe thành phố thở đi, trong hơi thở đó có người Nghệ An, người Hà Nội, người Huế, người Hoa, người Khmer, người Hàn, người Mỹ... Trong hơi thở đó có ta, có mình. Một thành phố tổng hợp mà không ô hợp, một thành phố xóa đi bản ngã, để dù có gốc gác ở nơi nào đi nữa cũng có thể nói tôi là người Sài Gòn.”
Những trang viết sống động và giàu cảm xúc, khi lãng mạn khi hóm hỉnh của Bình Bồng Bột về Sài Gòn, hòa với sắc màu rực rỡ tươi mới trong những bức tranh của Thăng Fly, đã khắc họa thật trìu mến một thành phố của đại lộ thênh thang và ngõ hẻm lắt léo, của nỗi hoài niệm quá khứ và cuộc chuyển mình hiện đại, của cái bất biến và sự đổi thay, nhưng trên tất cả, là của những con người ấm áp khiến ta tin vào điều tử tế trong cuộc sống.
Sài Gòn hay ta! là một tiếng thốt lên sảng khoái, cũng có thể là suy ngẫm tâm đắc của các tác giả về sự bao dung và chân tình của thành phố không bao giờ chịu già này.
“Sau khi đi suốt mấy trăm trang sách để tìm chân dung người Sài Gòn, vật cả còn hơn đi tìm chân dung tình yêu, có vẻ tác giả cũng dần dà nhìn thấy ánh sáng ở cuối... cuốn sách. Chàng gật gù tâm đắc: Người Sài Gòn tức là người hay nói câu "Người mình với nhau mà!". Rút ra được kết luận đó, chàng trai trẻ tên Bình xem ra chẳng "bồng bột" chút nào!"
-Nhà văn Nguyễn Nhật Ánh
Bình Bồng Bột
- Bình là tên thật, Bồng Bột là bản chất thật.
- Nhà báo, dịch giả, người viết tự truyện thuê, biên kịch phim điện ảnh. Nói chung là bán chữ kiếm tiền.
- Ước mơ: cuốn sách này không ế như chính người viết ra nó.
Thăng Fly
- Thăng Fly nghĩa là Bay Bay. Tên vậy nhưng dành phần lớn thời gian đi bộ và còng lưng ngồi vẽ.
- Một người vẽ như ăn cơm hằng ngày. Thoải mái nhất lúc vẽ.
- Ước mơ: sống để vẽ. Được vẽ, viết cả đời mà không phải chuyển nghề.', 1, "Tên Nhà Cung Cấp:	Nhã Nam
Tác giả:	Thăng Fly Comics, Bình Bồng Bột
NXB:	Phụ Nữ Việt Nam
Năm XB:	2023
Trọng lượng (gr):	330
Kích Thước Bao Bì:	20.5 x 14 x 1.7 cm
Số trang:	302
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Gia Định Là Nhớ - Sài Gòn Là Thương", "Cù Mai Công", 118000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042663/PHOTO_LIST/Vanhoaxahoi_lichsu/009/", 
"NXB Tổng Hợp TP.HCM", 
'“Gia Định là nhớ, Sài Gòn là thương” 
Đây là một cuốn sách được chia thành hai phần, mỗi phần đều gợi lên những ký ức, hoài niệm khác nhau về Thành phố Hồ Chí Minh. Phần “Gia Định là nhớ” như một thước phim trắng đen ghi lại khung cảnh sơ khai của vùng Gia Định lúc người Pháp vừa đặt chân đến. Trong khi đó, phần “Sài Gòn là thương” lại như một thước phim màu miêu tả một Sài Gòn náo nhiệt, phồn hoa, đầy sức sống từ cuối thập niên 1950 đến ngày hôm nay.
Phần 1, “Sài Gòn là thương”, khám phá nguồn gốc của chợ Bến Thành, nếp sinh hoạt người Sài Gòn xưa và “chợ Cũ” có tuổi đời hơn nửa thế kỷ. Phần này cũng giới thiệu về ẩm thực của cả ba nền văn hóa Việt, Hoa, Pháp.
Phần 2, “Gia Định là nhớ”, giải thích căn nguyên của nhiều vấn đề “thời sự” ngày nay của thành phố này. Loạt bài về quy hoạch Sài Gòn - Chợ Lớn - Gia Định cho bạn đọc hình dung được cái nhìn toàn cảnh theo dòng thời gian về hình dáng của Sài Gòn từ những ngày đầu cho đến nay.
Tác giả của cuốn sách, Cù Mai Công, không chỉ là nhân chứng sống một thời của Sài Gòn mà còn là một nhà nghiên cứu có nhiều phát hiện bất ngờ, mới mẻ từ kho tư liệu cũ.', 1, "Tên Nhà Cung Cấp:	FIRST NEWS
Tác giả:	Cù Mai Công
NXB:	Tổng Hợp TPHCM
Năm XB:	2022
Trọng lượng (gr):	250
Kích Thước Bao Bì:	20.5 x 14.5 cm
Số trang:	224
Hình thức:	Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Không Gian Văn Hóa Nguyên Thủy - Nhìn Theo Lý Thuyết Chức Năng", "Robert Lowie", 248000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042681/PHOTO_LIST/Vanhoaxahoi_lichsu/010/", 
"NXB Khoa Học Xã hội", 
'"Không Gian Văn Hóa Nguyên Thủy - Nhìn Theo Lý Thuyết Chức Năng"
Robert Lowie (1883-1957) là một nhà nhân học văn hóa nổi tiếng của Mỹ, với sự nghiệp đầy năng động kéo dài năm thập niên đầu của thế kỷ 20. Ông có nhiều công trình đồ sộ, trong đó nổi bật nhất là “Không gian văn hóa nguyên thủy” (1920). Trong công trình này, Lowie đã phê phán những hạn chế của viễn tượng tiến hóa luận và truyền bá luận qua đại diện của nó là Lewie H. Morgan (1818-1881) trong việc lý giải diễn trình văn hóa của nhân loại.
Theo Lowie, để vượt qua những hạn chế lý thuyết này, ta phải đưa kích thước thời gian như là chân trời lý giải vào công việc nghiên cứu và phải xét đối tượng ở phương diện chức năng của nó. Từ viễn tượng chức năng luận, Lowie xử lý các vấn đề mà ông cho là then chốt trong việc hiểu các nền văn hóa nguyên thủy: hôn nhân, gia đình, tài sản, đẳng cấp xã hội, chính quyền, pháp luật và những hình thức khác nhau của các nhóm họ hàng, anh em, xã hội và chính trị.
Kết quả là không gian văn hóa của xã hội nguyên thủy hiện ra với ‘một tính chất khác hẳn với tính chất mà trường phái Morgan đã phổ biến rộng rãi’; đó là một không gian đa dạng nhiều màu sắc với các đơn vị xã hội luôn vận động trong sự tương tác qua lại với nhau một cách đa chiều. Cuốn sách cung cấp cho các nhà nghiên cứu một khung phân tích mẫu mực của lý thuyết chức năng và mang lại cho bạn đọc một cái nhìn rộng hơn và sâu sắc hơn về những chân trời văn hóa khác.', 1, "Nhà Cung Cấp:	Cty Tri Thức Văn Hóa Sách VN
Tác giả:	Robert Lowie
Người Dịch:	Vũ Xuân Ba, Ngô Bình Lâm
NXB:	NXB Khoa Học Xã Hội
Năm XB:	2019
Trọng lượng (gr):	520
Kích Thước Bao Bì:	16 x 24 cm
Số trang:	503
Hình thức:	Bìa Mềm", 100);

-- Phần Văn Sang thêm dữ liệu vào bảng sách (lần 2)
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Dẫn Luận Về Kierkegaard", "Patrick Gardiner", 65000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694972478/PHOTO_LIST/Chinhtri_phapluat/011/", 
"NXB Hồng Đức", 
'"Dẫn Luận Về Kierkegaard"
Soren Kierkegaard là một trong những triết gia độc đáo nhất của thế kỷ 19, với các tác phẩm về tôn giáo, tâm lý học và văn học. Những di sản sách triết học gây ấn tượng của ông đã là nguồn cảm hứng cho nhiều khuynh hướng tư tưởng của thế kỷ 20, đặc biệt là sự trỗi dậy của chủ nghĩa hiện sinh.
Dẫn Luận Về Kierkegaard của Patrick Gardiner mang đến cho chúng ta một toàn cảnh về đời sống và suy tư của triết gia người Đan Mạch và ảnh hưởng của ông lên những dòng chảy của tư tưởng hiện đại.
“Phác họa dễ hiểu cho độc giả nhập môn về suy nghĩ của một thiên tài đã thể hiện sống động cả hai vai trò, nhà tư tưởng và hiện hữu con người."', 
1, "Tên Nhà Cung Cấp:	Cty Văn Hóa Văn Lang
Tác giả:	Patrick Gardiner
Người Dịch:	Thái An
NXB:	NXB Hồng Đức
Năm XB:	2017
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	260
Kích Thước Bao Bì:	20 x 12 cm
Số trang:	214
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Hồ Chí Minh - Về Cán Bộ Và Công Tác Cán Bộ", "Hồ Chí Minh", 80000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694972478/PHOTO_LIST/Chinhtri_phapluat/012/", 
"NXB Chính Trị Quốc Gia Sự Thật", 
'"Hồ Chí Minh - Về Cán Bộ Và Công Tác Cán Bộ"
Chủ tịch Hồ Chí Minh là lãnh tụ vĩ đại của dân tộc ta, Người trực tiếp sáng lập và lãnh đạo Đảng Cộng sản Việt Nam, tiến hành cuộc đấu tranh giành độc lập và tự do cho dân tộc. Người là hiện thân mẫu mực của người đảng viên đảng cộng sản, kiên định với mục tiêu, lý tưởng chủ nghĩa Mác-Lênin, trọn đời cống hiến cho sự nghiệp đấu tranh vì độc lập dân tộc và chủ nghĩa xã hội. Người là một chiến sĩ cách mạng suốt đời đấu tranh vì độc lập tự do và hạnh phúc của dân tộc, vì tình hữu nghị và đoàn kết quốc tế giữa các quốc gia và dân tộc yêu hòa bình. Người là tấm gương sáng về đạo đức, tác phong công tác để toàn Đảng, toàn dân, toàn quân noi theo. Di sản của Chủ tịch Hồ Chí Minh để tại cho Đảng, cho nhân dân ta vô cùng to lớn.
Sinh thời, Chủ tịch Hồ Chí Minh luôn dành sự quan tâm đặc biệt đến công tác cán bộ, Người coi đó là nhiệm vụ quan trọng hàng đầu trong công tác xây dựng Đảng, xây dựng chính quyền nhà nước. Hệ thống các quan điểm trong tư tưởng của Người về công tác cán bộ là sự kết hợp tinh tế giữa lý luận chủ nghĩa Mác-Lênin với thực tiễn cách mạng Việt Nam, trở thành cơ sở lý luận và thực tiễn để Đảng lãnh đạo, chỉ đạo và tiến hành công tác cán bộ đáp ứng yêu cầu đặt ra trong từng thời kỳ cách mạng trước đây và công cuộc đổi mới, phát triển đất nước hiện nay.', 
1, "Tên Nhà Cung Cấp:	NXB Chính Trị Quốc Gia
Tác giả:	Hồ Chí Minh
NXB:	Chính Trị Quốc Gia Sự Thật
Năm XB:	2023
Trọng lượng (gr):	220
Kích Thước Bao Bì:	20.5 x 15 x 1 cm
Số trang:	200
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Câu Chuyện Triết Học - The Story Of Philosophy", "Will Durant", 450000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694972478/PHOTO_LIST/Chinhtri_phapluat/013/", 
"NXB Thế Giới", 
'"Câu Chuyện Triết Học - The Story Of Philosophy"
Khi viết cuốn sách này, Will Durant không tham vọng viết một lịch sử triết học hoàn chỉnh, ông chỉ nỗ lực nhân văn hóa tri thức triết học qua cuộc đời và tư tưởng của các triết gia phương Tây mà theo ông có vị trí quan trọng hơn cả. Từ đó, ông làm sáng tỏ quan điểm rằng triết học nên được hiểu là sự diễn giải mang tính tổng hợp về tất cả mọi kinh nghiệm, thay vì là sự mô tả mang tính phân tích về phương thức và quá trình của chính kinh nghiệm. Bởi việc phân tích thuộc về khoa học còn sự tổng hợp thuộc về triết học, và bởi "khoa học cho ta tri thức, nhưng chỉ triết học mới có thể cho ta trí tuệ".
Câu chuyện triết học thành công vang dội không chỉ trong vai trò một dẫn luận về tinh thần triết học mà còn ở lời mời gọi đến với bộ môn này. Sau khi cuốn sách được xuất bản, doanh số của các tác phẩm triết học kinh điển đã tăng khoảng 200%. Nhiều nhà xuất bản đã phát hành những phiên bản mới, đặc biệt là những tác phẩm của Plato, Spinoza, Voltaire, Schopenhauer và Nietzsche. Và kể từ thời điểm ra đời đến nay, Câu chuyện triết học đã được tái bản hàng chục lần, chứng minh cho sức sống, tầm ảnh hưởng vượt thời gian của nó.
Ở Việt Nam, Câu chuyện triết học từng được xuất bản nhiều lần với bản dịch không đầy đủ. Do vậy, đây chính là bản dịch tiếng Việt mới hoàn chỉnh và lần đầu tiên có bản quyền chính thức của tác phẩm nổi tiếng này.
WILL DURANT tên đầy đủ là William James Durant (1885-1981), sử gia, triết gia, nhà văn nổi tiếng người Mỹ. Từng được trao giải Pulitzer. Ông có ảnh hưởng lớn đến các vấn đề xã hội, chính trị, tư tưởng đương thời cũng như sau này.',
1, "Tên Nhà Cung Cấp:	Nhã Nam
Tác giả:	Will Durant
Người Dịch:	Hoàng Đức Long
NXB:	Thế Giới
Năm XB:	2022
Trọng lượng (gr):	1231
Kích Thước Bao Bì:	24 x 15.5 x 4 cm
Số trang:	743
Hình thức:	Bìa Cứng", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("100 Triết Gia Tiêu Biểu Thế Kỷ XX", "Nhiều Tác Giả", 130000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694972478/PHOTO_LIST/Chinhtri_phapluat/014/", 
"NXB Hà Nội", 
'"100 Triết Gia Tiêu Biểu Thế Kỷ XX"
100 Triết Gia Tiêu Biểu Thế Kỷ XX Có thể nói triết học là khoa học của các khoa học. Từ cổ chí kim, khoa học hạt nhân này luôn có ảnh hưởng và chi phối đến nhận thức và hoạt động thực tiễn của nhân loại. Lịch sử triết học gắn với lịch sử hình thành và phát triển của xã hội loài người. Từ Adorno đến Zang Binglin (Chương Bính Lân), quyển sách này cung cấp một phân tích phê phán về hành trang, sự nghiệp, và biên độ ảnh hưởng của những khuôn mặt lỗi lạc nhất trong tư tưởng triết học thế kỷ XX. Mỗi mục từ bao gồm: - Những sự kiện tiểu sử - năm sinh, năm mất, giáo dục, các nhiệm chức trải qua. - Trình bày, thẩm định những tư tưởng và những thành tựu của từng triết gia. - Danh sách những tác phẩm chính của họ. - Những nguồn có uy tín nhất viết về họ. Nơi đây có mặt những cao thủ thượng thừa về tư tưởng từ khắp năm châu bốn bể, nhưng chủ yếu nhất và đông đảo nhất, là các đại diện từ những miền đất giàu truyền thống tư duy Châu Âu lục địa, Anh - Mỹ và Châu Á: Trung Hoa, Ấn Độ, Nhật Bản... những người được chọn vào đây vì tầm sâu rộng, tính độc đáo của tư tưởng và ảnh hưởng lớn của họ vào đời sống tinh thần của thế kỷ vừa qua và hiện nay. Một công trình biên soạn uy tín của hơn bốn mươi Giáo sư Triết học từ các Đại học danh tiếng Anh - Mỹ hẳn sẽ là một đóng góp xuất sắc cho buổi đại yến văn hóa tư tưởng,  sẽ đáp ứng được khẩu vị thưởng ngoạn tinh tế và cao nhã của thành phần độc giả ưu tú, chọn lọc.',
1, "Tên Nhà Cung Cấp:	Cty Văn Hóa Văn Lang
Tác giả:	Nhiều Tác Giả
NXB:	NXB Hà Nội
Năm XB:	09-2010
Trọng lượng (gr):	930
Kích Thước Bao Bì:	24 x 16
Số trang:	478
Hình thức:	Bìa Cứng", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Lặp Lại", "Soren Kierkegaard", 148000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694972478/PHOTO_LIST/Chinhtri_phapluat/015/", 
"NXB Hồng Đức", 
'"Lặp Lại"
Tác giả Soren Kierkegaard là triết gia vĩ đại người Đan Mạch. Ông được suy tôn là ông tổ của Chủ nghĩa Hiện sinh. Các tác phẩm tiêu biểu của ông được Phanbook phát hành:
- Kính sợ và run rẩy (2019)
- Lặp lại (2021)
Lặp lại được tác giả Soren Kierkegaard cho xuất bản đồng thời với Kính sợ và run rẩy vào ngày 16 tháng Mười năm 1843, dưới bút danh Constantin Constantius.
Dễ có cảm giác rằng, đây là một tác phẩm mang tính tự truyện nhằm giải thích lý do Kierkegaard hủy hôn với Regine Olsen - tình yêu lớn trong đời ông; người phụ nữ bình thường trở nên bất tử qua các tác phẩm triết học của ông.
Lặp lại thuộc trong số tám tác phẩm quan trọng, xuất sắc nhất của Kierkegaard, nhưng cũng là cuốn sách dễ đọc, cuốn hút nhất trong số đó.',
1, "Tên Nhà Cung Cấp:	Phanbook
Tác giả:	Soren Kierkegaard
Người Dịch:	Nguyễn Nguyên Phước
NXB:	NXB Hồng Đức
Năm XB:	2021
Trọng lượng (gr):	220
Kích Thước Bao Bì:	20.5 x 13 cm
Số trang:	208
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Đạo Đức Cách Mạng - Đạo Đức Hồ Chí Minh - Con Đường Đến Với Chủ Nghĩa Lênin", "Đông Phương", 79000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694972478/PHOTO_LIST/Chinhtri_phapluat/016/", 
"NXB Dân Trí", 
'"Đạo Đức Cách Mạng - Đạo Đức Hồ Chí Minh - Con Đường Đến Với Chủ Nghĩa Lênin"
Trong hành trình vô cùng gian truân để tìm đường cứu nước, giải phóng dân tộc khỏi ách nô lệ, có một sự kiện đặc biệt quan trọng tác động đến sự hình thành thế giới quan của Nguyễn Ái Quốc - Hồ Chí Minh, đó là sự kiện Người được đọc Sơ thảo lần thứ nhất những luận cương về vấn đề dân tộc và vấn đề thuộc địa của V.I.Lênin. Những tư tưởng của Lênin được thể hiện trong bản Luận cương đã khiến Nguyễn Ái Quốc dứt khoát đi theo Quốc tế thứ III và tiếp thu những nội dung cơ bản của văn kiện quan trọng này làm nền tảng để Người vận dụng sáng tạo vào việc xây dựng con đường cách mạng vô sản ở Việt Nam. Thế nhưng, hành trình để đến được với sự lựa chọn đó của Người không hề đơn giản. Từ người thanh niên yêu nước Nguyễn Tất Thành đến Văn Ba - Nguyễn Ái Quốc - Hồ Chí Minh là quá trình vừa lao động nhọc nhằn để kiếm sống, vừa học hỏi, trải nghiệm đời sống của nhân dân lao động ở rất nhiều nước khác nhau trên khắp thế giới, nghiên cứu - phân tích tình hình chính trị trong và ngoài nước để tìm ra con đường cách mạng đúng đắn, phù hợp và cần thiết nhất cho dân tộc Việt Nam.',
1, "Tên Nhà Cung Cấp:	CÔNG TY CỔ PHẦN SÁCH TRÍ THỨC VIỆT
Tác giả:	Đông Phương
NXB:	NXB Dân Trí
Năm XB:	2022
Trọng lượng (gr):	186
Kích Thước Bao Bì:	19 x 13 x 1 cm
Số trang:	199
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Chủ Nghĩa Hiện Sinh - Dẫn Luận Ngắn", "Thomas Flynn", 75000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694972478/PHOTO_LIST/Chinhtri_phapluat/017/", 
"NXB Tổng Hợp TP.HCM", 
'"Chủ Nghĩa Hiện Sinh - Dẫn Luận Ngắn"
Người ta thường thừa nhận rằng chủ nghĩa hiện sinh là một học thuyết triết học về cá nhân cụ thể. Đây vừa là vinh quang vừa là nỗi tủi nhục của nó. Trong thời đại truyền thông đại chúng và sự hủy diệt hàng loạt, điểm sáng của chủ nghĩa hiện sinh là nó bảo vệ giá trị nội tại của cái mà Sartre, một đại diện tiêu biểu của nó, gọi là ‘cá nhân hữu cơ tự do’, tức là, tác nhân bằng xương bằng thịt. Do trong xã hội hiện đại con người ta bị đẩy tới chỗ phục tùng một cách không thể cưỡng lại được, nên cái mà ta gọi là ‘tính cá nhân hiện sinh’ là một thành tựu, chứ không phải là tính cá nhân thường trực. Chúng ta sinh ra là những thực thể sinh học nhưng chúng ta phải trở thành các cá nhân hiện sinh bằng cách chấp nhận trách nhiệm cho các hành động của mình. Đây là một sự áp dụng lời khuyên của Nietzsche cho việc ‘trở thành cái bạn là’. Nhiều người không bao giờ thừa nhận trách nhiệm ấy mà lẩn vào sự thoải mái của đám đông vô diện mục để tránh né tính cá nhân hiện sinh của mình. Để minh họa cụ thể cho việc trở thành cái cá nhân, trong chương tiếp theo, tôi lần theo cái Kierkegaard gọi là ‘các lĩnh vực’ của sự hiện hữu hay ‘các giai đoạn trên đường đời’ và kết luận với một số nhận xét về việc Nietzsche sẽ quan niệm dự phóng trở thành cá nhân hiện sinh này như thế nào.
Trong khi giá trị tối cao của tư tưởng hiện sinh nhìn chung được thừa nhận là sự tự do, thì đức hạnh hàng đầu của nó là tính đích thực. Chương 4 sẽ tập trung bàn luận chủ đề này cũng như bản tính và các hình thức của sự tự dối mình, hay sự ngụy tín, giữ chức năng như là mặt đối lập với nó. Tôi liên kết tính đích thực với tính cá nhân hiện sinh và xem xét khả thể của một thứ đạo đức học về tính đích thực dựa trên trách nhiệm hiện sinh.',
1, "Nhà Cung Cấp:	NXB Tổng Hợp TPHCM
Tác giả:	Thomas Flynn
Người Dịch:	Đinh Hồng Phúc
NXB:	NXB Tổng Hợp TPHCM
Năm XB:	2018
Trọng lượng (gr):	250
Kích Thước Bao Bì:	13 x 20.5
Số trang:	248
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Chuyện Đông Chuyện Tây - Tập 4 (Tái Bản 2019)", "An Chi", 199000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694972478/PHOTO_LIST/Chinhtri_phapluat/018/", 
"NXB Tổng Hợp TP.HCM", 
'"Chuyện Đông Chuyện Tây"
An Chi, còn được biết đến với bút danh Huệ Thiên, là một nhà văn nổi tiếng, được biết đến rộng rãi qua mục “Chuyện Đông chuyện Tây” trên tạp chí Kiến thức ngày nay. An Chi không phải là một cụ già như nhiều người tưởng tượng, mà là một người đàn ông đã vượt qua tuổi năm mươi khi bắt đầu viết cho Kiến thức ngày nay vào năm 1990. An Chi đã trải qua nhiều thử thách trong cuộc đời, từ việc chọn miền Bắc sau Hiệp định Genève, bị thải hồi sau sáu năm dạy học ở Thái Bình, cho đến việc làm thợ nguội và thợ tiện ở Nhà máy xe đạp Thống Nhất. Tuy nhiên, những khó khăn này đã không ngăn cản được khát khao học hỏi của anh. An Chi đã dành cả cuộc đời mình để học hỏi và nghiên cứu, và anh chỉ cảm thấy mình sống thực sự sau khi về hưu non và dành cả ngày để đọc sách và viết lách',
1, "Nhà Cung Cấp:	NXB Tổng Hợp TPHCM
Tác giả:	An Chi
NXB:	NXB Tổng Hợp TPHCM
Năm XB:	2019
Trọng lượng (gr):	700
Kích Thước Bao Bì:	15 x 23 x 3.4 cm
Số trang:	664
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Những Triết Gia Vĩ Đại - Socrate - Thích Ca - Khổng Tử - Jésus", "Karl Jaspers", 900000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694972478/PHOTO_LIST/Chinhtri_phapluat/019/", 
"NXB Tổng Hợp TP.HCM", 
'"Những Triết Gia Vĩ Đại - Socrate - Thích Ca - Khổng Tử - Jésus"
Cuốn sách bạn đang cầm trong tay là bản Việt dịch từ phiên bản tiếng Pháp trong phần đầu Tập I thuộc bộ sách nhiều tập “Những triết gia vĩ đại (Les grands philosophes)” của giáo sư - nhà triết học Đức Karl Jaspers (1883 - 1969). Nội dung đề cập bốn nhân vật cổ đại đáng gọi tiêu biểu nhất trong lịch sử tư tưởng của nhân loại, với SOCRATE, THÍCH CA, KHỔNG TỬ và JÉSUS, mà tầm ảnh hưởng vẫn vang vọng mãi cho đến hôm nay, và có lẽ sẽ tiếp tục lâu dài đến tận mai sau nữa.',
1, "Nhà Cung Cấp:	NXB Tổng Hợp TPHCM
Tác giả:	Karl Jaspers
Người Dịch:	Trần Bửu Tuấn
NXB:	NXB Tổng Hợp TPHCM
Năm XB:	2022
Trọng lượng (gr):	250
Kích Thước Bao Bì:	20.5 x 14.5 x 1 cm
Số trang:	216
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Pháp Lệnh Khai Thác Và Bảo Vệ Công Trình Thủy Lợi Năm 2001 Và Các Nghị Định Hướng Dẫn Thi Hành", "Nhiều Tác Giả", 23000, 1, "https://res.cloudinary.com/dylwewmt0/image/upload/v1694972478/PHOTO_LIST/Chinhtri_phapluat/020/", 
"NXB Chính Trị Quốc Gia Sự Thật", 
'"Pháp Lệnh Khai Thác Và Bảo Vệ Công Trình Thủy Lợi Năm 2001 Và Các Nghị Định Hướng Dẫn Thi Hành"
Cuốn sách giới thiệu những quy định của pháp luật về khai thác và bảo vệ công trình thủy lợi năm 2001 và các nghị định hướng dẫn thi hành pháp lệnh: khai thác công trình thủy lợi; bảo vệ công trình thủy lợi; quản lí nhà nước về khai thác và bảo vệ công trình thủy lợi; khen thưởng và xử lí vi phạm; xử phạt vi phạm hành  chính trong lĩnh vực khai thác và bảo vệ công trình thủy lợi; nguyên tắc xử phạt; tình tiết tăng nặng, giảm nhẹ; thời hiệu xử phạt vi phạm hành chính; thời hạn được coi là chưa bị xử phạt vi phạm hành chính; vi phạm về sử dụng máy móc, thiết bị công trình thủy lợi, vi phạm về vận hành công trình thủy lợi; sử dụng giấy phép đã quá hạn;...',
1, "Tên Nhà Cung Cấp:	NXB Chính Trị Quốc Gia
NXB:	NXB Chính Trị Quốc Gia Sự Thật
Năm XB:	2013
Trọng lượng (gr):	150
Kích Thước Bao Bì:	13 x 19 cm
Số trang:	144
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Các Kỳ Thi Toán VMO - Lời Giải Và Bình Luận", "Trần Nam Dũng", 100000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020514/PHOTO_LIST/Giao_trinh/011/", 
"NXB Thế Giới", 
'"Các Kỳ Thi Toán VMO - Lời Giải Và Bình Luận"
Năm 2011, kỳ thi chọn học sinh giỏi quốc gia môn Toán, gọi tắt là VMO, đã đánh dấu bước thay đổi nổi bật trong hình thức thi khi chuyển việc thi 1 ngày với 5-7 bài toán của các năm trước đó thành kỳ thi gồm 2 ngày, ngày 1 gồm 4 bài và ngày 2 gồm 3 bài. Việc trao giải cho thí sinh cũng không còn dựa theo khung điểm mà tính theo tỷ lệ phần trăm số thí sinh tham gia. Nhìn lại quá trình 7 năm, ta có thể thấy rằng đề thi VMO đã vừa phản ánh được xu thế của phong trào Olympic trong nước vừa góp phần thúc đẩy cho phong trào đó phát triển mạnh mẽ để giữ vững được phong độ của đội tuyển Việt Nam tại đấu trường Olympic Toán quốc tế. Thông qua các đề thi VMO, chúng ta cũng hoàn toàn có thể công nhận rằng đại số và hình học là hai phân môn thế mạnh của đội tuyển Việt Nam khi kỹ thuật xử lý các bài toán này ngày một cải thiện và phát triển.',
1, "Nhà xuất bản: Trần Nam Dũng
Nhà xuất bản: Nxb Thế giới
Nhà phát hành: Sputnik
Mã Sản phẩm: 9786047734306
Khối lượng: 330.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 14.5 x 20.5 cm
Ngày phát hành: 05/2017
Số trang: 284", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Luyện Tốc Độ Giải Nhanh Trắc Nghiệm Hàm Số - Mũ Và Logarit", "Mẫn Ngọc Quang", 299000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020514/PHOTO_LIST/Giao_trinh/012/", 
"NXB Thanh Hóa", 
'"Luyện Tốc Độ Giải Nhanh Trắc Nghiệm Hàm Số - Mũ Và Logarit"
Cuốn sách Luyện Tốc Độ Giải Nhanh Trắc Nghiệm Hàm Số - Mũ và Logarit giúp các em làm quen và luyện tập thật nhiều các dạng toán hàm số hay gặp trong các đề thi. Các bài tập trong cuốn sách này được phân chia theo chuyên đề rõ ràng, có hướng dẫn lý thuyết, có bài tập mẫu và có rất nhiều các bài tập để các em thực hành. Để cải thiện nhanh tốc độ thì các em phải hiểu rõ bản chất, thuộc các dạng toán để từ đó hình thành được lối tư duy và kỹ thuật xử lý tình huống nhanh. Cuốn sách này là cơ hội tốt để các em làm được điều đó. Kho bài tập tự luyện phong phú được tác giả sưu tập từ các đề thi đại học, đề thi thử và một số bài được chọn lọc từ kho bài của thầy Nguyễn Sỹ Tùng và một số thầy cô giáo khác. Trên cơ sở các bài toán tự luận đó, tác giả đã tạo ra những câu hỏi trắc nghiệm phù hợp với đề thi 2017.',
1, "Tác giả: Mẫn Ngọc Quang
Nhà xuất bản: Nxb Thanh Hóa
Nhà phát hành: Khang Việt
Khối lượng: 836.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 20 x 30 cm
Ngày phát hành: 03/2017
Số trang: 464", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Tổng Tập Trắc Nghiệm Khoa Học Xã Hội", "Nguyễn Thị Dung, 
Nguyễn Đình Đức, Đinh Thị Sinh, Đoàn Vinh", 150000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020514/PHOTO_LIST/Giao_trinh/013/", 
"NXB Đại Học Quốc Gia Hà Nội", 
'"Tổng Tập Trắc Nghiệm Khoa Học Xã Hội"
Đổi mới trong giáo dục, đặc biệt là đổi mới trong thi cử và tuyển sinh là một nhu cầu tất yếu để phù hợp với xu thế phát triển của thời đại. Năm học 2016 - 2017, Bộ giáo dục và đào tạo đã đưa ra thay đổi; chuyển từ hình thức thi tự luận truyền thống sang thi trắc nghiệm khách quan với nhiều bộ môn, trong đó có áp dụng với khối Khoa học xã hội như Lịch sử, Địa lí, Giáo dục công dân.',
1, "Nhà xuất bản: Nxb Đại học Quốc gia Hà Nội
Nhà phát hành: Công Nghệ Giáo Dục VN
Khối lượng: 968.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 20.5 x 29.5 cm
Ngày phát hành: 2017
Số trang: 490", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Hướng Dẫn Ôn Tập Nhanh Kì Thi Trung Học Phổ Thông Quốc Gia Năm Học 2016-2017 - Toán", "Nhiều tác giả", 40000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020514/PHOTO_LIST/Giao_trinh/014/", 
"NXB Tổng hợp TP.HCM", 
'"Hướng Dẫn Ôn Tập Nhanh Kì Thi Trung Học Phổ Thông Quốc Gia Năm Học 2016-2017 - Toán"
Nhasachgiaoduc.vn giới thiệu bộ sách “Hướng dẫn ôn tập kỳ thi THPT quốc gia năm học 2016 -2017” để chuẩn bị cho kỳ thi THPT quốc gia năm học 2016-2017. Năm 2016-2017 kỳ thi THPT Quốc gia được tổ chức như sau: môn Ngữ Văn thi tự luận, còn lại các môn khác thi trắc nghiệm. Nội dung bộ sách bám sát yêu cầu chương trình giáo dục phổ thông của Bộ Giáo dục và Đào tạo, giúp các em học sinh nắm vững chuẩn kiến thức, kỹ năng của từng môn học và hỗ trợ cho giáo viên nắm vững nội dung, phương pháp, cấu trúc đề thi. Bộ sách gồm 5 quyển, cả môn thi bắt buộc và tự chọn: Toán, Ngữ văn, Tiếng Anh, Khoa học tự nhiên và Khoa học xã hội.',
1, "Nhà xuất bản: Nxb Tổng hợp TP.HCM
Nhà phát hành: Khang Việt
Khối lượng: 374.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 19 x 27 cm
Ngày phát hành: 04/2017", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Hướng Dẫn Ôn Tập Kì Thi THPT Quốc Gia Năm Học 2019 - 2020 Môn Toán", "Đoàn Quỳnh, 
Doãn Minh Cường, Nguyễn Khắc Minh, Phạm Khắc Ban, Phạm Đức Tài", 50000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020514/PHOTO_LIST/Giao_trinh/015/", 
"NXB Giáo Dục Việt Nam", 
'"Hướng Dẫn Ôn Tập Kì Thi THPT Quốc Gia Năm Học 2019 - 2020 Môn Toán"
Bộ Sách Hướng dẫn ôn tập kì thi THPT Quốc gia năm học 2019 - 2020 của nhà xuất bản giáo dục cung cấp kiến thức cơ bản và nâng cao cho học sinh tham gia kỳ thi THPT Quốc gia năm học 2019 - 2020.
Giá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....',
1, "Cấp Độ/ Lớp:	Lớp 12
Cấp Học:	Cấp 3
Nhà Cung Cấp:	Cty Phương Nam
Tác giả:	Đoàn Quỳnh, Doãn Minh Cường, Nguyễn Khắc Minh, Phạm Khắc Ban, Phạm Đức Tài
NXB:	NXB Giáo Dục Việt Nam
Năm XB:	2019
Trọng lượng (gr):	200
Kích Thước Bao Bì:	17 x 24 cm
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Công Phá Lý Thuyết Sinh Học - Quyển 2", "Nhiều tác giả", 165000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020514/PHOTO_LIST/Giao_trinh/016/", 
"NXB Đại Học Quốc Gia Hà Nội", 
'"Công Phá Lý Thuyết Sinh Học - Quyển 2"
Trong chương trình giáo dục Việt Nam, Sinh học là một trong ba môn thi chính thức của kì thi tuyển sinh quốc gia thuộc khối B và có thể là một trong những môn thi Tốt nghiệp THPT. Để đạt được kết quả cao trong các kì thi, các em phải tích cực học tập, rèn luyện cho mình những kĩ năng làm bài và thường xuyên tự kiểm tra mức độ kiến thức. Nhóm tác giả đã biên soạn cuốn “Công phá lý thuyết Sinh học, Quyển 2” nhằm đáp ứng nhu cầu của giáo viên, phụ huynh và học sinh về tài liệu ôn tập, củng cố và rèn luyện những kĩ năng. Nội dung của cuốn sách bao gồm ba phần: Di truyền học, Tiến hóa và Sinh thái học với những kiến thức từ cơ bản đến nâng cao thuộc chương trình Sinh học 12 được thể hiện qua hàng ngàn câu hỏi trắc nghiệm được phân bố dọc theo suốt 40 chuyên đề. Cẩm nang được biên soạn chi tiết, kĩ lưỡng, bám sát chương trình Sinh học THPT.',
1, "Nhà xuất bản: Nxb Đại học Quốc gia Hà Nội
Nhà phát hành: Khang Việt
Khối lượng: 440.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 16 x 24 cm
Ngày phát hành: 12/2016
Số trang: 400", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Tuyển Tập 100 Bài Văn Hay 6", "Nhiều tác giả", 60000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020514/PHOTO_LIST/Giao_trinh/017/", 
"NXB Tổng hợp TP.HCM", 
'"Tuyển Tập 100 Bài Văn Hay 6"
Cuốn sách “100 bài văn hay 6” được biên soạn theo chương trình Ngữ văn 6 (phần Văn học) của Bộ Giáo dục và Đào tạo, chương trình cải cách được áp dụng trên phạm vi toàn quốc từ năm học 2004 – 2005. Nội dung cuốn sách gồm có bốn phần: Truyện cổ dân gian, Truyện trung đại, Thơ văn hiện đại và Một số bài văn sáng tác. Độc giả mà cuốn sách hướng tới là các em học sinh khá và giỏi, hoặc đang nỗ lực phấn đấu vươn lên học khá và giỏi môn Ngữ văn lớp 6. Các bài văn mẫu được cấu trúc liên hoàn theo tác giả - tác phẩm, theo kiểu bài - dạng bài, theo kiến thức – kĩ năng, hoặc theo cụm bài và thể loại văn bản. Cách dùng từ, đặt câu, dựng đoạn và diễn đạt, các thao tác mở bài và kết bài, các kĩ năng phân tích – trích dẫn, giảng – bình, được đặc biệt quan tâm. Cuối cuốn sách có một số bài văn thuyết minh, bài kí trữ tình – những sáng tác của tuổi thơ khá hay, khá đậm đà. Đọc văn mẫu là cần thiết để tham khảo; mở rộng kiến thức văn học; tìm hiểu và học tập các thao tác như mở bài, kết bài, các thao tác phân tích – trích dẫn – liên hệ – so sánh,… Sử dụng văn mẫu phải sáng tạo và độc lập suy nghĩ. Mong rằng cuốn sách này sẽ được các em sử dụng một cách hữu ích nhất.',
1, "Nhà xuất bản: Nxb Tổng hợp TP.HCM
Nhà phát hành: Khang Việt
Khối lượng: 220.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 16 x 24 cm
Ngày phát hành: 2016
Số trang: 168", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Rèn Luyện Kỹ Năng Làm Bài Đọc Hiểu Môn Tiếng Anh", "Cô Mai Phương", 198000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020514/PHOTO_LIST/Giao_trinh/018/", 
"NXB Thanh Niên", 
'"Rèn Luyện Kỹ Năng Làm Bài Đọc Hiểu Môn Tiếng Anh"
Mở đầu cuốn sách sẽ là những kiến thức mà bạn cần biết để làm một bài Đọc hiểu, ở đây tác giả - cô Mai Phương sẽ hướng dẫn bạn từng chút để bạn dần dần làm quen, đây là điều đặc biệt quan trọng với những bạn ở trình độ căn bản. Đây là bước đệm nhỏ nhưng lại vô cùng quan trọng giúp bạn bơi trong biển lớn kiến thức của 62 cấu trúc bài đọc hiểu ở phía sau.',
1, "Tác giả: Cô Mai Phương
Nhà xuất bản: NXB Thanh Niên
Nhà phát hành: Khang Việt
Khối lượng: 660.00 gam
Ngôn ngữ: Tiếng Anh, Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 16 x 24 cm
Ngày phát hành: 03/2016
Số trang: 574", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Top 1 THCS Bồi Dưỡng Học Sinh Giỏi Toán Máy Tính Cầm Tay", "Nhóm tác giả Trần Công Diêu", 149000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020514/PHOTO_LIST/Giao_trinh/019/", 
"NXB Thanh Niên", 
'"Top 1 THCS Bồi Dưỡng Học Sinh Giỏi Toán Máy Tính Cầm Tay"
Hàng năm, các thành phố và tỉnh thành đều tổ chức kì thi Giải toán trên máy tính cầm tay cho các học sinh giỏi môn Toán và một số môn tự nhiên khác. Để có thể tham dự và đạt kết quả cao nhất thì việc trang bị đầy đủ kiến thức và kĩ năng cần thiết là một điều vô cùng quan trọng. Với mong muốn giúp các em học sinh có thể trang bị thêm cho mình hành trang trong kỳ thi chọn học sinh giỏi giải toán trên máy tính cầm tay, chúng tôi đã cố gắng cho ra đời cuốn sách Top 1 THCS Bồi Dưỡng Học Sinh Giỏi Toán - Máy Tính Cầm Tay. Cuốn sách được trình bày theo 2 chương: 
Chương 1: Các chủ đề bồi dưỡng máy tính cầm tay, được xây dựng gồm 8 chủ đề, trong mỗi chủ đề, nhóm tác giả đã trình bày theo các phần sau: 
A. Kiến thức trọng tâm, 
B. Các dạng bài tập và phương pháp giải, 
C. Bài tập tự luyện. 
Chương 2: Một số đề cấp tỉnh, thành phố và cấp quốc gia.',
1, "Tác giả: Nhóm tác giả Trần Công Diêu
Nhà xuất bản: NXB Đà Nẵng
Nhà phát hành: TCDBooks
Khối lượng: 350.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 17 x 24 cm
Ngày phát hành: 11/2021
Số trang: 220", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Chiến Lược Luyện Thi THPT - Bộ Đề Thi Trắc Nghiệm Môn Tiếng Anh", "Nhiều tác giả", 150000, 2, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695020514/PHOTO_LIST/Giao_trinh/020/", 
"NXB Đại Học Quốc Gia Hà Nội", 
'"Chiến Lược Luyện Thi THPT - Bộ Đề Thi Trắc Nghiệm Môn Tiếng Anh"
Nhóm tác giả đã biên soạn bộ sách Chiến lược luyện thi THPT - Bộ đề thi trắc nghiệm bao gồm 5 cuốn tương ứng với các môn: Toán, Ngữ văn, Tiếng Anh, Khoa học tự nhiên và Khoa học xã hội. Bộ sách được biên soạn, tuyển chọn với nội dung bám sát và bao quát toàn bộ kiến thức trong chương trình thi THPT. Nội dung bộ sách tập trung hướng dẫn học sinh ôn tập những kiến thức, kĩ năng cụ thể khi làm bài thi trắc nghiệm, kèm theo các đề tham khảo theo hướng đánh giá năng lực học sinh. Chúng tôi hy vọng bộ sách sẽ là nguồn tài liệu hữu ích giúp các em học sinh rèn luyện, ôn tập để đạt kết quả cao trong kì thi THPT sắp tới.',
1, "Tác giả: Nhiều tác giả
Nhà xuất bản: Nxb Đại học Quốc gia Hà NộiNhà phát hành: Minh Long
Khối lượng: 616.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 19 x 26 cm
Ngày phát hành: 2019
Số trang: 304", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Làm Việc Tại Nhà & Kinh Tế Số", "Nguyễn Đức Dũng", 400000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021882/PHOTO_LIST/Khoahoc_congnghe_kinhte/011/", 
"NXB Thế Giới", 
'“Làm Việc Tại Nhà & Kinh Tế Số”
Đây là một cuốn sách của tác giả Nguyễn Đức Dũng, được xuất bản bởi NXB Thế Giới vào năm 2021. Cuốn sách này nói về những tác động tiêu cực của dịch bệnh Covid-19 đối với nền kinh tế và thị trường lao động. Tác giả cũng đề cập đến việc làm việc tại nhà có thể giúp tiết kiệm chi phí cho cả tổ chức/doanh nghiệp và người lao động.',
1, "Nhà Cung Cấp:	Nguyễn Đức Dũng
Tác giả:	Nguyễn Đức Dũng
NXB:	NXB Thế Giới
Năm XB:	2021
Trọng lượng (gr):	528
Kích Thước Bao Bì:	24 x 17 x 1.6 cm
Số trang:	247
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Giữ Thế Thượng Phong Trên Bàn Đàm Phán (Tái Bản Từ Cuốn 64 Nước Cờ Trên Bàn Thương Lượng)", "Roger Dawson", 129000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021882/PHOTO_LIST/Khoahoc_congnghe_kinhte/012/", 
"NXB Lao Động", 
'"Giữ Thế Thượng Phong Trên Bàn Đàm Phán (Tái Bản Từ Cuốn 64 Nước Cờ Trên Bàn Thương Lượng)"
Thương trường như chiến trường. Đối với những nhà kinh doanh, chiến lược gia luôn là những người đứng đầu, những thuyền trưởng tài ba của con thuyền với những thuyền viên là nhân viên trong công ty. Vận mệnh con thuyền ảnh hưởng tới cuộc sống của họ. Công ty có vượt qua được những sóng gió hay không? tất cả nằm dưới bàn tay tài ba của người đứng đầu tổ chức. Một người giỏi chưa chắc mọi tình huống đều có thể xử lý nhanh nhạy, tối ưu và ngược lại nhà quản lý tồi cũng không hẳn mọi ý kiến của họ đều không hữu ích.
Giữ thế thượng phong trên bàn đàm phán là những kế sách giúp nhà quản trị có thể áp dụng để tiếp tục lãnh đạo công ty một cách tốt nhất. Được đúc kết từ những bài học xương máu của những công ty đã từng gặp phải và áp dụng những chiến lược của riêng mình. Toàn bộ cuốn sách mỗi chương là một chiến lược, mỗi chiến lược được áp dụng trong một trường hợp cụ thể. Giúp các chiến lược gia có thể tham khảo và áp dụng đối với chính trường hợp của mình.
Giữ thế thượng phong trên bàn đàm phán gồm các chương nói về hai chủ đề  thu hút: ngôn ngữ cơ thể và những ẩn ý trong cuộc đối thoại. Bạn có nhớ lý thuyết về công nghệ cảm ứng? Theo lý thuyết này thì chúng ta càng tiếp xúc với nhau nhiều qua máy móc thì những cuộc tiếp xúc trực tiếp hiếm hoi càng trở nên quan trọng. Càng bị bao vây bởi những bức e-mail và những tin nhắn ngày càng trở nên ngắn gọn, chúng ta càng mong được hiểu nhau nhiều hơn. Cũng có rất nhiều chương bổ sung nói về việc hòa giải và trọng tài. Đó là một thay đổi lớn trong thế giới của chúng ta, một thay đổi rất đáng hoan nghênh. Ngoài ra cuốn sách nói nhiều tới việc làm thế nào để thương lượng hiệu quả. Thương lượng Hiệu quả đi theo một cách tiếp cận khác. Nó chỉ ra cách chiến thắng ở bàn thương lượng nhưng để đối phương có cảm giác là họ vẫn thắng.',
1, "Tên Nhà Cung Cấp:	Thái Hà
Tác giả:	Roger Dawson
NXB:	NXB Lao Động
Năm XB:	2018
Trọng lượng (gr):	450
Kích Thước Bao Bì:	15,5 x 24
Số trang:	440
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("The Leadership Gap", "Lolly Daskal", 139000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021882/PHOTO_LIST/Khoahoc_congnghe_kinhte/013/", 
"NXB Đại học Kinh tế Quốc dân", 
'"The Leadership Gap"
Bạn là một con người đầy khuyết điểm. Nhưng bạn vẫn có thể trở thành một nhà lãnh đạo xuất sắc.
Đây là quan điểm đột phá của Lolly Daskal - một trong những nhà đào tạo lãnh đạo được săn đón nhiều nhất trên thế giới, người được Inc.com tôn vinh trong "Top 50 chuyên gia về quản trị và lãnh đạo hàng đầu", và là "Người phụ nữ truyền cảm hứng nhất trên thế giới" theo Huffington Post.
Theo Daskal, nhiều khi những tố chất lãnh đạo bạn cho là nổi trội nhất của mình lại là thứ cản trở bạn vươn tới những điều lớn lao; trong khi những gì bạn coi là lỗ hổng, là khuyết điểm lại có thể trở thành nền tảng cho sự vĩ đại - miễn rằng bạn biết cách lấp đầy chúng, biến chúng thành ưu thế của mình.
Trong cuốn sách "The Leadership Gap", Daskal giải thích tường tận cho độc giả vì sao mỗi nhà lãnh đạo đều tiềm ẩn những tố chất để trở nên vĩ đại. Mô hình lãnh đạo cô cung cấp có thể được áp dụng cho các nhà lãnh đạo ở mọi cấp bậc để cải thiện đáng kể kết quả hoạt động Nó bắt đầu bằng việc xác định hình mẫu người lãnh đạo lý tưởng của bạn và nhìn nhận những khuyết điểm của người đó. Đọc tác phẩm này, bạn sẽ có được cái nhìn hoàn toàn mới mẻ về những điều cần làm, cần suy nghĩ để thực sự trở thành nhà lãnh đạo bạn hằng mong muốn.',
1, "Tên Nhà Cung Cấp:	1980 Books
Tác giả:	Lolly Daskal
Người Dịch:	Kim Phụng
NXB:	NXB Đại học Kinh tế Quốc dân
Năm XB:	2018
Trọng lượng (gr):	380
Kích Thước Bao Bì:	13 x 20.5
Số trang:	368
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Frugal Innovation - Làm Tốt Hơn Với Nguồn Lực Ít Hơn", "Jaideep Prabhu, Navi Radjou", 220000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021882/PHOTO_LIST/Khoahoc_congnghe_kinhte/014/", 
"NXB Thế Giới", 
'“Frugal Innovation - Làm Tốt Hơn Với Nguồn Lực Ít Hơn” 
Đây là một cuốn sách của tác giả Radjou và Prabhu, cung cấp những chỉ dẫn cần thiết để doanh nghiệp tiếp cận phương pháp đổi mới sáng tạo tiết kiệm đúng cách. Tác giả đã vẽ ra một bức tranh sống động về cách thức doanh nghiệp có thể pha trộn các giá trị và chất lượng để mang lại sự cân bằng cá nhân và xã hội mà những người tiêu dùng của thế kỷ 21 mong muốn.
Cuốn sách này gồm 9 chương, trong đó tác giả cho chúng ta thấy các đặc tính độc đáo của đổi mới sáng tạo tiết kiệm là gì? Và tại sao đổi mới sáng tạo tiết kiệm lại trở thành một vấn đề mang tính cấp thiết hàng đầu với đội ngũ quản lý ngày nay, đồng thời đi vào tìm hiểu chi tiết hơn về câu hỏi “làm thế nào” để đổi mới sáng tạo tiết kiệm. Cuốn sách đã mô tả đầy đủ sự chuyển đổi và một vài khó khăn gặp phải trong quá trình thực hiện đổi mới sáng tạo tiết kiệm, đồng thời liệt kê các giải pháp thiết thực cho các doanh nghiệp mong muốn đổi mới sáng tạo nhiều hơn với chi phí thấp hơn.',
1, "Tên Nhà Cung Cấp:	Saigon Books
Tác giả:	Jaideep Prabhu, Navi Radjou
Người Dịch:	Phạm Quốc Anh
NXB:	Thế Giới
Năm XB:	2022
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	350
Kích Thước Bao Bì:	23.5 x 15.5 x 2 cm
Số trang:	348
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Biến Doanh Nghiệp Thành Đế Chế Của Kỉ Luật Và Thành Công", "James Biết Tuốt, Oopsy", 118000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021882/PHOTO_LIST/Khoahoc_congnghe_kinhte/015/", 
"NXB Thanh Niên", 
'"Biến Doanh Nghiệp Thành Đế Chế Của Kỉ Luật Và Thành Công"
“Tư duy được đến đâu, hành động được đến đó.” 
Nhìn hệ thống nhân sự như một tài sản chiến lược, nhà quản trị sẽ biết cách sinh lời từ đấy. 
Ai chỉ thấy hoạt động nhân sự là chi phí sẽ đánh mất một tài sản giá trị và làm tăng gánh nặng cho công ty. 
Hệ thống nhân sự là một loại tài sản vô hình, mà nếu không tận dụng, bạn sẽ phải đánh đổi nhiều thứ cho nó. 
Bộ phận nhân sự tưởng chừng chỉ bó gọn trong vài hoạt động, hóa ra đóng vai trò vô cùng quan trọng, có thể thay đổi cả hệ thống công ty.
Đừng lãng phí tiềm lực nhân sự, bởi nó là mỏ vàng cần khai thác. Vấn đề không chỉ là cách nhìn, và đây không phải là một trò chơi tâm trí.
Bởi vì hệ thống nhân sự thực sự mang lại tiền cho bạn, lần đầu tiên thứ tài sản vô hình này được tính toán bằng những con số cụ thể. Cuốn sách này chỉ cho bạn cách làm một việc mà nhiều người vẫn cho là bất khả: định giá các chiến lược nhân sự.
Chính thức thừa nhận vai trò của các chiến lược nhân sự sẽ biến công ty bạn thành một hệ thống nhất cân bằng, thay vì là một cỗ máy rời rạc mà các bộ phận chạy riêng rẽ nhau.
Chính vào lúc này doanh nghiệp sẽ phát huy được sức mạnh lớn nhất.
Chính vào lúc này, bạn phải BIẾN DOANH NGHIỆP THÀNH ĐẾ CHẾ CỦA KỶ LUẬT VÀ THÀNH CÔNG',
1, "Tên Nhà Cung Cấp:	ZenBooks
Tác giả:	James Biết Tuốt, Oopsy
NXB:	NXB Thanh Niên
Năm XB:	2019
Trọng lượng (gr):	300
Kích Thước Bao Bì:	13.5 x 20 x 1.5 cm
Số trang:	280
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Thời Đại Thứ Tư", "Byron Reese", 228000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021882/PHOTO_LIST/Khoahoc_congnghe_kinhte/016/", 
"NXB Dân Trí", 
'"Thời Đại Thứ Tư"
Mở đầu cuốn sách là chuyến hành trình nhìn lại lịch sử loài người cách nay 100.000 năm. Nói như tác giả Byron Reese, xuyên suốt chiều dài của nền văn minh nhân loại, chúng ta chỉ có 3 lần thay đổi lớn lần lượt là khi lửa, nông nghiệp và chữ viết được phát minh. Và với sự xuất hiện của AI, chúng ta đang tiến gần đến lần thay đổi thứ tư. “Cả thế giới sẽ thay đổi. Chúng ta thật sự đang ở giai đoạn bình minh của một thời đại mới”, Byron Reese nhấn mạnh.
Trong những phần sau của cuốn sách, tác giả tập trung phân tích tường tận về rô-bốt và trí tuệ nhân tạo, đồng thời phác họa những khả năng có thể xảy ra trong tương lai, khi trí tuệ nhân tạo trở nên “thông minh” và “trí tuệ” hơn gấp nhiều lần so với hiện tại.
THỜI ĐẠI THỨ TƯ thảo luận những tiến bộ vượt bậc trong lĩnh vực rô-bốt và AI như: Trí tuệ nhân tạo sẽ đạt được “trí tuệ” như thế nào? Máy móc có thể có ý thức, óc sáng tạo, trí tưởng tượng, trí thông minh cảm xúc, xã hội và sự độc đáo như con người không? AI có khiến việc làm biến mất không? Có công việc nào không dành cho máy móc không? Công nghệ sẽ khiến mối quan hệ giữa người giàu và người nghèo thay đổi ra sao? Con người sẽ định vị bản thân như thế nào trong một thế giới đầy rẫy những thiết bị mạnh mẽ và có thể thông minh hơn chúng ta?
Nội dung sách không quá nặng về kiến thức kỹ thuật, mà tập trung làm rõ những vấn đề đạo đức, xã hội, triết học… liên quan đến trí tuệ nhân tạo. Suy cho cùng, lý do của những quan điểm trái chiều xoay quanh AI, nằm ở sự khác biệt trong niềm tin của chúng ta về chính mình. Liệu có gì đó “siêu việt”, thần bí nơi con người mà rô-bốt không thể đạt đến hay không? Khi máy móc dần thay thế chúng ta làm việc và lao động, ta cũng sẽ tự hỏi bản thân nhiều hơn về ý nghĩa của việc làm người. Như lời của Kevin Kelly – Chủ biên tạp chí Wired: “Chúng ta cần AI nói cho chúng ta biết chúng ta là ai”.',
1, "Tên Nhà Cung Cấp:	FIRST NEWS
Tác giả:	Byron Reese
Người Dịch:	Lương Trọng Vũ
NXB:	Dân Trí
Năm XB:	2023
Trọng lượng (gr):	500
Kích Thước Bao Bì:	20.5 x 15 x 2.4 cm
Số trang:	480
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Chat GPT - Ứng Dụng Trí Tuệ Nhân Tạo Trong Công Việc", "Dr. Gleb Tsipursky", 169000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021882/PHOTO_LIST/Khoahoc_congnghe_kinhte/017/", 
"NXB Dân Trí", 
'"Chat GPT - Ứng Dụng Trí Tuệ Nhân Tạo Trong Công Việc"
Sự ra mắt của Chat GPT đã gây nên một cơn sốt toàn cầu, mang đến nhiều kỳ vọng nhưng cũng rất nhiều lo ngại. Công cụ này được mệnh danh l&agrave trí tuệ nhân tạo AI thông minh nhất thế giới và có thể trò chuyện, trả lời đầy đủ bất kỳ các câu hỏi mà bạn đưa ra. Với một “kho kiến thức" vô cùng phong phú, Chat GPT được xem là một mô hình ngôn ngữ tiên tiến nhất hiện nay.
Vậy làm sao để có thể sử dụng Chạt GPT vào công việc, học tập, cuộc sống của mình một cách hiệu quả. Cuốn sách “CHAT GPT” sẽ hướng dẫn bạn cách khai thác năng lực của trí tuệ nhân tạo để có thêm một trợ thủ đắc lực, từ đó cải thiện tối đa hiệu suất làm việc và mở ra hướng đi để bạn duy trì vị thế đứng đầu trong những lĩnh vực nhiều cạnh tranh. Cuốn sách sẽ giúp bạn tìm hiểu những kiến thức cơ bản nhất xoay quanh Chat GPT và cách ứng dụng nó để lên một nội dung thuyết trình, dàn ý podcast, nội dung trên mạng xã hội, thậm chí lập một kế hoạch tiếp thị.
Mục tiêu của cuốn sách là trao cho độc giả những kiến thức và công cụ cần thiết để khai thác sức mạnh của trí tuệ nhân tạo. Vì vậy, nếu bạn đã sẵn sàng đưa khả năng sáng tạo nội dung của mình lên một tầm cao mới, hãy tìm hiểu kỹ cuốn sách này và khám phá những khả năng vô tận mà Generative AI có thể mang lại. Với sự trợ giúp của ChatGPT, bạn có thể tạo ra những ý tưởng mới và đột phá, phân tích dữ liệu và tạo ra những nội dung cá nhân hóa đầy thu hút. Tương lai của việc sáng tạo nội dung chính là đây, và bây giờ là lúc ta khai thác sức mạnh của AI để luôn dẫn đầu với tư cách là một nhà lãnh đạo tư tưởng.',
1, "Tên Nhà Cung Cấp:	1980 Books
Tác giả:	Dr. Gleb Tsipursky
Người Dịch:	Hạnh Dung
NXB:	Dân Trí
Năm XB:	2023
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	320
Kích Thước Bao Bì:	19 x 13 x 1.5 cm
Số trang:	300
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("NFT - Cuộc Cách Mạng Công Nghệ Tiếp Nối Blockchain Và Kỷ Nguyên Tiền Điện Tử", "Marc Beckman", 159000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021882/PHOTO_LIST/Khoahoc_congnghe_kinhte/018/", 
"NXB Công Thương", 
'"NFT - Cuộc Cách Mạng Công Nghệ Tiếp Nối Blockchain Và Kỷ Nguyên Tiền Điện Tử"
"NFT, tức Non-Fungible Token (token không thể thay thế), là cách tân kỹ thuật số quan trọng nhất kể từ sau sự xuất hiện của blockchain và tiền mã hóa. NFT sở hữu tiềm lực thay đổi hoàn toàn thế giới, về tất cả mọi khía cạnh. Cuốn sách “The Comprehensive Guide: NFTs, Digital Artwork, Blockchain Technology” của tác giả Marc Beckman đi sâu vào nền tảng của công nghệ NFT theo một khung nội dung mạch lạc, đi kèm với những giải thích chi tiết cùng ví dụ sinh động, giúp bất cứ ai cũng có thể hiểu được bản chất của NFT và tiềm năng của công nghệ mới này trong thời gian ngắn nhất.
Chúng ta sẽ khám phá cách mà NFT có thể tạo ra một loại tài sản hoàn toàn mới cũng như các cơ hội đầu tư chưa từng có. NFT đã và đang được ứng dụng trong giới mỹ thuật, lĩnh vực game, thể thao, âm nhạc… và khiến những nhóm người tưởng như không mấy quan tâm đến các cải tiến về công nghệ cũng sẵn sàng thay đổi để đón nhận làn gió mới. Bên cạnh những con số khổng lồ xoay quanh các thương vụ NFT, chúng ta sẽ còn phải choáng ngợp trước sự hữu ích không thể chối cãi mà NFT đem lại. Nếu như được sử dụng đúng cách, NFT sẽ là chiếc chìa khóa giải quyết vô số vấn đề về bảo mật và giả mạo, làm những rủi ro thường gắn liền với tài sản chỉ còn là câu chuyện quá khứ. Bên cạnh đó, NFT còn hứa hẹn sẽ cải thiện vượt bậc hiệu suất vận hành của chính phủ và các tổ chức, doanh nghiệp, cũng như cắt giảm được những khoản phí đắt đỏ, khi nó giúp các giao dịch có thể diễn ra nhanh chóng và đáng tin cậy, loại bỏ sự tham gia của các bên trung gian.
Nếu không muốn bị tụt hậu và trở thành kẻ chậm chân trong cuộc chơi này, hãy sớm tìm hiểu và trang bị cho mình những kiến thức cơ bản về làn sóng NFT. Cuốn sách của Marc Beckman chính là trợ thủ đắc lực của bạn."',
1, "Tên Nhà Cung Cấp:	1980 Books
Tác giả:	Marc Beckman
Người Dịch:	Hạnh Dung
NXB:	NXB Công Thương
Năm XB:	2022
Trọng lượng (gr):	350
Kích Thước Bao Bì:	19 x 13 x 1 cm
Số trang:	296
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Lối Sống Tối Giản Thời Công Nghệ Số", "Cal Newport", 149000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021882/PHOTO_LIST/Khoahoc_congnghe_kinhte/019/", 
"NXB Công Thương", 
'“Chủ nghĩa tối giản số” của Cal Newport 
Đây là một triết lý sử dụng công nghệ, trong đó bạn tập trung thời gian trực tuyến của mình vào một số ít các hoạt động được lựa chọn cẩn thận và tối ưu hóa để hỗ trợ mạnh mẽ những thứ bạn đánh giá cao. Cuốn sách này không chỉ là một bộ các nguyên tắc, mà còn là con đường giúp bạn xây dựng một cuộc sống đáng sống trong kỷ nguyên hiện đại với sự hiện diện khắp nơi của các thiết bị đầy mê hoặc.
Cal Newport, giáo sư khoa học máy tính tại Đại học Georgetown, đã có nhiều bài viết về sự giao thoa giữa công nghệ số và văn hóa. Ông đã nghiên cứu về tác động tiêu cực của hoạt động trực tuyến không kiểm soát đối với sức khỏe tâm lý. Hoạt động trao đổi trực tuyến dường như càng đẩy nhanh người ta vào các trạng thái cực đoan gây ra những sự căng thẳng và kiệt quệ về mặt cảm xúc.
Bạn có thể mua sách này qua các trang web sách trực tuyến.',
1, "Tên Nhà Cung Cấp:	Thái Hà
Tác giả:	Cal Newport
Người Dịch:	Khánh Trang
NXB:	NXB Công Thương
Năm XB:	2020
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	380
Kích Thước Bao Bì:	20.5 x 13 cm
Số trang:	376
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Khoa Học Khám Phá - Lược Sử Thời Gian (Tái Bản 2022)", "Stephen Hawking", 115000, 3, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695021882/PHOTO_LIST/Khoahoc_congnghe_kinhte/029/", 
"NXB Trẻ", 
'"Khoa Học Khám Phá - Lược Sử Thời Gian (Tái Bản 2022)"
Tò mò là một trong những phẩm chất bẩm sinh vô cùng quan trọng của chúng ta, và những vấn đề như Bản chất của vũ trụ là gì? Vũ trụ từ đâu ra? Chúng ta đến từ đâu và đóng vai trò gì trong vũ trụ? Có giới hạn cho sự nhận thức của con người không?... là những câu hỏi mà biết bao nhiêu thế hệ con người đã đặt ra dưới dạng này hoặc dạng khác từ khi bắt đầu biết nhận thức và suy ngẫm về thế giới này. Tất cả những vấn đề được nên ra trong tác phẩm Lược sử thời gian như Vũ trụ giãn nở, Lỗ đen, Nguồn gốc và số phận của vũ trụ, Mũi tên thời gian… đều là mong muốn của tác giả để phần nào trả lời được những câu hỏi đó, và hướng tới việc giải thích các giai đoạn lịch sử của toàn bộ vũ trụ.
Bằng ngôn ngữ sáng sủa, lập luận chặt chẽ rất thuyết phục, và sự dí dỏm rất riêng, tác giả Stephen Hawking đặt ra cho mình nhiệm vụ diễn tả những điều phức tạp nhất trong vật lý học một cách dễ hiểu đối với mọi người, không dùng bất kỳ công thức toán học nào, trừ phương trình nổi tiếng của Einstein: E = mc2',
1, "Tên Nhà Cung Cấp:	NXB Trẻ
Tác giả:	Stephen Hawking
NXB:	Trẻ
Năm XB:	2022
Trọng lượng (gr):	300
Kích Thước Bao Bì:	20.5 x 14.5 x 1.2 cm
Số trang:	284
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Đồng Bằng Sông Cửu Long - Nét Sinh Hoạt Xưa, Văn Minh Miệt Vườn", "Sơn Nam", 105000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695026045/PHOTO_LIST/Sach_truyen_tieuthuyet/011/", 
"NXB Trẻ", 
'"Đồng Bằng Sông Cửu Long - Nét Sinh Hoạt Xưa, Văn Minh Miệt Vườn"
Đây là tập sách của nhà Nam Bộ học Sơn Nam về những sinh hoạt truyền thống của nhân dân Đồng bằng song Cửu Long thông qua những lễ hội và hò vè đối đáp cũng những sinh hoạt của cư dân vùng Miệt Vườn Nam Bộ trong lịch sử hình thành, xây dựng và phát triển vùng đất phía Nam của Tổ quốc, ưu tiên nghiên cứu các đặc tính dân tộc vùng Miệt Vườn có khác nhiều so với cư dân Miệt Thứ - là vùng đất mới bồi lấp khai khẩn với những hạn chế về địa lý. ',
1, "Tên Nhà Cung Cấp:	NXB Trẻ
Tác giả:	Sơn Nam
NXB:	NXB Trẻ
Năm XB:	2018
Trọng lượng (gr):	400
Kích Thước Bao Bì:	14 x 20
Số trang:	388
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Nắng Xuyên Qua Vòm Lá", "Glendy Vanderah", 249000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695026045/PHOTO_LIST/Sach_truyen_tieuthuyet/012/", 
"NXB Thanh Niên", 
'"Nắng Xuyên Qua Vòm Lá"
Sau Nơi khu rừng chạm tới những vì sao, Glendy Vanderah (tác giả sách bán chạy theo bình chọn của Wall Street Journal) đã tiếp nối những cảm xúc thứ tha và chữa lành ấy bằng một cuốn tiểu thuyết tuyệt diệu về tình yêu, sự mất mát và hành trình khám phá bản thân, The light through the leaves.
Câu chuyện bắt đầu từ một sai lầm không thể chịu nổi ở bìa rừng.
Trong cơn bấn loạn ấy, Ellis Abbey đã vô tình rời mắt khỏi cô con gái của mình, Viola – dù chỉ trong vài phút. Nhưng khi cô quay lại, Viola đã biến mất. Vết nứt sẵn trong cuộc hôn nhân của họ đã toác rộng hơn, cùng với đó vụ bắt cóc cũng khiến Ellis biến mất – mà thực ra là cô đã vùi mình trong đau buồn, tội lỗi và nghiện ngập. Với suy nghĩ rằng mình chỉ mang lại sự đen đủi cho gia đình, Ellis đã bỏ lại chồng cùng hai cậu con trai nhỏ, vùi sâu hơn nỗi đau đớn đến tuyệt vọng về các con trong hành trình độc bước vào một vùng núi hoang vu.
Ở một vùng hẻo lánh của Washington, một cô gái trẻ tên Raven cũng giữ chặt những bí mật trong lòng. Cô không bao giờ hé nửa lời với người ngoài về việc mẹ cô đã tạo ra những phép màu sinh ra từ đất như thế nào hay cha cô, người mà sự hiện diện bí ẩn của ông đôi khi khiến cô sợ hãi. Raven dành hết thời gian của mình để học cách sử dụng những món quà quý hiếm – mà thực ra là tìm cách giấu chúng. Mỗi bài học thu được đều cảnh báo cô về những mối nguy hiểm đang rình rập bên ngoài thiên đường biệt lập của cô. Nhưng bất chấp những lời cảnh báo của mẹ, Raven vẫn khao khát một điều gì đó hơn thế nữa.
Khi Ellis và Raven đối mặt với những khao khát mạnh mẽ của riêng mình, hành trình của họ đã hội tụ theo những cách đầy bất ngờ và thấm đẫm hy vọng, để rồi cuối cùng họ đã được kéo lại gần nhau bởi sức mạnh của thiên nhiên, tình yêu và gia đình.',
1, "Tên Nhà Cung Cấp:	1980 Books
Tác giả:	Glendy Vanderah
Người Dịch:	Lâm Đức Duy
NXB:	Thanh Niên
Năm XB:	2023
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	550
Kích Thước Bao Bì:	24 x 16 x 2.5 cm
Số trang:	532
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Chia Rẽ - Tại Sao Chúng Ta Đang Sống Trong Thời Đại Của Những Bức Tường", "Tim Marshall", 200000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695026045/PHOTO_LIST/Sach_truyen_tieuthuyet/013/", 
"NXB Dân Trí", 
'"Chia Rẽ - Tại Sao Chúng Ta Đang Sống Trong Thời Đại Của Những Bức Tường"
Tim Marshall, một ký giả kỳ cựu và tác giả nổi tiếng, đã viết sáu cuốn sách, trong đó có “Những tù nhân của địa lý” và “Chia rẽ”. Trong “Chia rẽ”, Marshall khám phá sự chia rẽ trong xã hội hiện đại, từ những bức tường vật chất cho đến những bức tường vô hình trong tâm trí con người. Ông cho rằng sự chia rẽ không chỉ xuất hiện ở mặt vật chất mà còn ẩn chứa trong tâm trí mỗi người. Marshall cung cấp nhiều ví dụ từ khắp nơi trên thế giới để minh họa cho điều này, từ Trung Quốc, Hoa Kỳ, Vương quốc Anh, châu Âu, Trung Đông cho đến châu Phi. Cuối cùng, dù thế giới hiện nay đang chứng kiến sự gia tăng của chủ nghĩa dân tộc và chính trị bản sắc, Marshall vẫn hy vọng rằng lịch sử sẽ xoay hướng về phía đoàn kết và thống nhất.',
1, "Tên Nhà Cung Cấp:	Nhã Nam
Tác giả:	Tim Marshall
Người Dịch:	Trần Trọng Hải Minh
NXB:	NXB Dân Trí
Năm XB:	2021
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	600
Kích Thước Bao Bì:	20.5 x 14 cm
Số trang:	396
Hình thức:	Bìa Cứng", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Ta Mù Tịt!", "Jorge Cham, Daniel Whiteson", 150000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695026045/PHOTO_LIST/Sach_truyen_tieuthuyet/014/", 
"NXB Thế Giới", 
'"Ta Mù Tịt!"
Ngày 10 tháng Tư năm 2019, Cơ quan Hàng không Vũ trụ Hoa Kỳ (NASA) công bố bức ảnh về lỗ đen nằm ở trung tâm thiên hà Messier 87 (M87) cách Trái đất khoảng 55 triệu năm ánh sáng, đánh dấu một bước tiến trong lịch sử khám phá vũ trụ của con người.
Nhưng bạn không cần phải đi xa như thế mới có thể tìm hiểu về vũ trụ. Chúng ta còn vô vàn những điều không biết về khoảng không bao la ngoài kia, những câu hỏi lớn mà bạn có thể nghĩ là ta đã có đáp án nhưng thực ra lại chưa: Vũ trụ được tạo thành từ cái gì? Thành phần cơ bản nhất của vật chất là gì? Chúng tương tác với nhau như thế nào? Hay đơn giản hơn, bạn có chắc mình biết rõ các khái niệm về khối lượng, chiều không gian, thời gian... không?
Bạn sẵn sàng chưa? Bởi vì như Henry Reich, người sáng lập ra MinutePhysics, đã nhận xét về cuốn sách này, “bạn không thường xuyên bắt gặp một cuộc khám phá đầy lạc quan và vui nhộn như vậy về sự ngu ngốc của con người đâu.”
“Một cuốn sách sống động, bất khả tri về vật lý và những thứ nằm ngoài vật lý... Một tổng hợp giàu tính giải trí và giáo dục dành cho bất cứ ai đang tìm cách trau dồi hay bổ sung kiến thức của bản thân.” - Kirkus Reviews',
1, "Tên Nhà Cung Cấp:	Nhã Nam
Tác giả:	Jorge Cham, Daniel Whiteson
Người Dịch:	Nguyễn Duy Khánh
NXB:	NXB Thế Giới
Năm XB:	2019
Trọng lượng (gr):	400
Kích Thước Bao Bì:	15.5 x 24 cm
Số trang:	396
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Tổ Chim Sẻ Nâu", "Nguyễn Bảo Trung", 140000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695026045/PHOTO_LIST/Sach_truyen_tieuthuyet/015/", 
"NXB Dân Trí", 
'"Tổ Chim Sẻ Nâu"
Đối thoại với thiên nhiên để rồi tìm được bình yên trước cuộc sống đổi thay khó lường
“Đừng cố gắng đợi thấy cầu vồng mà quên tận hưởng cơn mưa”
“Tất cả đều cần có thời gian. Như vết thương, chúng ta phải chấp nhận và chờ đợi cơ thể tự chữa lành, đôi khi càng nóng vội mong nhanh hết càng làm mình tổn thương sâu hơn.”
Tiếp nối kho tác phẩm vốn đã phong phú, bác sĩ Nguyễn Bảo Trung tiếp tục ra mắt “Tổ chim sẻ nâu”  trong sự mong chờ, với một cốt truyện hoàn toàn mới mẻ, thú vị khi bác sĩ viết về cuộc trò chuyện giữa anh và chú chim sẻ nâu mỗi ngày đều đến bên cửa sổ.
Chú chim sẻ nâu khao khát trở thành phượng hoàng, bay lên trời cao với bao mong ước về một bầu trời rộng lớn. Trải qua những cuộc đối thoại, anh vẫn khuyên chim sẻ nâu hãy cứ là sẻ nâu, nhưng vẫn hãy giữ nguyên khao khát hoá phượng hoàng ấy.
“Đến một ngày chúng ta có sao biểu hiện vậy, không còn tị hiềm so sánh, không còn muốn trở thành ai, cứ là chính mình ... đó là ngày chúng ta thật sự giải thoát.” Nhưng hãy cứ mơ ước điên rồ vì “Không có một đời sống nào toàn vẹn nếu không có một chút điên khùng. Không có tình yêu nào thành thơ ca, nhạc họa, vĩnh hằng nếu không có một chút dại khờ, si mê.”
Không chỉ câu chuyện về chim sẻ nâu, chính cuộc đối thoại giữa hai chủ thể đã gợi mở cho chúng ta nhiều suy ngẫm về cuộc sống, triết lý cuộc đời. Bác sĩ kể về những phút giây bất lực của mình, về những số phận mỗi bệnh nhân, có lúc bổng lúc trầm, muôn màu muôn vẻ. Đó là câu chuyện của những bệnh nhân bị ung thư, của cô con gái chứng kiến giây phút cuối cùng của ba mình, của cô bác sĩ tài sắc nhưng tình duyên lận đận… Mỗi câu chuyện là một bài học, một góc nhìn về cuộc đời được thể hiện vô cùng nhẹ nhàng, đầy chất thơ qua văn phong của bác sĩ Nguyễn Bảo Trung.
“Ngày chúng ta tìm ra chính mình, chấp nhận chính mình là ngày chúng ta trở thành vua và sống hạnh phúc trong vương quốc của mình.”',
1, "Tác giả:	Nguyễn Bảo Trung
NXB:	Dân Trí
Năm XB:	2022
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	250
Kích Thước Bao Bì:	19 x 12 cm
Số trang:	232
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Tâm Lý Học Về Khắc Chế Cơn Giận - Đừng Để Cơn Giận Thay Đổi Con Người Bạn", "Tằng Kiệt", 168000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695026045/PHOTO_LIST/Sach_truyen_tieuthuyet/016/", 
"NXB Hồng Đức", 
'"Tâm Lý Học Về Khắc Chế Cơn Giận - Đừng Để Cơn Giận Thay Đổi Con Người Bạn"
Nhà lãnh đạo quân sự nổi tiếng Napoleon từng nói: "Một người có thể kiểm soát cảm xúc của mình còn vĩ đại hơn một vị tướng có thể đánh hạ một thành trì." Khi ta tức giận thì sẽ luôn có "lửa vô minh" bừng cháy trong lòng. Khi con người khởi tâm "sân si" tức là đã thua rồi, loại người không thể làm chủ được cảm xúc sẽ vĩnh viễn không thể làm chủ được cuộc đời của họ, dẫn đến đánh mất đi lí trí, ngày càng trầm luân. Cuốn sách Tâm lý học về khắc chế cơn giận - Đừng để cơn giận thay đổi con người bạn chính là chìa khoá giúp bạn quản trị cảm xúc của chính mình.
Nội dung cuốn sách Tâm lý học về khắc chế cơn giận
Cuốn sách này bắt đầu bằng việc tiết lộ chân tướng của sự tức giận, cho chúng ta biết ý nghĩa, nguyên nhân và hậu quả của sự tức giận, tiếp theo sẽ phân tích chi tiết 7 loại tức giận thường gặp trong cuộc sống và cách đối phó với chúng. Cuối cùng, hai chương còn lại để thảo luận cho câu hỏi làm thế nào để thay đổi phương thức tư duy méo mó của bản thân, xây dựng lại phương thức quản lý nội tâm, biến cơn tức giận thành vô hình, từ đó để nội tâm đạt được sự ổn định, tự tin và sức mạnh.',
1, "Tên Nhà Cung Cấp:	MCBooks
Tác giả:	Tằng Kiệt
Người Dịch:	Vũ Thu Hoài
NXB:	Hồng Đức
Năm XB:	2023
Trọng lượng (gr):	300
Kích Thước Bao Bì:	20.5 x 14 x 1.4 cm
Số trang:	288
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Hãy Chăm Sóc Mẹ", "Shin Kyung-Sook", 106000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695026045/PHOTO_LIST/Sach_truyen_tieuthuyet/017/", 
"NXB Dân Trí", 
'"Hãy Chăm Sóc Mẹ"
Tác phẩm Hãy chăm sóc mẹ của nhà văn Hàn Quốc Kyung-sook Shin mở đầu bằng khung cảnh xáo trộn của một gia đình. Mẹ bị lạc khi chuẩn bị bước lên tàu điện ngầm cùng bố ở ga Seoul. Hai ông bà dự định lên đây thăm cậu con cả. Con gái đầu, Chi-hon, là người đứng ra viết thông báo tìm người lạc thay cho cả gia đình. “Ngoại hình: Tóc ngắn đã muối tiêu, xương gò má cao, khi đi lạc đang mặc áo sơ mi xanh da trời, áo khoác trắng, váy xếp nếp màu be”. Trong tiềm thức của mình, Chi-hon vẫn nghĩ mẹ là người thường“bước đi giữa biển người với phong thái có thể đe dọa cả những tòa nhà lừng lững đang nhìn thẳng xuống từ trên cao”. Trong khi đó, những người qua đường đáp lại thông báo tìm người lạc của cô bằng miêu tả về một “một bà già cứ lững thững bước đi, thỉnh thoảng lại ngồi bệt xuống đường hay đứng thẫn thờ trước cầu thang cuốn”. Liệu đó có phải là người mẹ mà cả gia đình cô đang cất công tìm kiếm?
Một ngày, một tuần rồi gần một tháng chầm chậm trôi qua. Người chồng và những đứa con hiện đều đã phương trưởng cả không chỉ lo sốt vó mà còn day dứt tâm can vì cảm giác tội lỗi, và rối bời “trong nỗi hoảng loạn như thể tất cả mọi người đều bị tổn thương ở vùng não”. Họ cũng lấy làm băn khoăn tại sao mẹ không biết hỏi đường về nhà cậu con cả cho đến khi phát hiện ra hai sự thật rằng mẹ không biết chữ và mẹ bệnh ung thư vú khiến đầu óc không được minh mẫn như thường.
Từ đây, những hy vọng tìm lại mẹ càng trở nên mong manh hơn… -
Nhận định về tác phẩm
“Cuốn sách của tác giả nổi tiếng nhất Hàn Quốc này có thể làm mọi độc giả phải rơi nước mắt.” - Library Journal
“Cảm động và ám ảnh.” - Newsday
“Phần là câu chuyện về sự chuyển dịch của xã hội Hàn Quốc từ nông thôn ra thành thị, phần là khúc ca về sức mạnh của mối ràng buộc gia đình được hình thành từ sự quên mình của người phụ nữ; đây là một tác phẩm vô cùng cảm động.” - Kirkus Reviews
“Nao lòng… Thấm thía… Người đọc sẽ tìm thấy sự đồng cảm trong câu chuyện về gia đình bán chạy nhất Hàn Quốc từ trước tới nay này.” - Publishers Weekly',
1, "Tên Nhà Cung Cấp:	Nhã Nam
Tác giả:	Shin Kyung-Sook
Người Dịch:	Lê Hiệp Lâm, Lê Nguyễn Lê
NXB:	Dân Trí
Năm XB:	2023
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	340
Kích Thước Bao Bì:	20.5 x 14 x 1 cm
Số trang:	323
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Nếu Thiếu Vắng Tình Thương Của Cha...", "Hồ Thận Chi", 165000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695026045/PHOTO_LIST/Sach_truyen_tieuthuyet/018/", 
"NXB Hồng Đức", 
'"Nếu thiếu vắng tình thương của cha"
Cuốn sách “Nếu thiếu vắng tình thương của cha” được chia thành 3 phần, tương ứng với 13 chương, mỗi chương đề cập đến các mối quan hệ và lựa chọn hành vi của người cha trong gia đình, đồng thời đưa ra những lời khuyên tương ứng dưới góc độ tâm lý học.
Phần I: “Nếu không có bố, thế giới này sẽ như thế nào?” gồm 5 chương, tập trung vào sức mạnh tinh thần của người cha và ảnh hưởng của họ đối với cuộc đời con cái.
Phần II: “Bố đi đâu rồi” gồm 4 chương, nói về sự lo lắng về hình tượng và vai trò của người cha, cũng như sức mạnh vai trò của họ.
Phần III: “Nhìn thấy người cha” gồm 4 chương cuối, nói về “Người cha tàng hình” trong một gia đình hoàn chỉnh và mối quan hệ giữa người cha vắng mặt, người mẹ lo lắng và đứa con mất kiểm soát.
Cuốn sách khẳng định rằng mỗi người đàn ông lớn lên từ một cậu bé cần một hình mẫu, và hình mẫu trực tiếp nhất là người bố của họ. Mỗi người phụ nữ lớn lên từ một cô gái, tiêu chuẩn bạn đời lý tưởng của các cô gái đều tham khảo từ bố của họ. Cuốn sách cũng nêu rõ “Chức năng của người cha” theo sổ tay do Bộ Y Tế Hoa Kỳ biên soạn, bao gồm bảy khía cạnh từ phát triển mối quan hệ tích cực với mẹ của trẻ cho đến làm gương cho trẻ.',
1, "Tên Nhà Cung Cấp:	MCBooks
Tác giả:	Hồ Thận Chi
Người Dịch:	An Vân
NXB:	Hồng Đức
Năm XB:	2023
Trọng lượng (gr):	400
Kích Thước Bao Bì:	20.5 x 14 x 1.6 cm
Số trang:	364
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Và Rồi Núi Vọng (Tái Bản)", "Khaled Hosseini", 148000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695026045/PHOTO_LIST/Sach_truyen_tieuthuyet/019/", 
"NXB Hội Nhà Văn", 
'"Và Rồi Núi Vọng "
Afghanistan, mùa thu năm 1952.
Abdullah và Pari sống cùng cha, mẹ kế và em khác mẹ trong ngôi làng nhỏ xác xơ Shadbagh, nơi đói nghèo và mùa đông khắc nghiệt luôn chực chờ cướp đi sinh mệnh lũ trẻ. Abdullah yêu thương em vô ngần, còn với Pari, anh trai chẳng khác gì người cha, chăm lo cho nó từng bữa ăn, giấc ngủ. Mùa thu năm ấy hai anh em theo cha băng qua sa mạc tới thành Kabul náo nhiệt, không mảy may hay biết số phận nào đang chờ đón phía trước: một cuộc chia ly sẽ mãi đè nặng lên Abdullah và để lại nỗi trống trải mơ hồ không thể lấp đầy trong tâm hồn Pari…
Từ một sự kiện duy nhất đó, câu chuyện mở ra nhiều ngã rẽ phức tạp, qua các thế hệ, vượt đại dương, đưa chúng ta từ Kabul tới Paris, từ San Francisco tới hòn đảo Tinos xinh đẹp của Hy Lạp. Với sự uyên thâm, chiều sâu và lòng trắc ẩn, Khaled Hosseini đã viết nên những áng văn tuyệt đẹp về mối dây gắn kết định hình nên con người cũng như cuộc đời, về những quyết định tưởng chừng nhỏ nhoi mà vang vọng qua hàng thế kỷ.',
1, "Tên Nhà Cung Cấp:	Nhã Nam
Tác giả:	Khaled Hosseini
Người Dịch:	Tất An
NXB:	NXB Hội Nhà Văn
Năm XB:	2021
Trọng lượng (gr):	500
Kích Thước Bao Bì:	20.5 x 14 cm
Số trang:	512
Hình thức:	Bìa Mềm", 100);
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Vì Ước Mơ Ngại Gì Dốc Cạn Tâm Sức", "Mễ Lạp", 123000, 4, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695026045/PHOTO_LIST/Sach_truyen_tieuthuyet/020/", 
"NXB Hồng Đức", 
'"Vì Ước Mơ Ngại Gì Dốc Cạn Tâm Sức"
Ước mà không phải ánh mặt trời ngày nào cũng có cũng không phải nhưng đưa hoa nhỏ bé có thể nhìn thấy ở bất cứ nơi đầu. Nó vừa nhân ái cùng vừa khắc nghiệt, vừa khôn ngoan vừa biến sẵn, chi chiếu sáng cho những người dùng cảm đốc cạn tâm sức, kiến từ đến cùng.
Phấn đấu một đời. trầy trật gian nan, vượt quá cả chặng đường khó khăn. giêng báo chi để tiến gần hơn một bước đến ước mơ.',
1, "Tên Nhà Cung Cấp:	MCBooks
Tác giả:	Mễ Lạp
Người Dịch:	Hoàng Anh
NXB:	Hồng Đức
Năm XB:	2021
Ngôn Ngữ:	Tiếng Việt
Trọng lượng (gr):	317
Kích Thước Bao Bì:	20.5 x 14 x 1.5cm
Số trang:	311
Hình thức:	Bìa Mềm", 100);
-- Phần Quan Huy thêm dữ liệu vào bảng sách (lần 2 từ 11-20)
-- TÂM LÝ TÂM LINH TÔN GIÁO
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("3 Phút Thiền", "Christophe Andre", 74500, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027318/PHOTO_LIST/Tamly_Tamlinh_Tongiao/011/", 
"NXB Thế Giới", 
'"3 Phút Thiền"
Đã hơn 2000 năm nay con người biết đến thiền định, ở cả phương Đông cũng như phương Tây. Ngày nay, nhiều nghiên cứu khoa học đã khẳng định những lợi ích của thiền. Phi tôn giáo và dễ tiếp cận, thiền tỉnh thức được thực hành tại các phòng mạch, nhà trường, công sở hoặc nhà riêng. Không những mang lại sự thanh thản, mạnh mẽ và sáng suốt, thiền tỉnh thức còn giúp ta chống lại những chứng ô nhiễm tâm lý nghiêm trọng của thời đai: chủ nghĩa vật chất, chủ nghĩa tiêu dùng và sự phân tán tư tưởng gây nên bởi thế giới thiết bị số. Khi cho phép chúng ta tập trung lại vào cái chính yếu, thiền xứng đáng được gọi là môn thể thao của trí tuệ.', 1, "Nhà xuất bản: Nhã Nam
Ngày xuất bản: 22/02/2019
Nhà phát hành: Nhã Nam
Kích thước: 14.0 x 20.5 x 1.4 cm
Số trang: 270 trang
Trọng lượng: 470 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Sám Pháp Địa Xúc", "Thích Nhất Hạnh", 110500, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027349/PHOTO_LIST/Tamly_Tamlinh_Tongiao/012/", 
"NXB Thế Giới", 
'"Sám Pháp Địa Xúc"
Mỗi bài trong quyển Sám Pháp Địa Xúc này giống như một buổi tâm tình với đức Thế Tôn. Ta có thể chọn một bài thích hợp với hoàn cảnh của ta mà thực tập. Trước khi thực tập Sám Pháp, ta có thể ngồi thiền hoặc đi thiền 30 phút để làm thân tâm lắng lại. Ta có thể một mình thực tập Sám Pháp Địa Xúc hoặc thực tập chung với nhiều người. Sau mỗi đoạn sám, mọi người thực tập lạy xuống khi nghe tiếng chuông. Mỗi lần lạy ta chỉ nên lạy hai hoặc ba lạy. Trong khi lạy, ta hoàn toàn phú thác thân mạng ta cho Đất, để đất có thể ôm lấy ta và giúp ta chuyển hóa những khổ đau và bế tắc trong ta...', 1, "Nhà xuất bản: NXB Thế Giới
Ngày xuất bản: 22/10/2018
Nhà phát hành: Phương Nam
Kích thước: 15.5 x 24.0 x 1.0 cm
Số trang: 198 trang
Trọng lượng: 398 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Hỏi Đường Mây Trắng Qua", "Lama Anagarika Govinda", 114500, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027384/PHOTO_LIST/Tamly_Tamlinh_Tongiao/013/", 
"NXB Hồng Đức", 
'"Hỏi Đường Mây Trắng Qua"
"Không chỉ truyền cảm hứng cho người đọc bởi bút lực tài tình, cuốn sách còn là một tài liệu nhân chủng học để ta học hỏi phương pháp nghiên cứu thực địa, một sử liệu giá trị về văn hóa và lịch sử Tây Tạng. Những dấu tích ấy, theo lẽ sinh diệt hồn nhiên, nay không còn nguyên! Tuy vậy, nhữung nười có trực quan mạnh mẽ hay tín tâm kiền thành vẫn có thể "thấy" nó qua những trang sách đẫm màu tươi rói."
"The Way of the White Clouds”, ai cũng có thể hiểu (sát nghĩa) là "con đường của mây trắng". Thực ra, đó là ẩn nghĩa thâm huyền của câu cuối trong bài kệ tương truyền của Bồ Tát Di Lặc, trong một tiền kiếp khi chưa thành Phật, đã "một mình ôm bình bát" đi "vạn dặm" tìm "Đường Cái" (Đạo). Nhà thanh tu kia thân khoác hoại y, ôm bình bát lang thang trong cõi trần tục lụy nhưng chân bước trên con đường trí, mắt xanh dõi tìm người tri đạo, và ngẩng đầu nhìn mây trắng thao thiết bao la, hoát nhiên "hỏi Đường Mây Trắng qua".
"Vấn lộ bạch vân đầu". Mây làm gì có đường để hỏi. Đường của mây là không lối. Sơn cùng lộ tuyệt đại hải vô biên mây đều lướt tới, nhưng không từ đâu lại. Mây không đường nên có vạn đường, như bậc xuất gia không nhà nên đâu cũng là nhà. Hỏi đường mây trắng là hỏi hư không, hỏi cả đại thân thế giới. Mây tượng trưng cho Pháp. Pháp là hồi chuông triêu mộ đánh thức những cơn mê ngủ, là phương tiện chở người về bến mộng bên kia. Thuyền đi và bến đỗ hòa trong tinh cầu này."', 1, "Nhà xuất bản: NXB Hồng Đức
Ngày xuất bản: 01/02/2017
Nhà phát hành: Phương Nam
Kích thước: 14.0 x 21.0 cm
Số trang: 424 trang
Trọng lượng: 624 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Chuyện Kinh Thánh", "Pearl Buck", 119000, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027409/PHOTO_LIST/Tamly_Tamlinh_Tongiao/014/", 
"NXB Văn Học", 
'"Chuyện Kinh Thánh"
Chuyện Kinh Thánh không phản ánh hết được toàn bộ Kinh Thánh, cũng không thể thay thế cho Kinh Thánh, nhưng theo nhận xét của nhiều người trong giới thẩm quyền giảng huấn tôn giáo và phê bình văn học thì đây là một thành tựu to lớn của Pearl Buck. Tác phẩm cô đọng sự kết hợp hai truyền thống đông tây, cả văn học lẫn tôn giáo.
Pearl Buck kể Chuyện Kinh Thánh chứ không viết lại Kinh Thánh, không thêm không sửa, nhất là cố giữ phần đối thoại y nguyên tối đa, bà chỉ minh họa thêm vài cử chỉ, ít nụ cười, mấy tiếng thở dài... Dưới ngòi bút linh động của bà, các chuyện bà kể vừa chuyên chở được bản thông điệp tâm linh, vừa giữ được tính cách chính thống trong phạm vi qui điển, đồng thời, tạo được nhịp cầu giao cảm giữa độc giả ngày nay với tâm linh nhân vật và các sự kiện lịch sử hàng ngàn năm trước. Bà đã chuyển được phần nào nội dung của cuốn Kinh Thánh dày cộm thành những câu chuyện hấp dẫn và đặt vào lòng bàn tay của người đọc bình thường, trong và ngoài Kitô giáo.
Bền vững và ngời sáng giữa các câu chuyện xa xưa ấy là đức tin tôn giáo nguyên sơ, mộc mạc và dồi dào khí lực. Vượt lên trên các luận thuyết phức tạp, xuyên phá nghi lễ và phẩm trật, ở bên kia ngôn từ và truyền thuyết, đức tin thuần khiết ấy hồn nhiên tỏa hơi ấm đều khắp cuộc sống thường ngày. Và trong cuộc sáng chế đang tiếp diễn và ngày càng tốt đẹp ấy, Kinh Thánh mãi mãi là lời giao ước và là tin vui cho mọi dân tộc, cho mọi người, để sống hiệp nhất và bình an. Và đó chính là bức thông điệp mà Chuyện Kinh Thánh muốn gửi đến bạn đọc.', 1, "Nhà xuất bản: NXB Văn Học
Ngày xuất bản: 10/05/2011
Nhà phát hành: Đang cập nhật
Kích thước: 16.0 x 24.0 cm
Số trang: 542 trang
Trọng lượng: 700 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Mật Mã Do Thái", "Perry Stone", 50000, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027425/PHOTO_LIST/Tamly_Tamlinh_Tongiao/015/", 
"NXB Từ Điển Bách Khoa", 
'"Mật Mã Do Thái"
Người Do Thái chỉ chiếm ít hơn 1% dân số thế giới nhưng đã đạt được nhiều thành tựu đáng kể, bao gồm 176 người đạt giải Nobel và 25% các tổ chức nhận giải thưởng Nobel Hòa bình do người Do Thái thành lập hoặc đồng sáng lập.
Người Do Thái cũng có tỷ lệ cao hơn trong việc vào được đại học, đặc biệt là trường Ivy League danh giá của Mỹ.
Các nghiên cứu cho thấy người Do Thái gốc Đức và Bắc Âu có chỉ số IQ cao hơn so với nhóm không phải Do Thái.
Có nhiều ý kiến cho rằng sự thành công của người Do Thái là do yếu tố thiên tài hoặc do yếu tố thành công bí mật ẩn chứa trong văn hóa Do Thái.
Cuốn sách “Mật mã Do Thái” khám phá và giải mã bộ kinh Torah, giao ước Áp ra ham và lời mặc khải thiêng liêng trong Cựu ước để hiểu rõ hơn về cách sống và suy nghĩ của người Do Thái.
Cuốn sách cung cấp những hướng dẫn quan trọng trong cuộc sống thường ngày, trong đó có chìa khóa cho sự thịnh vượng, sức khỏe, hay chúc tụng những giai đoạn cuộc sống, và nuôi dạy con cái thành tài.', 1, "Nhà xuất bản: Nxb Từ điển Bách Khoa
Ngày xuất bản: 01/02/2014
Nhà phát hành: Thái Hà
Kích thước: 15.5 x 24.0 cm
Số trang: 206 trang
Trọng lượng: 190 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Đức Kitô Hôm Qua, Hôm Nay và Mãi Mãi", "ĐGM Phaolô Bùi Văn Đọc Và Một Số Linh Mục Khác", 34500, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027441/PHOTO_LIST/Tamly_Tamlinh_Tongiao/016/", 
"NXB Tôn Giáo", 
'"Đức Kitô Hôm Qua, Hôm Nay và Mãi Mãi"
Trong niềm tin đơn giản và thường nhật của người Kitô hữu, Đức Giêsu Kitô đã trỏ thành rất quen thuộc, không mấy khi tạo ra khó khăn và thắc mắc. Nhưng thật ra, vấn đề không dễ dàng, khi chúng ta muốn tìm hiểu sâu hơn về con người Giêsu Kitô.
Niềm tin của Giáo hội không phải là một niềm tin yên ổn, thoát khỏi mọi sóng gió. Nhân vật Giêsu Kitô không phải lúc nào cũng được nhìn như nhau. Câu hỏi của Đức Giêsu luôn hiện đại: người ta bảo con Người là ai? Còn anh em, anh em bảo Con Người là ai?
Trên bình diện lịch sử thần học, câu trả lời, hoặc nghiêng về Giêsu, con người lịch sử, hoặc nghiêng về Kitô, Đấng Cứu Thế, Đấng Thánh của Thiên Chúa, con của Thiên Chúa...', 1, "Nhà xuất bản: NXB Tôn Giáo
Ngày xuất bản: 10/05/2009
Nhà phát hành: Đang cập nhật
Kích thước: 14.5 x 20.5 cm
Số trang: 320 trang
Trọng lượng: 396 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Đồng Hành Cùng Thánh Kinh", "Oswald Chambers", 100000, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027458/PHOTO_LIST/Tamly_Tamlinh_Tongiao/017/", 
"NXB Thời Đại", 
'"Đồng Hành Cùng Thánh Kinh"
Đồng Hành Cùng Thánh Kinh Cuốn sách Đồng Hành Cùng Thánh Kinh của Oswald Chambers là một khai triển những trích đoạn từ Thánh Kinh Kitô giáo - cả Tân Ước và Cựu Ước - trên cơ sở đức tin của người Kitô hữu. 365 ngày trong một năm-từ 1/1 đến 31/12-là 365 bài giảng đề cập đến những ý niệm then chốt và uyên nguyên của Kitô giáo trong tinh thần nhân văn của thời hiện đại. Độc giả không phải Kitô hữu cũng sẽ tìm thấy trong cuốn sách này nhiều điều bổ ích, từ những khái niệm đến sự diễn dịch và hành trình tư duy của một trong những tôn giáo lớn nhất và có ảnh hưởng nhất của nhân loại hơn hai ngàn năm nay. Như “Lời nói đầu” của cuốn sách này giới thiệu, trong hơn 60 năm, đây là một trong những cuốn sách được đọc nhiều nhất trong thế giới Kitô giáo.', 1, "Tên Nhà Cung Cấp: Cty Văn Hóa Văn Lang
Tác giả: Oswald Chambers
NXB: NXB Thời Đại
Năm XB:  03-2012
Trọng lượng (gr): 430
Kích Thước Bao Bì: 21 x 13.5
Số trang: 502
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Trò Chuyện Với Cõi Vô Hình", "Hoàng Thị Thiêm", 143000, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027475/PHOTO_LIST/Tamly_Tamlinh_Tongiao/018/", 
"NXB Hội Nhà Văn", 
'"Trò Chuyện Với Cõi Vô Hình"
Trò chuyện với cõi vô hình” của nhà ngoại cảm Hoàng Thị Thiêm kể lại cuộc đời của cô từ thời thơ ấu tại Hải Phòng và Lào Cai, trải qua những khó khăn của chiến tranh, cho đến khi trở thành một nhà ngoại cảm nổi tiếng. Cô đã có những khả năng kỳ lạ từ nhỏ và sau này, dù bị coi là điên, cô đã được hướng dẫn về cõi giới bên kia và kỹ thuật áp vong. Cô đã giúp nhiều gia đình đoàn tụ với người đã mất và tìm được mộ của nhiều người có công với đất nước. Cuốn sách đã được tái bản vào năm 2021 với một số chỉnh sửa và bổ sung để làm cho nội dung rõ ràng và sinh động hơn. Cuốn sách cung cấp cái nhìn sâu sắc vào cuộc sống và công việc của một nhà ngoại cảm.', 1, "Nhà xuất bản: NXB Hội Nhà Văn
Ngày xuất bản: 05/02/2021
Nhà phát hành: Thái Hà
Kích thước: 15.5 x 24.0 x 2.5 cm
Số trang: 480 trang
Trọng lượng: 700 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Thiền Vipassana Não Bộ: Đường Đến Chân Hạnh Phúc", "Phước Tuệ Từ", 212500, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027489/PHOTO_LIST/Tamly_Tamlinh_Tongiao/019/", 
"NXB Thế Giới", 
'"Thiền Vipassana Não Bộ: Đường Đến Chân Hạnh Phúc"
Khi bạn cầm được quyển sách này trên tay thì tôi và bạn là hữu duyên, không có gì là tình cờ, chúng ta đã có thể là bạn đồng hành trên con đường tâm linh nhiều đời nhiều kiếp rồi nay cơ duyên đã đến nên chúng ta hội ngộ. Cuốn sách này chia sẻ con đường tầm đạo, quá trình hành thiền  và kinh nghiệm thưc chứng của tôi trên 20 năm. Mục đích của cuộc hành trình này là thoát khỏi khổ đau, thoát khỏi sự thống trị của tham sân si và đạt đến hạnh phúc tối hậu.
Bây giờ xin mời các bạn bước vào cuộc du hành lý thú nhất trong đời bạn, cuộc du hành nội tâm qua phương pháp Thiền Vipassana Não Bộ để đạt tới chân hạnh phúc, bạn sẽ khám phá ra bộ não của bạn được lập trình để hoạt động như thế nào? Bạn thực sự là ai? Cuộc đời bạn có nghĩa lý gì? Sự thật tuyệt đối là gì? Nguồn gốc của sự sống? Phương pháp hành thiền? Luật nhân quả là gì? Sự hình thành của các thế giới?', 1, "Nhà xuất bản: NXB Thế Giới
Ngày xuất bản: 26/12/2022
Nhà phát hành: Thái Hà
Kích thước: 14.5 x 20.5 x 1.0 cm
Số trang: 204 trang
Trọng lượng: 350 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Con Đường Heartfulness", "Daaji, Kamlesh D Patel", 91500, 5, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695027507/PHOTO_LIST/Tamly_Tamlinh_Tongiao/020/", 
"NXB Hà Nội", 
'"Con Đường Heartfulness"
Kamlesh D. Patel chia sẻ về cuộc sống và sự bí ẩn của nó. Ông đã nhận được nhiều phước lành trong suốt cuộc đời, trong đó có việc tìm hiểu về thiền Heartfulness và gặp gỡ vị guru đầu tiên của mình, Ram Chandra (Babuji). Thiền Heartfulness đã tạo ra một tác động sâu sắc đối với ông và giúp ông tìm thấy hướng đi cho cuộc đời mình. Thực hành thiền đơn giản giúp chúng ta khám phá linh hồn bên trong chính mình và nuôi dưỡng tâm hồn. Cuốn sách của ông giới thiệu về thiền Heartfulness và cách thức thực hành, cũng như vai trò của guru. Cuốn sách hy vọng sẽ giúp người đọc có được lợi ích từ những gì ông đã học được trong cuộc hành trình của cuộc sống.', 1, "Nhà xuất bản: NXB Hà Nội
Ngày xuất bản: 22/01/2020
Nhà phát hành: Thái Hà
Kích thước: 14.5 x 20.5 x 1.4 cm
Số trang: 294 trang
Trọng lượng: 490 gram", 100);

-- THIẾU NHI
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Joni Mặt Tịt Và Đồng Bọn Tinh Nghịch", "Nguyễn Khắc Cường", 100000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695028070/PHOTO_LIST/Thieu_nhi/011/", 
"NXB Trẻ", 
'“Joni Mặt Tịt Và Đồng Bọn Tinh Nghịch” 
Được coi là một câu chuyện hấp dẫn dành cho trẻ con về chú mèo Ba Tư tên Joni, tình cờ lưu lạc đến Việt Nam và được gia đình “mẹ” Đan nuôi dưỡng. Xinh xắn đáng yêu, “cục bông mặt tịt” Joni cũng nghịch ngợm hiếu động và nhiều phen đối đầu với nguy hiểm. Tuy nhiên, dù có thế nào, dưới góc nhìn của mèo Joni cuộc sống lúc nào cũng thật tươi đẹp. Và vòng tròn bạn bè của chú mèo bông cứ ngày càng mở rộng, nhờ tính cách lạc quan, nhân ái và tràn đầy yêu thương như thế. Người lớn cũng có thể tìm thấy trong trang sách những phút thư giãn thoải mái, khi đắm mình theo các cuộc phiêu lưu thú vị của chú mèo Joni cùng nhóm bạn bè nhiều màu sắc.', 1, "Tác giả: Nguyễn Khắc Cường
Nhà xuất bản: Nxb Trẻ
Nhà phát hành: NXB Trẻ
Khối lượng: 420.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 20 x 13 x 0.5 cm
Ngày phát hành: 2022
Số trang: 224", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Con Có Thể Tự Bảo Vệ Mình - Cơ Thể Con Là Của Con (Tái Bản 2022)", "Dagmar Geisler", 75000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695028082/PHOTO_LIST/Thieu_nhi/012/", 
"NXB Thể giới", 
'"Con Có Thể Tự Bảo Vệ Mình - Cơ Thể Con Là Của Con" (Tái Bản 2022)
“Cơ thể con là của con” là một cuốn sách kể về cô bé Clara, có một điều đặc biệt đó là cơ thể của cô bé chỉ thuộc về một mình cô bé. Clara nhận thức được sự thay đổi của cơ thể mình hàng ngày và tự hào về điều đó. Cô bé rất thích được ôm và âu yếm, nhưng không phải lúc nào cũng vậy. Clara không thích bị ôm hôn ngấu nghiến hay những trò đùa quá trớn. Cô bé quyết định nói “Không” khi mình cảm thấy không thoải mái và nếu người đó cố tình vi phạm, cô bé sẽ tự biết cách bảo vệ mình bằng cách tránh xa và kể cho những người tin tưởng. Cuốn sách này được tạo nên bởi những hình ảnh đáng yêu với cốt truyện rõ ràng, nhấn mạnh vào thái độ con tôn trọng cơ thể con, con tôn trọng người khác và mọi người cũng cần tôn trọng con.', 1, "Tác giả: Dagmar Geisler
Người dịch: Bùi Thị Phương Nhung
Nhà xuất bản: Nxb Thế giới
Nhà phát hành: AZ books
Giấy phép XB: -QĐ/TG
Khối lượng: 100.00 gam
Ngôn ngữ: Tiếng Việt
Định dạng: Bìa mềm
Kích thước: 29.5 x 20.8 cm
Ngày phát hành: 2022", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Cùng Phiêu Lưu Bắc Cực", "Nadine Brun-Cosme, Anna Aparicio Català", 46500, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695028095/PHOTO_LIST/Thieu_nhi/013/", 
"NXB Kim Đồng", 
'"Cùng Phiêu Lưu Bắc Cực"
Nico và Khỉ đuôi sóc chuẩn bị cho chuyến thám hiểm đến Bắc Cực bằng một con tàu đa năng. Cả hai sẽ cùng nhau trải qua những cuộc phiêu lưu kì thú và gặp gỡ những người bạn mới. Nico có sở thích chế tạo máy móc và cùng Khỉ đuôi sóc khám phá nhiều nơi chốn thú vị. Tất cả đang chờ em cùng khám phá đấy!', 1, "Nhà xuất bản: NXB Kim Đồng
Ngày xuất bản: 04/08/2023
Nhà phát hành: NXB Kim Đồng
Kích thước: 20.0 x 26.0 cm
Số trang: 46 trang
Trọng lượng: 200 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Chúng Ta Đa Dạng", "Magdalena Guerrero, María Jose Poblete, Alfredo Cáceres", 97500, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695028111/PHOTO_LIST/Thieu_nhi/014/", 
"NXB Kim Đồng", 
'"Chúng Ta Đa Dạng"
_x000D_
_x000D_
Xin chào, nhà hoạt động! Chúng tớ đang đợi cậu! Chúng tớ biết cậu là người đặc biệt. Chúng tớ cũng biết cậu đang gắn kết với thế giới xung quanh và quan sát kĩ lưỡng để nhận biết những gì cậu quan tâm, những điều cậu muốn bảo tồn và cả những điều cậu muốn thay đổi. Giống như cậu, trên thế giới này có nhiều đàn ông và phụ nữ cùng quan sát, kết nối với nhau, quyết định bắt tay nhau làm cho thế giới tốt đẹp hơn. Và rất nhiều người đã thành công!_x000D_
Cuốn sách này sẽ giúp cậu đánh thức nhà hoạt động vô cùng đặc biệt đang say ngủ bên trong con người cậu. _x000D_
Tớ, nhà hoạt động, sẽ hướng dẫn để cậu có thể mang lại những thay đổi, dù lớn hay nhỏ, trong lớp học, trường học, và cả thế giới cậu đang sống._x000D_
VÌ TẤT CẢ CHÚNG TA CÓ THỂ CHUNG TAY LÀM CHO THẾ GIỚI TỐT ĐẸP HƠN!_x000D_
---_x000D_
Mời các bạn tìm đọc trọn bộ Chúng Ta Đa Dạng + Tớ, Nhà Hoạt Động (2 cuốn)_x000D_
•    Tớ, Nhà Hoạt Động - Sổ Tay Hướng Dẫn Thay Đổi Xã Hội, Từ Nhỏ Tới Lớn_x000D_
•    Chúng Ta Đa Dạng - Một Chuyến Du Lịch Văn Hóa Để Nhận Biết Giá Trị Và Tôn Trọng Sự Khác Biệt_x000D_
Bộ sách mang đến góc nhìn toàn cảnh về cá nhân và xã hội thời hiện đại, về sự khác biệt đáng quí của mỗi chúng ta và cách biến thế giới thành một nơi tốt đẹp hơn. _x000D_', 1, "Nhà xuất bản: NXB Kim Đồng
Ngày xuất bản: 08/08/2023
Nhà phát hành: NXB Kim Đồng
Kích thước: 21.5 x 28.0 x 2.0 cm
Số trang: 72 trang
Trọng lượng: 250 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Hứa với mẹ, bé hãy an toàn khi ở nhà", "Park Eun-Gyung", 63500, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695028123/PHOTO_LIST/Thieu_nhi/015/", 
"NXB Hà Nội", 
'"Hứa với mẹ, bé hãy an toàn khi ở nhà"
Theo thống kê của Viện Người tiêu dùng Hàn Quốc, trên 60% vụ tai nạn ở trẻ em xảy ra tại nhà hoặc xung quanh nhà. Chỉ cần các bậc phụ huynh chú ý hơn một chút, thì hoàn toàn có thể phòng tránh các tai nạn dù nhỏ hay lớn. Trước tiên, phải tìm hiểu xem những địa điểm nào, những tình huống nào dễ gây ra tai nạn, sau đó, hãy biến ngôi nhà của gia đình thành không gian an toàn cho trẻ. Tiếp theo đó, phải dạy cho trẻ phân biệt được những hành động an toàn và hành động nguy hiểm, dạy trẻ cách tự bảo vệ bản thân khi có bất kỳ tình huống nào xảy ra. Cha mẹ hãy cùng trẻ đọc cuốn sách này, đi quanh nhà và tìm hiểu những nguyên tắc an toàn phải thực hiện. Bằng cách đó, chúng ta có thể bảo vệ sự an toàn cho những đứa con thân yêu của mình.', 1, "Nhà xuất bản: NXB Hà Nội
Ngày xuất bản: 01/01/2023
Nhà phát hành: Thái Hà
Kích thước: 22.0 x 28.0 cm
Số trang: 44 trang
Trọng lượng: 100 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Tranh Truyện Lịch Sử Việt Nam - Duy Tân (Tái Bản 2023)", "Nguyễn Huy Thắng, Lê Minh Hải", 17000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695028167/PHOTO_LIST/Thieu_nhi/016/", 
"NXB Kim Đồng", 
'"Tranh Truyện Lịch Sử Việt Nam - Duy Tân" (Tái Bản 2023)
Vua Duy Tân tên là Nguyễn Phúc Vĩnh San, sinh ngày 19-9-1900, lên ngôi lúc tám tuổi. Ông bất hợp tác với chính quyền thuộc địa Pháp và bí mật lên kế hoạch khởi nghĩa năm 1916 nhưng thất bại và bị đưa đến đảo Réunion. Thi hài ông được đưa về Việt Nam năm 1987. Tủ sách “Tranh truyện lịch sử Việt Nam” dành cho thiếu niên nhi đồng giúp các em làm quen với lịch sử thông qua những câu chuyện về các danh nhân được thể hiện bằng các trang sách màu.', 1, "Nhà xuất bản: NXB Kim Đồng
Ngày xuất bản: 22/07/2023
Nhà phát hành: NXB Kim Đồng
Kích thước: 14.5 x 20.5 x 0.2 cm
Số trang: 32 trang
Trọng lượng: 250 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Thiên Mã (Tái Bản 2023)", "Hà Thủy Nguyên", 55000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695028200/PHOTO_LIST/Thieu_nhi/017/", 
"NXB Kim Đồng", 
'"Thiên Mã" (Tái Bản 2023)
Thần Đồng, cậu bé có trí tuệ siêu việt đã tạo ra một chú ngựa có cánh mang tên Thần Thoại bằng cách lai ghép giữa ngựa và thiên nga. Cùng với một cô bé thông minh, bướng bỉnh, bộ ba đã rong ruổi phiêu lưu khắp bốn phương trời, tới Ai Cập, Trung tâm Vũ trụ và Ngôi đền Yên tĩnh trên dãy núi Himalaya. Những miền đất bí ẩn, những bí mật và những nhân vật lạ lùng đang chờ đón các nhân vật nhỏ tuổi và độc giả nhỏ tuổi cùng khám phá. Úmbala, nào ta cùng mở sách ra.', 1, "Nhà xuất bản: NXB Kim Đồng
Ngày xuất bản: 06/07/2023
Nhà phát hành: NXB Kim Đồng
Kích thước: 14.0 x 22.5 x 1.0 cm
Số trang: 200 trang
Trọng lượng: 350 gram", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Bộ Sách Chân Dung Những Người Thay Đổi Thế Giới - Charles Darwin Là Ai? (Tái Bản 2023)", "Deborah Hopkinson - Nancy Harrison", 59000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695028212/PHOTO_LIST/Thieu_nhi/018/", 
"NXB Dân Trí", 
'"Bộ Sách Chân Dung Những Người Thay Đổi Thế Giới - Charles Darwin Là Ai?" (Tái Bản 2023)
Bộ sách chân dung – Những người thay đổi thế giới cung cấp thông tin thú vị về những nhân vật nổi tiếng trong lịch sử lẫn hiện tại. Cuốn sách miêu tả chân thực nội tâm cảm xúc nhân vật và hình ảnh minh họa sống động. Bạn sẽ hiểu được những thăng trầm, biến cố và thành công trong cuộc đời của mỗi thiên tài. Biết đâu sau khi đọc xong bộ sách này, bạn sẽ trở thành những Albert Einstein, Newton, Edison thế hệ tiếp theo!', 1, "Tên Nhà Cung Cấp: Alpha Books
Tác giả: Deborah Hopkinson, Nancy Harrison
Người Dịch: Nguyễn Thanh Hải, Nguyễn Hồng Hoa, Nguyễn Hằng Hà
NXB: Dân Trí
Năm XB: 2023
Ngôn Ngữ: Tiếng Việt
Trọng lượng (gr): 120
Kích Thước Bao Bì: 19 x 13 x 0.5 cm
Số trang: 108
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Cổ Tích Trăng Non - Chiếc Xe Đạp Của Gấu Con", "Minh Anh, Ngọc Phương", 16000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695028223/PHOTO_LIST/Thieu_nhi/019/", 
"NXB Phụ Nữ Việt Nam", 
'"Cổ Tích Trăng Non - Chiếc Xe Đạp Của Gấu Con"
Bộ sách Cổ Tích Trăng Non được minh họa bởi những nét vẽ tươi sáng, sinh động, giúp các em nhỏ yêu thích kho tàng cổ tích Việt Nam hơn. Sau mỗi câu chuyện kể đều có những câu hỏi vui học giúp tăng tư duy cho các em. Đây là một thế giới hấp dẫn, lôi cuốn với biết bao tình tiết li kỳ và bài học giáo dục nhẹ nhàng nhưng tác động mạnh mẽ trong việc bồi dưỡng tâm hồn trẻ thơ.', 1, "Tên Nhà Cung Cấp: Huy Hoang Bookstore
Tác giả: Minh Anh, Ngọc Phương
NXB: NXB Phụ Nữ Việt Nam
Năm XB:	2021
Trọng lượng (gr): 10
Kích Thước Bao Bì: 24 x 17 cm
Số trang: 24
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Những Cuộc Phiêu Lưu Của Huckleberry Finn", "Mark Twain", 98000, 6, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695028254/PHOTO_LIST/Thieu_nhi/020/", 
"NXB Văn Học", 
'"Những cuộc phiêu lưu của Huckleberry Finn"
Đây là tiểu thuyết ưu tú nhất của Mark Twain. Tác giả đã vận dụng phương ngữ của nhiều vùng, nhiều tầng lớp người để diễn tả những trạng huống tâm lý phức tạp và mô tả xuất sắc cảnh vật thiên nhiên. Tác phẩm này đã lọt vào danh sách những tiểu thuyết hay nhất mọi thời đại của văn học Mỹ và rất nhiều lần được đưa lên màn ảnh. Ernest Hemingway từng nói: “Toàn bộ văn học Mỹ hiện đại đều thoát thai từ một cuốn sách của Mark Twain, đó là Những cuộc phiêu lưu của Huckleberry Finn”', 1, "Tên Nhà Cung Cấp: Huy Hoang Bookstore
Tác giả: Mark Twain
Người Dịch: Xuân Oanh
NXB: NXB Văn Học
Năm XB: 2019
Trọng lượng (gr): 450
Kích Thước Bao Bì: 13.5 x 20.5 x 2.1
Số trang: 435
Hình thức: Bìa Mềm", 100);

-- VĂN HỌC NGHỆ THUẬT
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Phép Màu Cho Marigold", "L M Montgomery", 129000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695032317/PHOTO_LIST/Van_hoc_nghe_thuat/011/", 
"NXB Lao Động", 
'"Phép Màu Cho Marigold"
“Cháu thực sự nghĩ gì về thế giới?” Marigold, tuy ngạc nhiên, nhưng biết rõ cô bé nghĩ gì về thế giới.
“Cháu nghĩ thế giới rất thú vị.” Cô bé nói. Cụ bà nhìn cô bé chằm chằm rồi cười lớn.
“Vậy thì cháu đã rất đúng. Lời nói có thể sẽ không được thực hiện, của cải có thể sẽ biến mất – nhưng những điều rực rỡ của cuộc sống con người sẽ luôn tiếp tục. Ta chưa bao giờ cảm thấy mệt mỏi khi chứng kiến những điều đó. Ta đã sống gần một thế kỷ rồi - và trong tất cả mọi thứ, chẳng có gì làm ta biết ơn hơn sự thực rằng ta luôn cảm thấy thế giới và con người sống trong đó thú vị. Đúng, cuộc sống này thật đáng sống…”', 1, "Tên Nhà Cung Cấp: Đinh Tị
Tác giả: L M Montgomery
Người Dịch: Phùng Nga
NXB: NXB Lao Động
Năm XB:	2020
Trọng lượng (gr): 500
Kích Thước Bao Bì: 20.5 x 14.5 cm
Số trang: 452
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Ba Gã Cùng Thuyền - Chưa Kể Con Chó - Jerome K. Jerome", "Jerome K. Jerome", 88000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695032333/PHOTO_LIST/Van_hoc_nghe_thuat/012/", 
"NXB Văn Học", 
'"Ba Gã Cùng Thuyền - Chưa Kể Con Chó - Jerome K. Jerome"
Đây là một cuốn sách của tác giả Jerome K. Jerome, kể về chuyến du hành sông Thames của ba người đàn ông và một con chó với mục đích để thư giãn. Trong chuyến du hành này, họ gặp phải nhiều trở ngại như sự cứng đầu cứng cổ của mớ hành lý, sự vô ơn của con thuyền, sự quỷ quyệt của cái ấm trà, sự om sòm của bầy thiên nga, nhưng cuối cùng họ vẫn được thư giãn thật sự và biết thế nào là một chuyến du hành đích thực. Cuốn sách này đã được độc giả đón nhận hết sức nồng nhiệt và là bước đệm để tác giả cùng một số người khác sáng lập ra The Idler – tạp chí hài hước với nhiều bài viết của Bret Hart, Mark Twain, W.W. Jacobs, … Năm 1990, Jerome xuất bản cuốn Three man in a bummel (Tạm dịch: Ba gã dạo chơi), kể tiếp về chuyến đi bộ của ba nhân vật chính đến nước Đức. Ngoài ra, ông cũng viết một số vở kịch có phong cách gần giống với phong cách của bạn mình - nhà văn J.M.Barrie, nổi tiếng nhất trong số đó là The passing of the third floor back (Tạm dịch: Vị khách trọ phía sau tầng ba) - một câu chuyện luân lý với bối cảnh hiện đại.', 1, "Tác giả: Jerome K. Jerome
Dịch giả: Petal Lê
Hình thức: bìa mềm, 13 x 20.5 cm. 262 trang
Nhà xuất bản: NXB Văn Học, 2023", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Hóa Thân (Tái Bản 2018)", "Franz Kafka", 54000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695032353/PHOTO_LIST/Van_hoc_nghe_thuat/013/", 
"NXB Hội Nhà Văn", 
'"Hóa Thân (Tái Bản 2018)"
Một sáng tỉnh giấc sau những giấc mơ xáo động, Gregor Samsa, nằm trên giường, nhận thấy mình đã biến thành một con côn trùng khổng lồ. Anh nằm ngửa trên cái lưng rắn như thể được bọc giáp sắt, và khi dợm nhấc đầu lên, anh nhìn thấy bụng mình khum tròn, nâu bóng, phân chia làm nhiều đốt cong cứng đờ, tấm chăn bong đắp trên bụng đã bị xô lệch, gần tuột hẳn. Chân anh nhiều ra, mảnh khảnh đến thảm hại so với phần còn lại của thân hình to đùng, vung vẩy bất lực trước mắt anh.', 1, "Tên Nhà Cung Cấp: Nhã Nam
Tác giả: Franz Kafka
Người Dịch: Đức Tài
NXB: NXB Hội Nhà Văn
Năm XB:	2018
Trọng lượng (gr): 280
Kích Thước Bao Bì: 13 x 20.5
Số trang: 126
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Nghệ Thuật Và Thợ Thủ Công", "Oscar Wilde", 110000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695032392/PHOTO_LIST/Van_hoc_nghe_thuat/014/", 
"NXB Đà Nẵng", 
'“Nghệ Thuật Và Thợ Thủ Công” 
Đây là một tập tiểu luận của tác giả Oscar Wilde, được dịch bởi Minh Hùng và Lê Duy Nam, và xuất bản bởi Đà Nẵng vào năm 2020. Tập sách này gồm 4 tiểu luận và bài giảng của Oscar Wilde về sự kiến tạo tinh thần trong thời đại mà ông sống: Châu Âu thế kỷ 19 dưới thời đại trị vì của nữa hoàng Victoria. Ông bàn về cách nghệ thuật cần phải hướng tới các giá trị thẩm mỹ ra sao, người nghệ sĩ cần giữ thái độ độc lập và chuẩn mực sáng tác như thế nào, chúng ta cần phải hướng tới tự do cá nhân như một lẽ sống không thể chối bỏ. Con đường kiến tạo của ông đi ngược lại xu hướng thế kỷ 19 ở Anh quốc nói riêng và châu Âu nói chung, khi mà cuộc Cách mạng công nghiệp lúc bấy giờ đã gây ra một thảm trạng về cảnh quan và môi trường sống. Cuốn sách này cung cấp cho người đọc những niềm tin đang hiện hữu trong công chúng, lật ngược lại các niềm tin đó, để người đọc nhận ra được bản chất của vấn đề.', 1, "Tác giả	Oscar Wilde
Người Dịch: Minh Hùng, Lê Duy Nam
NXB: Đà Nẵng
Năm XB:	2020
Trọng lượng (gr): 200
Kích Thước Bao Bì: 20.5 x 12 x 0.9 cm
Số trang: 205
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Heidi - Bìa Cứng (Tái Bản 2023)", "Johanna Spyri, Elena Selivanova", 280000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695032409/PHOTO_LIST/Van_hoc_nghe_thuat/015/", 
"NXB Đà Nẵng", 
'“Heidi - Bìa Cứng” 
Đây là một cuốn sách của nữ nhà văn Johanna Spyri, được dịch bởi Thanh Vân và minh họa bởi Elena Selivanova, và xuất bản bởi Đông A vào năm 2023. Cuốn sách kể về cô bé Heidi, được người dì ích kỉ gửi đến sống với ông nội đang sống cô độc trên vùng núi Alm. Dù ban đầu ai cũng ái ngại cho Heidi khi phải sống với ông già lập dị và cục cằn ấy, nhưng Heidi bé bỏng với tấm lòng nhân hậu tự nhiên, chẳng những giúp ông nội tìm lại lòng yêu cuộc sống, mà còn mang đến bao đổi thay kì diệu. Những ai từng gặp Heidi, dù ở Dörfli hay Frankfurt, đều muốn cô bé mãi mãi ở bên mình. Nhưng tất cả đều hiểu, chỉ ở giữa cánh đồng hoa rực rỡ, thung lũng mênh mông và ráng chiều rực đỏ trên những ngọn núi thanh tĩnh ngàn đời của dãy Alm, Heidi mới thực sự hạnh phúc để tặng niềm vui cho mọi người. Cuốn sách này đã được chuyển thể thành phim điện ảnh, phim truyền hình, kịch bản sân khấu và anime.', 1, "Tên Nhà Cung Cấp: Đông A
Tác giả: Johanna Spyri, Elena Selivanova
Người Dịch: Thanh Vân
NXB: Văn Học
Năm XB:	2023
Ngôn Ngữ: Tiếng Việt
Trọng lượng (gr): 1200
Kích Thước Bao Bì: 24 x 15.5 x 2 cm
Số trang: 304
Hình thức: Bìa Cứng", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Chị Kể Chuyện", "Lucy Maud Montgomery", 139000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695032433/PHOTO_LIST/Van_hoc_nghe_thuat/016/", 
"NXB Văn Học", 
'“Chị Kể Chuyện”
Đây là một cuốn sách của nữ nhà văn L. M. Montgomery, được dịch bởi Hàn Băng Vũ và xuất bản bởi Văn Học vào năm 2023. Cuốn sách kể về câu chuyện của anh em Bevery và Felix, được cha gửi về sống một thời gian với gia đình chú thím ở đảo Hoàng Tử Edward. Tại đây, hai cậu bé được gặp rồi kết thân với các anh chị em họ và đặc biệt là Sara Stanley - người được mọi người gọi với biệt danh là “chị Kể Chuyện” vì khả năng kể chuyện tuyệt vời của mình. Cùng với những câu chuyện hấp dẫn của chị Kể Chuyện và các cuộc phiêu lưu, các cô bé cậu bé đã cùng nhau trải qua một mùa hè đầy thú vị và nhiều cảm xúc khó quên.', 1, "Tên Nhà Cung Cấp: Công ty TNHH Tazano
Tác giả: Lucy Maud Montgomery
Người Dịch: Hàn Băng Vũ
NXB: Văn Học
Năm XB:	2023
Trọng lượng (gr): 440
Kích Thước Bao Bì: 20.5 x 14 x 2.1 cm
Số trang: 424
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Thung Lũng Cầu Vồng", "Lucy Maud Montgomery", 138000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695032449/PHOTO_LIST/Van_hoc_nghe_thuat/017/", 
"NXB Hội Nhà Văn", 
'"Thung Lũng Cầu Vồng"
Cuốn sách kể về một vùng lòng chảo nhỏ bé, nên thơ và quạnh hiu được lũ trẻ nhà Bên Ánh Lửa âu yếm gọi tên: Thung Lũng Cầu Vồng. Nơi đây, lũ trẻ tha hồ bày trò náo động, yên bình đọc thơ, câu cá suối, thu hoạch nhựa vân sam, ăn những bữa tiệc đến các ông hoàng bà chúa cũng phải ghen tỵ. Cũng nơi đây, chúng tìm được những tình bạn tâm đầu ý hợp nơi bốn đứa trẻ con nhà mục sư và một cô bé mồ côi. Cùng nhau, chúng đã có những cuộc phiêu lưu lấp lánh trong mắt con trẻ, dẫu có phần kinh hoảng trong mắt những người dân chất phác ham ngồi mê đôi mách làng Glen.', 1, "Tên Nhà Cung Cấp: Nhã Nam
Tác giả: Lucy Maud Montgomery
Người Dịch: Huyền Vũ
NXB: NXB Hội Nhà Văn
Năm XB:	2021
Trọng lượng (gr): 450
Kích Thước Bao Bì: 20.5 x 14 cm
Số trang: 412
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Anne Tóc Đỏ Làng Avonlea", "Lucy Maud Montgomery", 112000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695032464/PHOTO_LIST/Van_hoc_nghe_thuat/018/", 
"NXB Hội Nhà Văn", 
'"Anne Tóc Đỏ Làng Avonlea"
Mới ngày nào cô bé Anne mặt tàn nhang và dễ kích động vừa mới đặt chân lên đảo Hoàng Tử Edward đã gây bao xôn xao, xáo trộn. Vậy mà giờ đây Anne đã vụt lớn thành một thiếu nữ mười sáu tuổi tươi tắn và xinh đẹp. Tuổi mười sáu đặt lên vai cô nhiều trọng trách: một cô giáo làng với tham vọng gieo những ước vọng đẹp đẽ trong tâm hồn trẻ thơ, một sáng lập viên Hội Cải tạo với mong muốn biến Avonlea thành một ngôi làng xanh sạch đẹp hơn, và một người bảo hộ bất đắc dĩ của hai đứa bé sinh đôi mồ côi rất đáng yêu nhưng cũng gây lắm chuyện đau đầu. Nhưng tuổi mười sáu vẫn không làm mất đi trong Anne tính lãng mạn vô phương cứu chữa cũng như chẳng khiến Anne thôi vướng vào vô số sự cố dở khóc dở cười chẳng khác gì những học trò nhỏ tinh nghịch và hăng hái của cô.
Mười một, mười sáu rồi mười tám, Anne từng bước trưởng thành nhưng vẫn không thôi là Anne thánh thiện, lạc quan và căng tràn sức sống – nguồn cảm hứng tinh khôi quyến rũ biết bao thế hệ bạn đọc đủ mọi lứa tuổi trên khắp thế giới.', 1, "Tên Nhà Cung Cấp: Nhã Nam
Tác giả: Lucy Maud Montgomery
Người Dịch: Hồ Thanh Ái
NXB: NXB Hội Nhà Văn
Năm XB:	2022
Trọng lượng (gr): 450
Kích Thước Bao Bì: 20.5 x 14 x 1.5 cm
Số trang: 404
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Beartown - Thị Trấn Nhỏ, Giấc Mơ Lớn", "Fredrik Backman", 189000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695032668/PHOTO_LIST/Van_hoc_nghe_thuat/019/", 
"NXB Trẻ", 
'"Beartown - Thị Trấn Nhỏ, Giấc Mơ Lớn"
Từ tác giả cuốn sách bán chạy toàn cầu “Người đàn ông mang tên Ove”
Fredrik Backman cuốn hút người đọc vào cuốn tiểu thuyết sâu sắc, quyến rũ về một thị trấn nhỏ mang giấc mơ lớn – và cái giá phải trả để biến giấc mơ thành hiện thực.
Ai cũng nói Beartown vậy là xong rồi. Một cộng đồng nhỏ nép mình sâu trong rừng, và ngày càng nhỏ lại khi cây cối xâm lấn. Nhưng ở đây có một sân băng cũ, và đây là lí do người dân Beartown tin rằng ngày mai sẽ tốt hơn hôm nay. Đội khúc côn cầu trên băng của họ sắp thi đấu ở vòng bán kết quốc gia, và họ hoàn toàn có cơ hội chiến thắng. Tất cả hi vọng và ước mơ của nơi này được đặt lên vai những cậu trai tuổi teen.
Nhưng chính điều đó lại tạo thành một gánh nặng cho các cậu, và đã kích hoạt một hành động bạo lực, cả thị trấn chìm trong hỗn loạn.
“Beartown” đi sâu vào những hi vọng gắn kết một cộng đồng nhỏ lại với nhau, những bí mật đã chia cắt nó và sự can đảm cần có để một người làm điều khác thường. Trong câu chuyện về thị trấn nhỏ trong rừng này, Fredrik Backman đã tìm được cả thế giới.', 1, "Tên Nhà Cung Cấp: NXB Trẻ
Tác giả: Fredrik Backman
Người Dịch: Hoàng Anh
NXB: Trẻ
Năm XB:	2023
Ngôn Ngữ: Tiếng Việt
Trọng lượng (gr): 600
Kích Thước Bao Bì: 20 x 13 x 2 cm
Số trang: 604
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Bồ Câu Bay Đi Tìm Bà", "Walter Macken", 77000, 7, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695032683/PHOTO_LIST/Van_hoc_nghe_thuat/020/", 
"NXB Hội Nhà Văn", 
'"Bồ Câu Bay Đi Tìm Bà"
Đã bao giờ bạn đọc một cuốn sách phiêu lưu mà ngọt ngào đến thế này chưa? Ngọt từ chú bé mồ côi vẫn còn ở tuổi ham bắn bi, đá bóng mà đã dám ra một quyết định tày trời: bỏ nhà ra đi để bảo vệ người mình yêu thương. Ngọt đến cô em gái nhỏ xinh như búp bê nhưng không ngại ăn đường ngủ phố, trèo núi băng đồng, hết mực tin tưởng người anh không ca thán nửa lời. Ngọt đến cả những người hai anh em chúng gặp trên đường, từ lớn chí bé: mỗi bận ta run lên lo sợ là mỗi bận ta thở phào hân hoan nhận ra người tốt hóa ra ở khắp nơi. Tất nhiên là trừ nhân vật phản diện: ông bố dượng giả tạo quyết tâm lùng kiếm chúng bằng được, chẳng phải yêu thương gì mà chỉ vì muốn giành lại khoản thừa kế kếch xù.
Biết bao cảm hứng và tưởng tượng hẳn sẽ được khơi lên từ đây, câu chuyện về anh em nhà họ Dove - hai chú bồ câu bé nhỏ, gan dạ - bỏ nhà vượt biển, tìm kiếm một ngôi làng không biết tên, ở một đất nước không quen thuộc, để đến với bà ngoại - biểu tượng của tình yêu thương mà chúng luôn khao khát.
WALTER MACKEN (1915-1967) là nhà văn và nhà soạn kịch người Ai Len. Xuất thân diễn viên, Macken chỉ bắt đầu tập trung hẳn vào sự nghiệp viết lách sau thành công của cuốn sách thứ ba trên thị trường Mỹ, Rain on the Wind. Tác phẩm nổi tiếng nhất của ông là bộ ba tiểu thuyết về lịch sử Ai Len: Seek the Fair Land, The Silent People và The Scorching Wind. Gia tài sáng tác đồ sộ của Macken có đến 5 tuyển tập truyện ngắn cùng 2 tiểu thuyết cho thiếu nhi, trong đó nổi bật nhất là Bồ câu bay đi tìm bà (xuất bản năm 1963, chuyển thể thành phim điện ảnh năm 1971).', 1, "Tên Nhà Cung Cấp: Nhã Nam
Tác giả: Walter Macken
Người Dịch: Nguyễn Bích Lan
NXB: NXB Hội Nhà Văn
Năm XB: 2021
Trọng lượng (gr): 300
Kích Thước Bao Bì: 20.5 x 14 cm x 1.2
Số trang: 220
Hình thức: Bìa Mềm", 100);

-- VĂN HÓA, XÃ HỘI - LỊCH SỬ
INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Các Dân Tộc Ở Đông Nam Á", "Viện Hàn Lâm Khoa Học Xã Hội Việt Nam, Viện Nghiên Cứu Đông Nam Á Nguyễn Duy Thiệu", 195000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042780/PHOTO_LIST/Vanhoaxahoi_lichsu/011/", 
"NXB Đại Học Quốc Gia Hà Nội", 
'"Các Dân Tộc Ở Đông Nam Á"
Giới thiệu các dân tộc ở Đông Nam Á: về bức tranh tổng quan các tộc người; các nhóm ngôn ngữ và sự phân bố tộc người ở hai cấp độ: trên toàn khu vực và trong phạm vi của từng nước cụ thể; nhận diện các đặc trưng văn hóa đã làm nên bản sắc khu vực trong quá khứ như là những tiền đề góp phần tái lập bản sắc của một thực thể Đông Nam Á trong bối cảnh đương đại.', 1, "Nhà Cung Cấp: Cty Tri Thức Văn Hóa Sách VN
Tác giả: Viện Hàn Lâm Khoa Học Xã Hội Việt Nam, Viện Nghiên Cứu Đông Nam Á Nguyễn Duy Thiệu
NXB: NXB Đại Học Quốc Gia Hà Nội
Năm XB: 2019
Trọng lượng (gr): 400
Kích Thước Bao Bì: 16 x 24 cm
Số trang: 383
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Người Nông Dân Châu Thổ Bắc Kỳ", "Pierre Gourou", 185000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042800/PHOTO_LIST/Vanhoaxahoi_lichsu/012/", 
"NXB Trẻ", 
'"Người Nông Dân Châu Thổ Bắc Kỳ"
Cuốn sách của Pierre Gourou nghiên cứu về châu thổ Sông Hồng, một châu thổ vào loại đông dân nhất thế giới, cái nôi của nền văn minh Việt Nam, là một tác phẩm đặc sắc nghiên cứu về địa lý nhân văn. Mặc dù sách đã xuất bản (nguyên bản tiếng Pháp) từ các năm 30 của thế kỷ trước, nhưng đến nay sau hơn 70 năm, nó vẫn còn nguyên tính thời sự… Bởi lẽ dù vùng đất này đã có nhiều biến đổi về chính trị, kinh tế và xã hội nhưng vẫn còn lưu giữ được những nét cơ bản cho đến tận ngày nay. Cần biết thêm đôi điều về tác giả. Pierre Gourou là người đã sống gần trọn thế kỷ XX. Ông là Thạc sĩ sử học và địa lý học, Tiến sĩ văn chương, Ủy viên thông tấn Viện Viễn đông Bác cổ Pháp. Oâng đã thực hiện nhiều cuộc điều tra trên thực địa, tiếp xúc với nông dân, chú ý đến cấu trúc gia đình, tín ngưỡng tôn giáo… Và có lẽ nhờ vậy, những công trình nghiên cứu của ông là một phương thức đóng góp cho sự phát triển đi lên của các nước nghèo.', 1, "Tên Nhà Cung Cấp: NXB Trẻ
Tác giả: Pierre Gourou
NXB: Trẻ
Năm XB: 04/2015
Trọng lượng (gr): 760
Kích Thước Bao Bì: 15.5x23 x 4.3
Số trang: 701
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Cách Mạng Pháp Và Tâm Lý Học Của Các Cuộc Cách Mạng", "Gustave Le Bon", 129000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042820/PHOTO_LIST/Vanhoaxahoi_lichsu/013/", 
"NXB Thế Giới", 
'"Cách Mạng Pháp Và Tâm Lý Học Của Các Cuộc Cách Mạng"
Cách Mạng Pháp Và Tâm Lý Học Của Các Cuộc Cách Mạng Lịch sử của cuộc Cách mạng Pháp trên thực tế được cấu thành từ một loạt những biến cố lịch sử song hành và thường độc lập với nhau: Lịch sử chế độ cũ nát đang tàn lụi do không có những người bảo vệ: lịch sử những hội đồng cách mạng; lịch sử những phong trào quần chúng cùng thủ lĩnh của họ; lịch sử những đạo quân; lịch sử những thiết chế mới...Tất cả những nấc thang lịch sử vốn đa phần thể hiện sự xung đột của các động lực tâm lý học này đề cần phải được nghiên cứu bằng những phương pháp mượn từ khoa học tâm lý. (Gustave Le Bon)', 1, "Tên Nhà Cung Cấp: Alpha Books
Tác giả: Gustave Le Bon
NXB: NXB Thế Giới
Năm XB:	04-2014
Trọng lượng (gr): 650
Kích Thước Bao Bì: 20.5 x 14
Số trang: 443
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Châu Phi Nghìn Trùng", " Isak Dinesen", 132000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042845/PHOTO_LIST/Vanhoaxahoi_lichsu/014/", 
"NXB Phụ Nữ", 
'"Châu Phi Nghìn Trùng"
“Châu Phi nghìn trùng” của Isak Dinesen (bút danh của Karen Blixen) là một cuốn hồi ức về những năm tháng tác giả sống tại châu Phi (1914 - 1931) trên một đồn điền cà phê rộng 4000 mẫu Anh gần Nairobi. Cuốn sách được chia thành 5 phần, mô tả cư dân bản xứ, quan niệm về công lí, sự trừng phạt, và những vị khách của đồn điền.
Blixen đã có mối quan hệ thân tình với con người châu Phi, và đã đảm đương toàn bộ điền sản sau khi chia tay chồng. Tuy nhiên, do khí hậu và địa hình không thuận lợi cho cây cà phê, đồn điền của bà đã phải trải qua nhiều khó khăn và cuối cùng phải bán đi. Blixen sau đó trở về Đan Mạch và bắt đầu sự nghiệp viết lách. “Châu Phi nghìn trùng” được xuất bản vào năm 1937.', 1, "Tác giả: Isak Dinesen
Dịch giả: Hà Thế Giang;
Ngày xuất bản: 06-2021
Kích thước: 16 x 24 cm
Nhà xuất bản: NXB Phụ Nữ
Hình thức bìa: Bìa mềm
Số trang: 408", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Khái Lược Văn Minh Luận", "Fukuzawa Yukichi", 159000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042864/PHOTO_LIST/Vanhoaxahoi_lichsu/015/", 
"NXB Thế Giới", 
'"Khái Lược Văn Minh Luận"
Khái lược văn minh luận là cuốn sách đặc biệt quan trong của Fukuzawa Kukichi – nhà tư tưởng của cuộc Canh Tân Minh Trị để hình thành nên đất nước Nhật Bản hiện đại. Fukuzawa Kukichi nêu những kiến giải của ông về văn minh hiện đại hầu như đối lập với lối tư duy thủ cựu Nho giáo của Nhật Bản lúc bấy giờ. Từ đó, ông trình bày mọi suy nghĩ về tiến trình phát triển của người Nhật để trở thành một quốc gia, một dân tộc văn minh. Và theo ông, độc lập quốc gia là mục tiêu, và văn minh hiện tại của nước Nhật là cách thức để đạt được mục tiêu đó. (Lời giới thiệu – Nhật Chiêu)
Fukuzawa Yukichi viết cuốn sách này năm 1875, gần 10 năm sau khi công cuộc Minh Trị Duy tân bắt đầu ở Nhật. Đó là giai đoạn người Nhật vẫn phải đương đầu với những chống đối trong nước, với nhiều người thuộc phe có tinh thần bảo thủ muốn duy trì thể chế và nhất là văn hóa truyền thống lâu đời. Nhận thức được những khó khăn đó, Fukuzawa Yukichi tin rằng, cần lí giải rõ hành trình mà nước Nhật Bản phải đi để tạo dựng nền văn minh mới, nền văn minh hiện đại của một quốc gia hiện đại. Cả cuốn sách đề cập đến tiến trình này dưới nhiều yếu tố như thiết chế, việc học tập, thương mại, ông mô tả văn minh như một dòng chảy tất yếu của loài người. Xuyên suốt cuốn sách, ông đề cập những yếu tố cơ bản của nền văn minh: đó là khai sáng, tự do, công bằng và những điều tốt đẹp cho xã hội.
Điểm cốt lõi của tác phẩm mà Fukuzawa hướng tới là những gì nước Nhật cần làm để trở thành một quốc gia văn minh, những thay đổi thể chế, chính sách quốc gia, ước muốn độc lập thực sự cả về thương mại, kinh tế và tư tưởng là mục tiêu cao cả nhất. (Lời giới thiệu – Nguyễn Cảnh Bình).', 1, "Tên Nhà Cung Cấp: Alpha Books
Tác giả: Fukuzawa Yukichi
Người Dịch: Nguyễn Đỗ An Nhiên
NXB: NXB Thế Giới
Năm XB:	2018
Ngôn Ngữ: Tiếng Việt
Trọng lượng (gr): 500
Kích Thước Bao Bì: 20.5 x 14 cm
Số trang: 420
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Lên Đồng - Hành Trình Của Thần Linh Và Thân Phận", "Ngô Đức Thịnh", 98000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042882/PHOTO_LIST/Vanhoaxahoi_lichsu/016/", 
"NXB Dân Trí", 
'"Lên Đồng - Hành Trình Của Thần Linh Và Thân Phận"
“… lên đồng không phải là trạng thái bệnh lý, mà chỉ là trạng thái tâm sinh lý, là trạng thái biến đổi ý thức đặc biệt, ở đó các ông đồng, bà đồng chủ động tự đưa mình vào trạng thái ấy. Chính trong môi trường tự biến đổi ý thức đó, cái vô thức trỗi dậy, giúp bà đồng, ông đồng giải tỏa nhiều ức chế tâm thần cũng chính là nguồn gốc của nhiều hiện tượng tâm sinh lý, như điên loạn, bệnh tật, kết tóc, cơ đày... Và cũng không có gì ngạc nhiên khi ra đồng và thường xuyên lên đồng thì trong môi trường tự biến đổi ý thức do tự ám thị mà các ức chế vô thức được giải tỏa, dần khỏi bệnh, dần khắc phục được các hành vi lệch chuẩn và tái hòa nhập cộng đồng như những người bình thường khác.” Lên đồng, hành trình của thần linh và thân phận không chỉ dừng lại ở việc khái lược và nhận diện bản chất của hiện tượng lên đồng mà còn bước đầu cố gắng tìm hiểu các khía cạnh tâm sinh lý và trị liệu của hiện tượng này, cùng với đó là những vấn đề khác như cơ đầy, ái nam ái nữ, quan hệ đồng giới hay giải phóng các khát vọng của phụ nữ trong xã hội cổ truyền và xã hội hiện đại.', 1, "Tên Nhà Cung Cấp: Nhã Nam
Tác giả: Ngô Đức Thịnh
NXB: NXB Dân Trí
Năm XB: 2020
Ngôn Ngữ: Tiếng Việt
Trọng lượng (gr): 320
Kích Thước Bao Bì: 20.5 x 14 x 1.6 cm
Số trang: 304
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Văn Hóa - Văn Học Dưới Góc Nhìn Liên Không Gian", "Nguyễn Văn Dân", 138000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042902/PHOTO_LIST/Vanhoaxahoi_lichsu/017/", 
"NXB Thế Giới", 
'"Văn Hóa - Văn Học Dưới Góc Nhìn Liên Không Gian"
Cuốn sách này đề xuất một khái niệm mới về “quan hệ liên không gian” trong văn hoá - xã hội, mở ra cho độc giả một cái nhìn văn hoá - văn học từ góc độ toàn cầu hoá. Tác giả lý giải một số vấn đề về nhận thức văn hoá - xã hội và phê bình đối với một số hiện tượng văn hoá - văn học trong bối cảnh hội nhập quốc tế. Cuốn sách cung cấp cho độc giả một nguồn kiến thức về lý luận và thực tiễn văn hoá - xã hội, giúp ích cho những ai quan tâm đến tình hình nghiên cứu văn học - văn hoá - xã hội hiện tại của nước nhà. Tác giả có cách lập luận chặt chẽ, logic, liên hệ cụ thể đến các hiện tượng, sự việc thực tế, chỉ ra cả những khiếm khuyết trong nhận thức của một số người trong giới nghiên cứu. Cuốn sách là một nguồn kiến thức quý báu cho những ai quan tâm đến lĩnh vực này.', 1, "Nhà Cung Cấp: CÔNG TY TNHH PHÁT HÀNH S BOOKS
Tác giả: Nguyễn Văn Dân
NXB: NXB Thế Giới
Năm XB:	2020
Trọng lượng (gr): 250
Kích Thước Bao Bì: 20.5 x 14.5 cm
Số trang: 274
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Hội Hè Lễ Tết Của Người Việt", "Nguyễn Văn Huyên", 115000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042922/PHOTO_LIST/Vanhoaxahoi_lichsu/018/", 
"NXB Thế Giới", 
'"Hội Hè Lễ Tết Của Người Việt"
Hội Hè Lễ Tết Của Người Việt tập hợp những tiểu luận nghiên cứu của Nguyễn Văn Huyên về lễ-tết-hội, về tín ngưỡng, tâm thức tôn giáo của người Việt trong xã hội truyền thống. Viết bằng tiếng Pháp, những tiểu luận này, trước hết, là cách trò chuyện thú vị và hấp dẫn giữa một người trí thức bản địa với những độc giả, nhà nghiên cứu Pháp, những người cũng đang mong muốn và thậm chí, tham vọng tìm hiểu Việt Nam một cách kỹ càng. Thông qua cách trò chuyện mang tính hàn lâm đó, Nguyễn Văn Huyên còn tiến đến những vỡ lẽ nhận thức mà ngày nay chúng ta càng thấm thía hơn: chính sự đa dạng và khác biệt văn hóa của mỗi dân tộc, mỗi cộng đồng mới thực sự làm nên giá trị bền vững chứ không phải là hơn - kém hay ít - nhiều.
Cuốn sách sẽ cho ta trở lại đắm mình trong không khí của Tết Nguyên đán, Tết Thanh Minh, Tết Đoan Ngọ, Tết Trung thu…, cho ta hình dung rõ ràng và như được tham dự Lễ hội Phù Đổng. Những điều đặc biệt khác, như tục thờ cúng thần tiên, sự có mặt khắp chốn của thành hoàng làng, các húy kỵ sinh và tử, sự phong nhiêu của thần tiên gốc Việt…, cũng sẽ được tác giả mô tả, phân tích hết sức sinh động, tinh tế và khoa học.
Bởi luôn lắng nghe và suy tư về cỗi gốc dân tộc mình nên những trang viết của Nguyễn Văn Huyên, sau hơn bảy mươi năm, vẫn có thể mời gọi mọi độc giả Việt hôm nay cùng đọc lại, nghĩ suy và tiếp nối hành trình đối thoại, thông hiểu lẫn nhau.', 1, "Tên Nhà Cung Cấp: Nhã Nam
Tác giả: Nguyễn Văn Huyên
NXB: NXB Thế Giới
Năm XB: 12-2017
Trọng lượng (gr): 250
Kích Thước Bao Bì: 15 x 24
Số trang: 243
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Boxset Metalize Quý Ngài Phara-Ông (Bộ 3 Tập)", "Hiroto Wada", 120000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042945/PHOTO_LIST/Vanhoaxahoi_lichsu/019/", 
"NXB Kim Đồng", 
'"Boxset Metalize Quý Ngài Phara-Ông"
Lương 1.000 Yên/Giờ, tuổi đời đã 7.000 năm ~!
Xác ướp Phara-ông, Hoàng đế của Ai Cập cổ đại đã được khai quật và hồi sinh tại thành phố Kokubunji, Tokyo. Để hòa nhập với xã hội hiện đại, ngày ngày, ngài Phara-ông phải đối mặt với biết bao khó khăn trong cả công việc lẫn... chuyện tình cảm! Cuộc sống rời xa ngai vàng của vị vua Ai Cập cổ đại sẽ ra sao?
Tác phẩm thuộc thể loại hài-giật gân đã sẵn sàng ra mắt trong mùa hè này với một chiếc hộp Metalize lấp lánh đầy huyền bí, xin mời các bạn cùng đón đọc nhé!!', 1, "Độ Tuổi: 16+
Tên Nhà Cung Cấp: Nhà Xuất Bản Kim Đồng
Tác giả: Hiroto Wada
Người Dịch: Tanpopo Team
NXB: Kim Đồng
Năm XB: 2023
Ngôn Ngữ: Tiếng Việt
Trọng lượng (gr): 520
Kích Thước Bao Bì: 18 x 13 x 2.6 cm
Số trang: 480
Hình thức: Bìa Mềm", 100);

INSERT INTO Book(name, author, price, category_id, img, publisher, description, status, detail, quantity)
VALUES ("Lịch Sử Thế Giới Qua 6 Thức Uống - A History Of The World In 6 Glasses", "Tom Standage", 148000, 8, "https://res.cloudinary.com/dylwewmt0/image/upload/v1695042959/PHOTO_LIST/Vanhoaxahoi_lichsu/020/", 
"NXB Dân Trí", 
'"Lịch Sử Thế Giới Qua 6 Thức Uống - A History Of The World In 6 Glasses"
Cuốn sách đưa chúng ta ngược dòng thời gian khám phá những cánh đồng ngũ cốc mênh mông ở Lưỡng Hà và Ai Cập, vườn nho bạt ngàn nơi thành Rome, những đồi cà phê trù phú ở Ả Rập cùng sự phổ biến rộng rãi của trà Trung Quốc, và cuối cùng là sự lên ngôi của Hoa Kỳ cùng nước giải khát coca-cola.
Sáu thức uống - bia, rượu vang, rượu mạnh, cà phê, trà và coca-cola - không chỉ xoa dịu cơn khát và thỏa mãn đam mê của con người, mà còn là minh chứng cho mỗi giai đoạn đặc biệt trong nền văn minh nhân loại.
Sau tất cả, bạn sẽ thấy, ly đồ uống trong tay mình chứa đựng cả một câu chuyện nhân gian. 
Cuốn sách nhận hơn 25,000 lượt bình chọn trên Goodreads.', 1, "Tên Nhà Cung Cấp	Huy Hoang Bookstore
Tác giả:Tom Standage
Người Dịch: Miên Túc
NXB: Dân Trí
Năm XB: 2022
Trọng lượng (gr): 400
Kích Thước Bao Bì: 20.5 x 13 cm
Số trang: 372
Hình thức: Bìa Mềm", 100);

-- Thêm dữ liệu vào bảng Cart
INSERT INTO Cart(account_id) VALUES (3), (4);

-- Thêm dữ liệu vào bảng CartItem
INSERT INTO CartItem(quantity, cart_id, book_id) VALUES (2, 1, 1);
INSERT INTO CartItem(quantity, cart_id, book_id) VALUES (2, 1, 2);
INSERT INTO CartItem(quantity, cart_id, book_id) VALUES (2, 1, 3);
INSERT INTO CartItem(quantity, cart_id, book_id) VALUES (2, 1, 4);
INSERT INTO CartItem(quantity, cart_id, book_id) VALUES (2, 1, 5);
