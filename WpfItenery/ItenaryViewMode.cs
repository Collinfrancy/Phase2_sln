using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Windows;

namespace WpfItenery
{
    public delegate void DWidnowClose();
    public class IternaryViewModel : INotifyPropertyChanged
    {
        public DWidnowClose NewWindowClose;
        public DWidnowClose EditWindowClose;
        //
        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged(string propName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propName));
        }
        //        
        private Iternary _newIternary = null;
        public Iternary NewIternary
        {
            get => _newIternary;
            set { _newIternary = value; OnPropertyChanged(nameof(NewIternary)); }
        }
        //
        private Iternary _selectedIternary = null;
        public Iternary SelectedIternary
        {
            get => _selectedIternary;
            set { _selectedIternary = value; OnPropertyChanged(nameof(SelectedIternary)); }
        }
        //
        private ObservableCollection<Iternary> _iternaries = null;
        public ObservableCollection<Iternary> Iternaries
        {
            get => _iternaries;
            set { _iternaries = value; OnPropertyChanged(nameof(Iternaries)); }
        }
        //
        public ICommand CreateCommand { get; }
        public ICommand UpdateCommand { get; }
        public ICommand DeleteCommand { get; }
        //
        public IternaryViewModel()
        {
            this.NewIternary = new Iternary { Id = 0, Time = "01:00am", IternaryName = "z", About = "z", Price = 1 };
            this.Iternaries = new ObservableCollection<Iternary>
            {
                new Iternary{Id=1,Time="09:00am",IternaryName="a",About="a",Price=10},
                new Iternary{Id=2,Time="11:00am",IternaryName="b",About="b",Price=20}
            };
            CreateCommand = new RelayCommand(Create);
            UpdateCommand = new RelayCommand(Update);
            DeleteCommand = new RelayCommand(Delete);
        }
        public void Create()
        {
            int id = 1;
            if (Iternaries.Count > 0)
            {
                id = Iternaries[Iternaries.Count - 1].Id + 1;
            }
            Iternary newIternary = new Iternary
            {
                Id = id,
                Time = NewIternary.Time,
                IternaryName = NewIternary.IternaryName,
                About = NewIternary.About,
                Price = NewIternary.Price
            };
            var result = MessageBox.Show(messageBoxText: "Are you sure to create?",
                    caption: "Confirm",
                    button: MessageBoxButton.YesNo,
                    icon: MessageBoxImage.Question);
            if (result != MessageBoxResult.Yes)
            {
                return;
            }
            Iternaries.Add(newIternary);
            this.NewIternary = new Iternary { Id = 0, Time = "01:00am", IternaryName = "z", About = "z", Price = 1 };
            //this.NewIternary.Id = 0;
            //..
            //this.NewIternary = NewIternary;
            result = MessageBox.Show(messageBoxText: "Created Successfully",
                    caption: "Alert",
                    button: MessageBoxButton.OK,
                    icon: MessageBoxImage.Information);
            if (NewWindowClose != null)
            {
                NewWindowClose();
            }

        }
        public void Update()
        {
            if (this.SelectedIternary == null)
            {
                return;
            }
            this.SelectedIternary = this.SelectedIternary;
            var result = MessageBox.Show(messageBoxText: "Updated Successfully",
                    caption: "Alert",
                    button: MessageBoxButton.OK,
                    icon: MessageBoxImage.Information);
            if (EditWindowClose != null)
            {
                EditWindowClose();
            }
        }
        public void Delete()
        {
            if (this.SelectedIternary == null)
            {
                return;
            }
            this.Iternaries.Remove(this.SelectedIternary);
            this.SelectedIternary = null;
        }
    }   
}
