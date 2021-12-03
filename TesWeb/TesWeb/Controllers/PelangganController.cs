using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TesWeb.Controllers
{
    public class PelangganController : Controller
    {
        TesWebEntities _context = new TesWebEntities();

        public ActionResult Index()
        {
            var listofData = _context.Pelanggans.ToList();
            return View(listofData);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Pelanggan model)
        {
            _context.Pelanggans.Add(model);
            _context.SaveChanges();
            ViewBag.Message = "Data Insert Successfully";
            return View();
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var data = _context.Pelanggans.Where(x => x.PelangganID == id).FirstOrDefault();
            return View(data);
        }
        [HttpPost]
        public ActionResult Edit(Pelanggan Model)
        {
            var data = _context.Pelanggans.Where(x => x.PelangganID == Model.PelangganID).FirstOrDefault();
            if (data != null)
            {
                data.Nama = Model.Nama;
                data.Alamat = Model.Alamat;
                data.NoTelp = Model.NoTelp;
                _context.SaveChanges();
            }

            return RedirectToAction("index");
        }
        public ActionResult Delete(int id)
        {
            var data = _context.Pelanggans.Where(x => x.PelangganID == id).FirstOrDefault();
            _context.Pelanggans.Remove(data);
            _context.SaveChanges();
            ViewBag.Messsage = "Record Delete Successfully";
            return RedirectToAction("index");
        }
    }
}