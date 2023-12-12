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
using System.Windows.Navigation;
using System.Windows.Shapes;
using WorldSkills2014.Models;

namespace WorldSkills2014.Pages
{
    /// <summary>
    /// Логика взаимодействия для Register.xaml
    /// </summary>
    public partial class Register : Page
    {
        Employee user;
        public Register(Employee employee)
        {
            InitializeComponent();
            user = employee;
            if (user != null)
            {
                Open.Visibility = Visibility.Hidden;
                Rememb.Visibility = Visibility.Hidden;
                DataContext = user;
            }

            List<string> TextDepart = new List<string>();
            foreach (Department s in App.DB.Department.ToList())
            {
                TextDepart.Add(s.Name);
            }
            Departs.ItemsSource = TextDepart;
        }

        private void Open_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Opened());
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            if (user == null)
            {
                Environment.Exit(0);
            }
            else
            {
                NavigationService.GoBack();
            }
        }

        private void Ok_Click(object sender, RoutedEventArgs e)
        {
            Employee userr = App.DB.Employee.FirstOrDefault(x => x.Username == User.Text);
            if (User != null && Password != null && Name != null && Departs.SelectedItem != null)
            {
                if (user == null)
                {
                    if (userr == null)
                    {
                        Employee userNew = new Employee();
                        userNew.Username = User.Text;
                        userNew.Password = Password.Text;
                        userNew.Name = Name.Text;
                        userNew.Department_Id = App.DB.Department.FirstOrDefault(x => x.Name == Departs.Text).Id;
                        App.DB.Employee.Add(userNew);
                        App.DB.SaveChanges();

                        if (Rememb.IsChecked == true)
                        {
                            App.userSave = userNew;
                        }
                        else
                        {
                            App.userSave = null;
                        }
                        App.user = userNew;
                        NavigationService.Navigate(new Main(userNew));
                    }
                    else
                    {
                        MessageBox.Show("Данный пользователь существует!");
                    }
                }
                else
                {
                    user.Username = User.Text;
                    user.Password = Password.Text;
                    user.Name = Name.Text;
                    user.Department_Id = App.DB.Department.FirstOrDefault(x => x.Name == Departs.Text).Id;
                    App.DB.SaveChanges();
                    NavigationService.Navigate(new Main(user));
                }
            }
            else
            {
                MessageBox.Show("Не все поля заполнены!");
            }
        }
    }
}
