package com.eticaret.eticaret.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eticaret.eticaret.dao.AdminDAO;
import com.eticaret.eticaret.dao.UrunDAO;
import com.eticaret.eticaret.model.Admin;
import com.eticaret.eticaret.model.Urun;

@Controller
public class HomeController {
	
	
	@Autowired
	UrunDAO urunDAO;

	@GetMapping(value = "/")
	public ModelAndView anasayfa(HttpServletResponse response) throws IOException {
		
		List<Urun> urunlerList = urunDAO.getAllUrunler();
		
		ModelAndView modelAndView = new ModelAndView("home");
		modelAndView.addObject("urunler" , urunlerList);
		
		
		return modelAndView;
		
	}

}
