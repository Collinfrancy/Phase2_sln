using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace CounterProject
{
    public static class CounterConfig
    {
        //forms 
        public static Window FrmNewCounter { get; set; }


        //view model
        public static CounterViewMode VueModel { get; set; }

        static CounterConfig()
        {
            VueModel = new CounterViewMode();
            FrmNewCounter = new CounterWindow();


        }
    }
}