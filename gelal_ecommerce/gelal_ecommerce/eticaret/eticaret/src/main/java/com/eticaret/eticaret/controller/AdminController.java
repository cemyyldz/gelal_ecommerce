package com.eticaret.eticaret.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eticaret.eticaret.dao.AdminDAO;
import com.eticaret.eticaret.dao.KullaniciDAO;
import com.eticaret.eticaret.dao.SiparisDAO;
import com.eticaret.eticaret.dao.SiparistekiUrunDAO;
import com.eticaret.eticaret.dao.UrunDAO;
import com.eticaret.eticaret.model.Admin;
import com.eticaret.eticaret.model.Kullanici;
import com.eticaret.eticaret.model.Siparis;
import com.eticaret.eticaret.model.SiparistekiUrun;
import com.eticaret.eticaret.model.SiparistekiUrunlerListe;
import com.eticaret.eticaret.model.Urun;

@Controller
public class AdminController {
    @Autowired
    AdminDAO adminDao;

    @Autowired
    SiparisDAO siparisDAO;
    @Autowired
    SiparistekiUrunDAO siparistekiUrunDAO;
    @Autowired
    UrunDAO urunDAO;

    @Autowired
    KullaniciDAO kullaniciDAO;

    @GetMapping(value = "/admin/login")
    public ModelAndView adminLogin(HttpServletResponse response) throws IOException {
        return new ModelAndView("adminLogin");
    }

    @GetMapping(value = "/admin/products")
    public ModelAndView adminLoginprodc(HttpServletResponse response) throws IOException {
        ModelAndView modelAndView = new ModelAndView("adminPanelProducts");
        List<Urun> urunlerList = urunDAO.getAllUrunler();
        modelAndView.addObject("urunler", urunlerList);
        return modelAndView;
    }

    @GetMapping(value = "/admin/kullanicilar")
    public ModelAndView kullanicilar(HttpServletResponse response) throws IOException {
        ModelAndView modelAndView = new ModelAndView("adminPanelCustomer");
        List<Kullanici> kullanicis = kullaniciDAO.getAllKullanicilar();
        modelAndView.addObject("kullanicilar", kullanicis);
        return modelAndView;
    }

    @GetMapping(value = "/admin/siparisler")
    public ModelAndView siparisler(HttpServletResponse response) throws IOException {
        List<SiparistekiUrunlerListe> siparistekiUrunlerListes = new ArrayList<SiparistekiUrunlerListe>();
        List<Siparis> siparislerList = siparisDAO.getAllSiparisler();

        for (Siparis siparis : siparislerList) {
            List<SiparistekiUrun> siparistekiUruns = siparistekiUrunDAO.getSiparistekiUrunBySiparisId(siparis.getId());
            for (SiparistekiUrun siparistekiUrun : siparistekiUruns) {
                SiparistekiUrunlerListe siparistekiUrunlerListe = new SiparistekiUrunlerListe();
                siparistekiUrunlerListe.setAdet(siparistekiUrun.getAdet());
                siparistekiUrunlerListe.setUrun(urunDAO.getUrunById(siparistekiUrun.getUrunId()));
                siparistekiUrunlerListe.setAdres(siparis.getAdres());
                siparistekiUrunlerListe.setOdemeYontemi(siparis.getOdemeYontemi());
                siparistekiUrunlerListes.add(siparistekiUrunlerListe);
            }
        }
        ModelAndView modelAndView = new ModelAndView("adminPanelOrder");
        modelAndView.addObject("siparisurunleri", siparistekiUrunlerListes);
        return modelAndView;
    }

    @GetMapping(value = "/admin/delete/{productId}")
    public void deletePRod(@PathVariable int productId, HttpServletResponse response) throws IOException {
        try {
            urunDAO.deleteUrun(productId);
            response.sendRedirect("/eticaret/admin/products");
        } catch (Exception e) {
        }
    }

    @GetMapping(value = "/admin/deleteUser/{userId}")
    public void deleteUser(@PathVariable int userId, HttpServletResponse response) throws IOException {
        try {
            System.out.println(userId);
            kullaniciDAO.deleteKullanici(userId);
            response.sendRedirect("/eticaret/admin/kullanicilar");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @GetMapping(value = "/admin/addProduct")
    public ModelAndView adminAddProduct(HttpServletResponse response) throws IOException {
        return new ModelAndView("adminProductDetails");
    }

    @PostMapping(value = "/admin/addProduct")
    public ModelAndView adminCreateProdc(@RequestParam("isim") String isim, 
                                         @RequestParam("aciklama") String aciklama,
                                         @RequestParam("fiyat") double fiyat, 
                                         @RequestParam("resimUrl") String resimUrl,
                                         HttpServletResponse response) throws IOException {
        try {
            Urun urun = new Urun();
            urun.setAciklama(aciklama);
            urun.setFiyat(fiyat);
            urun.setIsim(isim);
            urun.setResimUrl(resimUrl);
            urunDAO.addUrun(urun);
            response.sendRedirect("/eticaret/admin/products");
            return new ModelAndView("header");
        } catch (Exception e) {
            System.out.println(e);
            ModelAndView modelAndView = new ModelAndView("home");
            return modelAndView;
        }
    }

    @PostMapping(value = "/admin/login")
    public ModelAndView adminLoginPost(@RequestParam("email") String email, @RequestParam("sifre") String sifre,
                                       HttpServletResponse response) throws IOException {
        try {
            Admin admin = adminDao.getAdminByEmail(email);
            if (admin != null && sifre.equals(admin.getPassword())) {
                response.sendRedirect("/eticaret/admin/products");
                return null;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        ModelAndView modelAndView = new ModelAndView("adminLogin");
        modelAndView.addObject("message", "Invalid email or password!");
        return modelAndView;
    }
}
