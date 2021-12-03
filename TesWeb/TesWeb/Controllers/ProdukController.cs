using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TesWeb.Controllers
{
    public class ProdukController : Controller
    {
        TesWebEntities _context = new TesWebEntities();

        public ActionResult Index()
        {
            var listofData = _context.Produks.ToList();
            return View(listofData);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Produk model)
        {
            _context.Produks.Add(model);
            _context.SaveChanges();
            ViewBag.Message = "Data Insert Successfully";
            return View();
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var data = _context.Produks.Where(x => x.ProdukID == id).FirstOrDefault();
            return View(data);
        }
        [HttpPost]
        public ActionResult Edit(Produk Model)
        {
            var data = _context.Produks.Where(x => x.ProdukID == Model.ProdukID).FirstOrDefault();
            if (data != null)
            {
                data.Nama = Model.Nama;
                data.Harga = Model.Harga;
                data.Deskripsi = Model.Deskripsi;
                _context.SaveChanges();
            }

            return RedirectToAction("index");
        }
        public ActionResult Delete(int id)
        {
            var data = _context.Produks.Where(x => x.ProdukID == id).FirstOrDefault();
            _context.Produks.Remove(data);
            _context.SaveChanges();
            ViewBag.Messsage = "Record Delete Successfully";
            return RedirectToAction("index");
        }
    }
}