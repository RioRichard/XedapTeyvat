using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using ServiceStack;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using Xedap.Models;
using UploadFile = Xedap.Models.Repo.UploadFile;

namespace Xedap.Helper
{
    public class HelperAdd
    {
       
        public static byte[] Hash(string plainText)
        {
            HashAlgorithm hashAlgorithm = HashAlgorithm.Create("SHA-512");
            return hashAlgorithm.ComputeHash(ASCIIEncoding.ASCII.GetBytes(plainText));
        }
        public static string HashToken(string plaintext)
        {
            HashAlgorithm hashAlgorithm = HashAlgorithm.Create("MD5");
            var output = hashAlgorithm.ComputeHash(ASCIIEncoding.ASCII.GetBytes(plaintext));
            var sb = new StringBuilder();
            for (int i = 0; i < output.Length; i++)
            {
                sb.Append(output[i].ToString("X2"));
            }

            return sb.ToString();

        }

        public static string RandomString(int len)
        {
            string p = "qwertyuiopasdfghjklzxcvbnm1234567890QWERTYUIOPASDFGHJKLZXCVBNM";
            char[] a = new char[len];
            Random random = new Random();
            for (int i = 0; i < len; i++)
            {
                a[i] = p[random.Next(p.Length)];
            }
            return string.Join("", a);
        }
        public static void SendMail(IConfiguration configuration, string toEmail, string content, string subject)
        {

            IConfigurationSection section = configuration.GetSection("email:gmail");
            SmtpClient client = new SmtpClient(section["host"], Convert.ToInt32(section["port"]))
            {
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(section["address"], HelperAdd.DecryptString("058ef654da951060eb6307d980548a86", section["password"])),
                EnableSsl = true
            };
            MailAddress addressFrom = new MailAddress(section["address"]);
            MailAddress addressTo = new MailAddress(toEmail);
            MailMessage message = new MailMessage(addressFrom, addressTo);

            message.Body = content;
            message.Subject = subject;
            client.Send(message);
        }
        public static string EncryptString(string key, string plainText)
        {
            byte[] iv = new byte[16];
            byte[] array;
            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(key);
                aes.IV = iv;
                ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);
                using (MemoryStream memoryStream = new MemoryStream())
                {
                    using (CryptoStream cryptoStream = new CryptoStream((Stream)memoryStream, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter streamWriter = new StreamWriter((Stream)cryptoStream))
                        {
                            streamWriter.Write(plainText);
                        }
                        array = memoryStream.ToArray();
                    }
                }
            }
            return Convert.ToBase64String(array);
        }
        public static string DecryptString(string key, string cipherText)
        {
            byte[] iv = new byte[16];
            byte[] buffer = Convert.FromBase64String(cipherText);

            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(key);
                aes.IV = iv;
                ICryptoTransform decryptor = aes.CreateDecryptor(aes.Key, aes.IV);
                using (MemoryStream memoryStream = new MemoryStream(buffer))
                {
                    using (CryptoStream cryptoStream = new CryptoStream((Stream)memoryStream, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader streamReader = new StreamReader((Stream)cryptoStream))
                        {
                            return streamReader.ReadToEnd();
                        }
                    }
                }
            }
        }
        public static string GenerateToken(string IdAccount)
        {
            var ConfirmToken = IdAccount + HelperAdd.RandomString(32);
            var HashToken = HelperAdd.HashToken(ConfirmToken);
            return HashToken;
        }
        public static string GerenerateIdAccount(DataContext context)
        {
            string IDAccount = "";
            bool checkSame = false;
            do
            {
                IDAccount = HelperAdd.RandomString(64);
                checkSame = context.Accounts.FirstOrDefault(p => p.IDAccount == IDAccount) == null;
            } while (!checkSame);
            return IDAccount;
        }
        public static string GerenerateIdStaff(DataContext context)
        {
            string IDAccount = "";
            bool checkSame = false;
            do
            {
                IDAccount = HelperAdd.RandomString(64);
                checkSame = context.AccountStaffs.FirstOrDefault(p => p.IDStaff == IDAccount) == null;
            } while (!checkSame);
            return IDAccount;
        }
        public static Guid GenerateGuidCart(DataContext context)
        {
            Guid newGuid = Guid.Empty;
            CartRepo check = null;
            do
            {
                newGuid = Guid.NewGuid();
                check = context.Carts.FirstOrDefault(p => p.IDCart == newGuid);
            } while (check != null);
            return newGuid;
        }
        public static Guid GenerateGuidInvoice(DataContext context)
        {
            Guid newGuid = Guid.Empty;
            Invoice check = null;
            do
            {
                newGuid = Guid.NewGuid();
                check = context.Invoices.FirstOrDefault(p => p.IDCart == newGuid);
            } while (check != null);
            return newGuid;
        }
        
        public static bool DeleteFile(string filename, string savePath)
        {
            string path = Path.Combine(savePath, filename);
            if (File.Exists(path))
            {
                File.Delete(path);
                return true;
            }

            return false;
        }
        public static UploadFile FileUpload(HttpPostedFileBase f, string savePath)
        {
            if (f != null && !string.IsNullOrEmpty(f.FileName))
            {
                UploadFile obj = new UploadFile()
                {
                    OriginalName = f.FileName,
                    ImageURL = HelperAdd.RandomString(32) + Path.GetExtension(f.FileName)
                };
                string path = Path.Combine(savePath, obj.ImageURL);
                f.SaveAs(path);
                return obj;
            }
            else return null;
        }

    }
    

}