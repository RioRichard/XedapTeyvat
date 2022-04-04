using System.Linq;

namespace Xedap.Models.Repo
{
    public class AttributeRepo
    {
        public static Attribute AddAttribute(DataContext context, string attributeName2)
        {
            var newAttribute = new Attribute()
            {
                AttributeName = attributeName2,
                IsDelete = false,
            };
            context.Attributes.Add(newAttribute);
            context.SaveChanges();
            return newAttribute;
        }
        public static bool EditAttribute(DataContext context, int attrID, string attrName)
        {
            var IdAttr = context.Attributes.FirstOrDefault(p => p.IDAttribute == attrID);
            if (IdAttr == null)
            {
                return false;
            }
            else
            {
                IdAttr.AttributeName = attrName;
                context.SaveChanges();
                return true;
            }
        }
    }
}