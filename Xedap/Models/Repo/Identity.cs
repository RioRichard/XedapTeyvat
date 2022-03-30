using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;

namespace Xedap.Models.Repo
{
    public class Identity : IIdentity
    {
        public string Name => throw new NotImplementedException();

        public string AuthenticationType => throw new NotImplementedException();

        public bool IsAuthenticated => throw new NotImplementedException();
        public string Id { get; private set; }
        public string Email { get; private set; }

        public Identity(string id, string email)
        {
            this.Id = id;
            this.Email = email;
        }
    }
}