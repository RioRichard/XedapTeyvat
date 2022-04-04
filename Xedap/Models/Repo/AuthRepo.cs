using System;
using System.Linq;
using System.Web.Security;
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
                return new { stringUrl = "/Auth/SignAndReg", message = "Trùng email hoặc UserName" };
            }
            else
            {
                var newAccount = new Account();
                newAccount.UserName = UserName;
                newAccount.IDAccount = HelperAdd.GerenerateIdAccount(context);
                newAccount.Email = Email;
                newAccount.Password = HelperAdd.Hash(newAccount.IDAccount + Pass);
                newAccount.Token = HelperAdd.GenerateToken(newAccount.IDAccount);
                newAccount.ExpiredTokenTime = DateTime.Now.AddMinutes(15);
                newAccount.IsConfirmed = false;
                newAccount.IsDelete = false;
                context.Accounts.Add(newAccount);
                context.SaveChanges();
                var msg = "Chào bạn, đây là email của hỗ trợ Teyvat. Đây là email xác thực của XeDapTeyVat. Hãy nhấn vào đường link sau để có thể xác thực tài khoản.\n" +
                    $"{HelperAdd.WebsiteUrl}/Auth/confirm/{newAccount.Token}";
                var subject = "Kích hoạt tài khoản XeDapTeyVat";
                HelperAdd.SendMail(newAccount.Email, msg, subject);

                return new { stringUrl = "/Auth/SignAndReg", message = "Đăng kí thành công. Vui lòng vào email của bạn để nhấn vào link xác nhận." };
                
            }
        }
        public object Login(string UserName, string Pass, bool rememberMe)
        {
            var account = context.Accounts.FirstOrDefault(p => p.UserName == UserName);
            if (account == null)
            {
                return new { stringUrl = "/Auth/SignAndReg", message = "Sai Username hoặc Password" };

            }
            else
            {
                var check = HelperAdd.Hash(account.IDAccount + Pass);
                if (check.SequenceEqual(account.Password) )
                {
                    if(account.IsConfirmed == false)
                    {
                        var time = DateTime.Compare(((DateTime)account.ExpiredTokenTime).AddMinutes(15), DateTime.Now);
                        if ( time< 0)
                        {
                            account.Token = HelperAdd.GenerateToken(account.IDAccount);
                            account.ExpiredTokenTime = DateTime.Now.AddMinutes(15);
                            context.SaveChanges();
                            var msg = "Chào bạn, đây là email của hỗ trợ Teyvat. Đây là email xác thực của XeDapTeyVat." +
                                " Hãy nhấn vào đường link sau để có thể xác thực tài khoản.\n" +
                                $"{HelperAdd.WebsiteUrl}/Auth/confirm/{account.Token}";
                            var subject = "Kích hoạt tài khoản XeDapTeyVat";
                            HelperAdd.SendMail(account.Email, msg, subject);
                        }
                        
                        return new { stringUrl = "/Auth/SignAndReg", message = "Tài khoản bạn chưa được kích hoạt. Vui lòng xem email kích hoạt tài khoản." };

                    }

                    FormsAuthentication.SetAuthCookie(account.IDAccount,rememberMe);
                    return new { stringUrl = "/", message = "Đăng nhập thành công" };

                }
                return new { stringUrl = "/Auth/SignAndReg", message = "Sai Username hoặc Password" };

            }
        }

    }
}