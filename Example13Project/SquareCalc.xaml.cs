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
    /// Interaction logic for SquareCalc.xaml
    /// </summary>
    public partial class SquareCalc : Window
    {
        public SquareCalc()
        {
            InitializeComponent();
        }
        private bool IsNum(string numStr)
        {
            try
            {
                int.Parse(numStr);
                return true;
            }
            catch { return false; }
        }

        private void btnSquare_Click(object sender, RoutedEventArgs e)
        {
            if (!IsNum(txtNumber.Text))
            {
                MessageBox.Show("Please enter Number");
                txtNumber.Focus();
                txtNumber.SelectAll();
                return;
            }
            int number = int.Parse(txtNumber.Text);
        
            int result = number*number;
            lblResult.Text = "Square";
            txtResult.Text = result.ToString();

        }

        private void btnCube_Click(object sender, RoutedEventArgs e)
        {
            if (!IsNum(txtNumber.Text))
            {
                MessageBox.Show("Please enter Number");
                txtNumber.Focus();
                txtNumber.SelectAll();
                return;
            }
            int number = int.Parse(txtNumber.Text);
            lblResult.Text = "cube";

            int result = number * number * number;
            txtResult.Text = result.ToString();
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            e.Cancel = true;
            this.Hide();
        }
    }
}
