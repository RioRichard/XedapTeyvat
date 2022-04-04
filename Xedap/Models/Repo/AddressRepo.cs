using System.Linq;

namespace Xedap.Models.Repo
{
    public class AddressRepo
    {
        //public static List<AccountAddress> GetAddressByUser(DataContext context, string userID)
        //{
        ////    var addressAccount = context.AccountAddresses.Where(p => p.IDAccount == userID).ToList();
        ////    var address = context.Addresses.ToList();
           
        ////    return result;
        ////}

        public static void AddAccount(DataContext context, string userId, string address, string phone, string receiver, bool isDefault)
        {
            var newAddress = AddNewAddress(context, address, phone, receiver);
            AddNewAccountAddress(context, newAddress, userId, isDefault);
        }
        static Address AddNewAddress(DataContext context, string address, string phone, string receiver)
        {
            var newAddress = new Address()
            {
                Address1 = address,
                Phone = phone,
                Reciever = receiver
            };
            context.Addresses.Add(newAddress);
            context.SaveChanges();
            return newAddress;
        }
        static AccountAddress AddNewAccountAddress(DataContext context, Address address, string userId, bool isDefalut)
        {
            var checkHaveAddress = context.AccountAddresses.FirstOrDefault(p => p.IDAccount == userId);
            if (checkHaveAddress == null)
                isDefalut = true;
            if (isDefalut == true)
            {
                SetDefaultAnotherAddress(context, userId);
            }
            var newAccountAddress = new AccountAddress()
            {
                IDAccount = userId,
                IDAddress = (int)address.IDAddress,
                IsDefault = isDefalut
            };
            context.AccountAddresses.Add(newAccountAddress);
            context.SaveChanges();
            return newAccountAddress;
        }
        static void SetDefaultAnotherAddress(DataContext context, string userId)
        {
            var accountAddressDefault = context.AccountAddresses.FirstOrDefault(p => p.IsDefault == true && p.IDAccount == userId);
            if (accountAddressDefault != null)
            {
                accountAddressDefault.IsDefault = false;
                context.SaveChanges();
            }
        }
        public static void SetDefault(DataContext context, string userId, int addId)
        {
            SetDefaultAnotherAddress(context, userId);
            var addressAccount = context.AccountAddresses.FirstOrDefault(p => p.IDAccount == userId && p.IDAddress == addId);
            addressAccount.IsDefault = true;
            context.SaveChanges();
        }
    }
}