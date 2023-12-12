using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace WorldSkills2014.Models
{
    public partial class Employee
    {
        public string FullName
        {
            get
            {
                return $"{Name}";
            }
        }
    }
}
