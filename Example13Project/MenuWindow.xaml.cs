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

namespace Example13Project
{
    /// <summary>
    /// Interaction logic for MenuWindow.xaml
    /// </summary>
    public partial class MenuWindow : Window
    {
        public MenuWindow()
        {
            InitializeComponent();
        }
        private MainWindow frmmainWindow=new MainWindow();
        private SquareCalc frmSquareCalc =new SquareCalc();
        private sumCalc frmSumCalc = new sumCalc();

        private void btnCounter_Click(object sender, RoutedEventArgs e)
        {
            
            frmmainWindow.Show();
            frmmainWindow.Activate();
        }

        private void btnSumCalc_Click(object sender, RoutedEventArgs e)
        {

            frmSumCalc.Show();
            frmSumCalc.Activate();
        }

        private void btnSquare_Click(object sender, RoutedEventArgs e)
        {

            frmSquareCalc.Show();
            frmSquareCalc.Activate();
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            e.Cancel = true;
            this.Hide();
        }
    }
}
