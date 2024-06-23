package com.eticaret.eticaret.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.eticaret.eticaret.dao.KullaniciDAO;
import com.eticaret.eticaret.dao.SepetDAO;
import com.eticaret.eticaret.dao.SepettekiUrunDAO;
import com.eticaret.eticaret.dao.SiparisDAO;
import com.eticaret.eticaret.dao.SiparistekiUrunDAO;
import com.eticaret.eticaret.dao.UrunDAO;
import com.eticaret.eticaret.model.Kullanici;
import com.eticaret.eticaret.model.Sepet;
import com.eticaret.eticaret.model.SepettekiUrun;
import com.eticaret.eticaret.model.SepettekiUrunListe;
import com.eticaret.eticaret.model.Siparis;
import com.eticaret.eticaret.model.SiparistekiUrun;
import com.eticaret.eticaret.model.SiparistekiUrunlerListe;
import com.eticaret.eticaret.model.Urun;

@Controller
public class KullaniciController {
    @Autowired
    KullaniciDAO kullaniciDAO;
    @Autowired
    SepetDAO sepetDAO;
    @Autowired
    UrunDAO urunDAO;
    @Autowired
    SiparisDAO siparisDAO;
    @Autowired
    SepettekiUrunDAO sepettekiUrunDAO;
    @Autowired
    SiparistekiUrunDAO siparistekiUrunDAO;

