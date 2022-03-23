using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Xedap.Helper;

namespace Xedap.Models.Repo
{
    public class AuthRepo
    {

        DataContext context;

        public AuthRepo(DataContext context)
        {
            this.context = context;
        }


        public object AddAccount(string UserName, string Pass, string Email)
        {
            var account = context.Accounts.ToList();
            if (account.FirstOrDefault(p => p.Email == Email || p.UserName == UserName) != null)
            {
                return new { stringUrl = "/Account/Register", message = "Trùng email hoặc UserName" };
            }
            else
            {
                var newAccount = new Account();
                newAccount.UserName = UserName;
                newAccount.IDAccount = HelperAdd.GerenerateIdAccount(context);
                newAccount.Email = Email;
                newAccount.Password = HelperAdd.Hash(newAccount.IDAccount + Pass);
                newAccount.Token = HelperAdd.GenerateToken(newAccount.IDAccount);
                newAccount.IsConfirmed = false;
                newAccount.IsDelete = false;
                context.Accounts.Add(newAccount);
                context.SaveChanges();  
                return new { stringUrl = "/Account/Login", message = "Đăng kí thành công. Vui lòng vào email của bạn để nhấn vào link xác nhận." };
                
            }
        }

    }
}