using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace CounterProject
{
    public class CounterViewMode : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged(string propName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propName));
        }
        private Counter _newCounter = null;
        public Counter NewCounter
        {
            get => _newCounter;
            set { _newCounter = value; OnPropertyChanged(nameof(NewCounter)); }
        }

     

        public ICommand PlusCommand { get; }
        public ICommand MinusCommand { get; }

        public CounterViewMode()
        {
            this.NewCounter = new Counter { Number = 0 };
         

            PlusCommand = new RelayCommand(Plus);
            MinusCommand = new RelayCommand(Minus);


        }
       

        public void Plus()
        {
            NewCounter.Number++;
            OnPropertyChanged(nameof(NewCounter));
        }

        public void Minus()
        {
            NewCounter.Number--;
            OnPropertyChanged(nameof(NewCounter));
        }
    }
}