    @GetMapping(value = "/register")
    public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return new ModelAndView("register");
    }
    @GetMapping(value = "/login")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        return new ModelAndView("login");
    }

    @GetMapping(value = "/profil")
    public ModelAndView profil(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Kullanici kullanici = (Kullanici) session.getAttribute("user");

        if (kullanici != null) {
            List<SiparistekiUrunlerListe> siparistekiUrunlerListes = new ArrayList<SiparistekiUrunlerListe>();
            List<Siparis> siparislerList = siparisDAO.getSiparislerByUserId(kullanici.getId());

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
            ModelAndView modelAndView = new ModelAndView("profile");
            modelAndView.addObject("siparisurunleri", siparistekiUrunlerListes);
            return modelAndView;
        }
        ModelAndView modelAndView = new ModelAndView("home");
        return modelAndView;
    }

    @GetMapping(value = "/removeFromCart/{productId}")
    public void removeFromCart(@PathVariable int productId, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            HttpSession session = request.getSession();
            Kullanici kullanici = (Kullanici) session.getAttribute("user");

            if (kullanici != null) {
                Sepet sepet = sepetDAO.getSepetByUserId(kullanici.getId());
                sepettekiUrunDAO.deleteSepettekiUrun(sepet.getId(), productId);
                response.sendRedirect("/eticaret/sepet");
            }
        } catch (Exception e) {
        }
    }

    @GetMapping(value = "/sepet")
    public ModelAndView sepet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            HttpSession session = request.getSession();
            Kullanici kullanici = (Kullanici) session.getAttribute("user");

            if (kullanici != null) {
                Sepet sepet = sepetDAO.getSepetByUserId(kullanici.getId());
                List<SepettekiUrun> sepettekiUruns = sepettekiUrunDAO.getSepettekiUrunBySepetId(sepet.getId());
                List<SepettekiUrunListe> sepettekiUrunListes = new ArrayList<SepettekiUrunListe>();

                for (SepettekiUrun sepettekiUrun : sepettekiUruns) {
                    SepettekiUrunListe sepettekiUrunListe = new SepettekiUrunListe();
                    Urun urun = urunDAO.getUrunById(sepettekiUrun.getUrunId());
                    sepettekiUrunListe.setAdet(sepettekiUrun.getAdet());
                    sepettekiUrunListe.setUrun(urun);
                    sepettekiUrunListes.add(sepettekiUrunListe);
                }
                session.setAttribute("sepettekiUrunler", sepettekiUrunListes); // Sepetteki ürünleri session'a ekle
                ModelAndView modelAndView = new ModelAndView("cart");
                modelAndView.addObject("sepettekiUrunler", sepettekiUrunListes);
                return modelAndView;
            } else {
                response.sendRedirect("/eticaret/login");
            }
        } catch (Exception e) {
            System.out.println(e);
            ModelAndView modelAndView = new ModelAndView("home");
            return modelAndView;
        }
        return new ModelAndView("home");
    }

    @PostMapping(value = "/login")
    public void loginpost(@RequestParam("email") String email, @RequestParam("sifre") String sifre,
            HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Kullanici kullanici = kullaniciDAO.getKullaniciByEmail(email);
            if (kullanici != null) {
                if (sifre.equals(kullanici.getSifre())) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", kullanici);
                    session.setAttribute("userId", kullanici.getId());
                    response.sendRedirect("/eticaret");
                }
            }
        } catch (Exception e) {
        }
    }

    @PostMapping(value = "/createOrder")
    public void createOrder(@RequestParam("adres") String adres, @RequestParam("totalPrice") double totalPrice,
            @RequestParam("odemeyontemi") String odemeyontemi, HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        try {
            HttpSession session = request.getSession();
            Kullanici kullanici = (Kullanici) session.getAttribute("user");

            if (kullanici != null) {
                Siparis siparis = new Siparis();
                siparis.setAdres(adres);
                siparis.setOdemeYontemi(odemeyontemi);
                siparis.setTutar(totalPrice);
                siparis.setUserId(kullanici.getId());

                int id = siparisDAO.addSiparis(siparis);
                Sepet sepet = sepetDAO.getSepetByUserId(kullanici.getId());
                List<SepettekiUrun> sepettekiUruns = sepettekiUrunDAO.getSepettekiUrunBySepetId(sepet.getId());

                for (SepettekiUrun sepettekiUrun : sepettekiUruns) {
                    SiparistekiUrun siparistekiUrun = new SiparistekiUrun();
                    siparistekiUrun.setAdet(sepettekiUrun.getAdet());
                    siparistekiUrun.setUrunId(sepettekiUrun.getUrunId());
                    siparistekiUrun.setSiparisId(id);
                    siparistekiUrunDAO.addSiparistekiUrun(siparistekiUrun);
                }
                sepettekiUrunDAO.clearSepetBySepetId(sepet.getId());
                response.sendRedirect("/eticaret/");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @GetMapping(value = "/addToCart/{productId}")
    public void addToCart(@PathVariable int productId, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            HttpSession session = request.getSession();
            Kullanici kullanici = (Kullanici) session.getAttribute("user");
            if (kullanici == null) {
                response.sendRedirect("/eticaret/login");
            } else {
                int kullaniciId = (int) session.getAttribute("userId");
                Sepet sepet = sepetDAO.getSepetByUserId(kullaniciId);
                SepettekiUrun sepettekiUrun1 = sepettekiUrunDAO.getBySepetIdAndProductId(sepet.getId(), productId);

                if (sepettekiUrun1 == null) {
                    SepettekiUrun sepettekiUrun = new SepettekiUrun(sepet.getId(), productId, 1);
                    sepettekiUrunDAO.addSepettekiUrun(sepettekiUrun);
                } else {
                    sepettekiUrun1.setAdet(sepettekiUrun1.getAdet() + 1);
                    sepettekiUrunDAO.updateSepettekiUrun(sepettekiUrun1);
                }
                response.sendRedirect("/eticaret");
            }
        } catch (Exception e) {
        }
    }

    @PostMapping(value = "/register")
    public ModelAndView registerPost(@RequestParam("isim") String isim, @RequestParam("email") String email,
            @RequestParam("sifre") String sifre, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            Kullanici kullanici = new Kullanici();
            kullanici.setEmail(email);
            kullanici.setIsim(isim);
            kullanici.setSifre(sifre);
            int createdKullaniciId = kullaniciDAO.addKullanici(kullanici);
            Sepet sepet = new Sepet();
            sepet.setUserId(createdKullaniciId);
            sepetDAO.addSepet(sepet);
            HttpSession session = request.getSession();
            session.setAttribute("user", kullanici);
            session.setAttribute("userId", createdKullaniciId);
        } catch (Exception e) {
        }
        response.sendRedirect("/eticaret/");
        ModelAndView modelAndView = new ModelAndView("home");
        return modelAndView;
    }
}
