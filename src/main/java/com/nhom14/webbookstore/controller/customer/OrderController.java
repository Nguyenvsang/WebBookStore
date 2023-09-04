package com.nhom14.webbookstore.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhom14.webbookstore.entity.Account;
import com.nhom14.webbookstore.entity.Cart;
import com.nhom14.webbookstore.entity.CartItem;
import com.nhom14.webbookstore.service.CartItemService;
import com.nhom14.webbookstore.service.CartService;
import com.nhom14.webbookstore.service.OrderService;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {

	private OrderService orderService;
	private CartService cartService;
	private CartItemService cartItemService;

	@Autowired
	public OrderController(OrderService orderService, CartService cartService, CartItemService cartItemService) {
		super();
		this.orderService = orderService;
		this.cartService = cartService;
		this.cartItemService = cartItemService;
		
	}
	
	@GetMapping("/shippinginformation")
    public String shippingInformation(@RequestParam(value = "totalAmount", required = false) Double totalAmount,
    		//Double chấp nhận totalAmount là null còn double thì không
    		HttpSession session, 
    		Model model) {

        Account account = (Account) session.getAttribute("account");

        // Kiểm tra xem người dùng đã đăng nhập hay chưa
        if (account == null) {
            // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
            return "redirect:/customer/loginaccount";
        }

        // Kiểm tra xem giỏ hàng có hàng không
        Cart cart = cartService.getCartByAccount(account);
        List<CartItem> cartItems = cartItemService.getCartItemsByCart(cart);
        if (cartItems.isEmpty() || totalAmount == null) {
            return "redirect:/viewcart";
        }

        model.addAttribute("account", account);
        model.addAttribute("totalAmount", totalAmount);

        return "customer/shippinginformation";
    }
}
