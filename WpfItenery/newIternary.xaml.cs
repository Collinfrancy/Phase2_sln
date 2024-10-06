using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace WpfItenery
{
    /// <summary>
    /// Interaction logic for newIternary.xaml
    /// </summary>
    public partial class newIternary : Window
    {
        public newIternary()
        {
            InitializeComponent();
            this.DataContext = ItenaryConfig.VueModel;
        }
        public void WindowClose()
        {
            this.Hide();
        }
        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            e.Cancel = true;
            this.Hide();
        }

        private void btnCreate_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
