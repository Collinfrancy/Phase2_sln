<Window x:Class="MATProject.Pages.DashboardWindow"  WindowState="Maximized"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:MATProject.Pages"
        mc:Ignorable="d"
        Title="DashboardWindow" Height="450" Width="800" Closing="Window_Closing">
    <DockPanel Margin="0,0,-11,0">


        <!--Main Content Area-->
        <Grid Margin="10">
            <!--Medication Overview Section-->
            <GroupBox Header="Today's Medication Overview" Margin="10,10,10,0" VerticalAlignment="Top" Height="150" FontSize="16" FontFamily="Verdana" FontWeight="Bold">
                <DataGrid x:Name="medicationDataGrid"  AutoGenerateColumns="False" CanUserAddRows="True" ItemsSource="{Binding Medications}" FontWeight="Normal" FontSize="14" >
                    <DataGrid.Columns>
                        <DataGridTextColumn Header="Medication Name" Width="170" Binding="{Binding MedicationName}"></DataGridTextColumn>
                        <DataGridTextColumn Header="Dosage" Width="80" Binding="{Binding Dosage}"></DataGridTextColumn>
                        <DataGridTextColumn Header="Scheduled Time" Width="180" Binding="{Binding Frequency}"></DataGridTextColumn>
                       
                       
                    </DataGrid.Columns>
                </DataGrid>
            </GroupBox>

            <!--Adherance Summary Section-->
            <GroupBox Header="Adherence Summary" Margin="10,0,10,0" VerticalAlignment="Center" FontFamily="Verdana" FontSize="16" FontWeight="Bold" Height="104">
                <StackPanel>
                    <ProgressBar Value="{Binding AdherancePercentage}" Maximum="100" Height="20"></ProgressBar>
                    <TextBlock Text="{Binding AdheranceText}"></TextBlock>
                </StackPanel>
            </GroupBox>

            <!--Notifications Section-->
            <GroupBox Header="Reminders and Notifications" VerticalAlignment="Top" Height="108" Margin="0,266,0,0" FontSize="16" FontFamily="Verdana" FontWeight="Bold">
                <ListBox x:Name="lstReminders" ItemsSource="{Binding Reminders}">
                    <ListBox.ItemTemplate>
                        <DataTemplate>
                            <TextBlock Text="{Binding Message}"/>
                        </DataTemplate>
                    </ListBox.ItemTemplate>
                </ListBox>
            </GroupBox>
        </Grid>

    </DockPanel>
</Window>


DashboardWindow.xaml.cs
************

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

namespace MATProject.Pages
{
    /// <summary>
    /// Interaction logic for DashboardWindow.xaml
    /// </summary>
    public partial class DashboardWindow : Window
    {
        public DashboardWindow()
        {
            InitializeComponent();
            this.DataContext = ViewModelConfig.dashboardViewModel;

        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            e.Cancel = true;
            this.Hide();
        }
    }
}

IDashBoardRepo
********

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MATProject.Entities;

namespace MATProject.Repo
{
    public interface IDashBoardRepo
    {
        ObservableCollection<Medication> ReadAll();
        // ObservableCollection<Medication> ReadTodayMedications();
    }
}

DashBoardRepo.cs
**************
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Text;
using System.Threading.Tasks;
using MATProject.Entities;
using MATProject.Repo;

namespace MATProject.Orm
{
    public class DashBoardRepo : IDashBoardRepo
    {

        private readonly MatDbEntities _context;
        private static DashBoardRepo _instance;


        public DashBoardRepo()
        {
            _context = new MatDbEntities();
        }


        public static DashBoardRepo Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new DashBoardRepo();
                }
                return _instance;
            }
        }




        public ObservableCollection<Medication> ReadAll()
        {

            //  return new ObservableCollection<Medication>(_context.Medications.ToList());
            DateTime currentDate = DateTime.Now;
            var filteredItems = _context.Medications.Where(item => currentDate >= item.StartDate && currentDate <= item.EndDate).ToList();
            if (filteredItems.Any()) {

                foreach (var item in filteredItems) {

                    string frequencyLabel = ConvertFrequencyToLabel(item.Frequency);
                    item.Frequency = frequencyLabel;
                }

            }
            
            return new ObservableCollection<Medication>(filteredItems);

        }
        private static string ConvertFrequencyToLabel(string frequency)
        {
            string[] parts = frequency.Split('-');
            List<string> labels = new List<string>();

            if (parts.Length == 3)
            {
                if (parts[0] == "1") labels.Add("Morning");
                if (parts[1] == "1") labels.Add("Lunch");
                if (parts[2] == "1") labels.Add("Night");
            }

            return string.Join(", ", labels);
        }




    }
}

DashboardViewModel.cs
********
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Text;
using System.Threading.Tasks;
using MATProject.Entities;
using MATProject.Orm;
using MATProject.Repo;

namespace MATProject.ViewModels
{
    public class DashboardViewModel : INotifyPropertyChanged
    {
        private DashBoardRepo dashboardRepo;
        public event PropertyChangedEventHandler PropertyChanged;

        private void OnPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
        private ObservableCollection<Medication> _medications;



        public ObservableCollection<Medication> Medications
        {
            get
            {
                return _medications;
            }
            set
            {
                _medications = value;
                OnPropertyChanged(nameof(Medications));
            }
        }
        public DashboardViewModel() {
            dashboardRepo = new DashBoardRepo();
            LoadMedications();
        }
        public void LoadMedications()
        {
          Medications = dashboardRepo.ReadAll();

        
           
        }
    }
}

ViewModelConfig.cs
**********

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MATProject.ViewModels;

namespace MATProject
{
    public class ViewModelConfig
    {
        //View models
        public static UserViewModel userViewModel = null;
        public static AddMedicationViewModel addMedicationViewModel = null;
		public static MedicationViewModel medicationViewModel = null;
		public static MedicationScheduleViewModel medicationScheduleViewModel = null;
		public static DashboardViewModel dashboardViewModel = null;
        public static CheckInViewModel checkInViewModel = null;

        static ViewModelConfig()
		{
            userViewModel = new UserViewModel();
            addMedicationViewModel = new AddMedicationViewModel();
			medicationViewModel = new MedicationViewModel();
			medicationScheduleViewModel=new MedicationScheduleViewModel();
			dashboardViewModel=new DashboardViewModel();
            checkInViewModel=new CheckInViewModel();

        }
	}
}




