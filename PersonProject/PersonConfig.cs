using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PersonProject
{
    static class PersonConfig
    {
        public static EditPersonWindow FrmEditPersom {  get; set; }
        public static PersonViewModel VueModel { get; set; }


        static PersonConfig()
        {
            VueModel=new PersonViewModel();
            FrmEditPersom = new EditPersonWindow();
    }


    }

    

}
