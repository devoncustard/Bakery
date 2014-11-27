using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BakeryMonitor_MVC
{
    public class BakeryLog
    {
        public string id { get; set; }
        public DateTime datetime { get; set; }
        public string shortname { get; set; }
        public string log { get; set; }

        public BakeryLog(string ID,DateTime DATETIME,string SHORTNAME,string LOG)
        {
            id = ID;
            datetime = DATETIME;
            shortname = SHORTNAME;
            log = LOG;
        }
    }
}
