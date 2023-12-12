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
    /// Логика взаимодействия для Opened.xaml
    /// </summary>
    public partial class Opened : Page
    {
        public Opened()
        {
            InitializeComponent();
            if (App.userSave != null)
            {
                User.Text = App.userSave.Username;
                Password.Text = App.userSave.Password;
                Rememb.IsChecked = true;
            }
        }

        private void Ok_Click(object sender, RoutedEventArgs e)
        {
            Employee user = App.DB.Employee.FirstOrDefault(x => x.Username == User.Text 
                                                            && x.Password == Password.Text);
            if (user != null)
            {
                if (Rememb.IsChecked == true)
                {
                    App.userSave = user;
                }
                else
                {
                    App.userSave = null;
                }
                App.user = user;
                NavigationService.Navigate(new Main(user));
            }
            else
            {
                MessageBox.Show("Неверный логин или пароль!");
            }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            Environment.Exit(0);
        }

        private void Reg_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Register(null));
        }
    }
}
