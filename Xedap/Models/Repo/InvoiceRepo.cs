using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Xedap.Models.Repo
{
    public class InvoiceRepo
    {
        public static Invoice GetInvoiceDetail(DataContext context, Guid IDInvoice)
        {
            var Invoice = context.Invoices.FirstOrDefault(p => p.IDInvoice == IDInvoice);
            var productCart = CartRepo.GetAllCartItemInInvoice(context, Invoice.IDCart);
            Invoice.ProductCarts = productCart;
            Invoice.Total = (int)productCart.Sum(p => p.Total);
            var status = context.Status.FirstOrDefault(p => p.IDStatus == Invoice.IDStatus);
            Invoice.Status = status;
            var address = context.Addresses.FirstOrDefault(p => p.IDAddress == Invoice.IDAddress);
            Invoice.Address = address;
            return Invoice;

        }
        public static List<Invoice> GetInvoices(DataContext context, string userId)
        {
            var invoices = GetAllInVoiceOfAccount(context, userId);
            var result = new List<Invoice>();
            foreach (var item in invoices)
            {
                result.Add(GetInvoiceDetail(context, item.IDInvoice));
            }
            return result;
        }
        static List<Invoice> GetAllInVoiceOfAccount(DataContext context, string userId)
        {
            var address = context.AccountAddresses.Where(p => p.IDAccount == userId).ToList();
            var user = context.Accounts.FirstOrDefault(p => p.IDAccount == userId).UserName;
            var invoices = context.Invoices.ToList();
            var result = (from add in address
                          join inc in invoices
                          on add.IDAddress equals inc.IDAddress
                          select inc).ToList();
            foreach (var item in result)
            {
                item.UserName = user;
            }

            return result;
        }
        public static int TotalInvoice(List<Invoice> invoices, int findInThisMonth = 0)
        {
            if (findInThisMonth == 1)
            {
                DateTime now = DateTime.Now;
                var startDate = new DateTime(now.Year, now.Month, 1);
                var endDate = startDate.AddMonths(1).AddDays(-1);
                invoices.Where(p => p.DateCreated >= startDate && p.DateExpired <= endDate).ToList();
            }
            var total = invoices.Sum(p => p.Total);
            return total;
        }
        public static List<Account> TotalBuyFolowUser(DataContext context)
        {

            var result = context.Accounts.ToList();
            foreach (var item in result)
            {
                var invoice = GetInvoices(context, item.IDAccount);
                var total = TotalInvoice(invoice);
                item.TotalBought = total;
            }


            return result;
        }
        public static List<Invoice> GetAllInvoice(DataContext context)
        {

            var invoices = context.Invoices.ToList();
            var detailedInvoice = new List<Invoice>();
            foreach (var item in invoices)
            {
                detailedInvoice.Add(GetInvoiceDetail(context, item.IDInvoice));
            }

            return detailedInvoice;
        }
        public static bool EditInvoice(DataContext context, int StatusID, Guid IDInvoice)
        {
            var Invo = context.Invoices.FirstOrDefault(p => p.IDInvoice == IDInvoice);
            if (Invo == null)
            {
                return false;
            }
            else
            {
                Invo.IDStatus = StatusID;
                context.SaveChanges();
                return true;
            }
        }
    }
    
    
}