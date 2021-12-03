using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TesWeb.Controllers
{
    public class TransaksiController : Controller
    {
        TesWebEntities _context = new TesWebEntities();

        public ActionResult Index()
        {
            var listofData = _context.Transaksis.ToList();
            return View(listofData);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Transaksi model)
        {
            _context.Transaksis.Add(model);
            _context.SaveChanges();
            ViewBag.Message = "Data Insert Successfully";
            return View();
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var data = _context.Transaksis.Where(x => x.TransaksiID == id).FirstOrDefault();
            return View(data);
        }
        [HttpPost]
        public ActionResult Edit(Transaksi Model)
        {
            var data = _context.Transaksis.Where(x => x.TransaksiID == Model.TransaksiID).FirstOrDefault();
            if (data != null)
            {
                data.KodeTransaksi = Model.KodeTransaksi;
                data.Tanggal = Model.Tanggal;
                data.PelangganID = Model.PelangganID;
                data.Total = Model.Total;
                _context.SaveChanges();
            }

            return RedirectToAction("index");
        }
        public ActionResult Delete(int id)
        {
            var data = _context.Transaksis.Where(x => x.TransaksiID == id).FirstOrDefault();
            _context.Transaksis.Remove(data);
            _context.SaveChanges();
            ViewBag.Messsage = "Record Delete Successfully";
            return RedirectToAction("index");
        }
    }
}