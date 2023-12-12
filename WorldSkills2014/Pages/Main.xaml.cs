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
    /// Логика взаимодействия для Main.xaml
    /// </summary>
    public partial class Main : Page
    {
        Employee user;
        public Main(Employee conUser)
        {
            InitializeComponent();
            user = conUser;
            TextHello.Text = "Hello " + user.Name + "!";
            List<ChatMessage> allMess = new List<ChatMessage>();
            foreach (ChatMessage ch in App.DB.ChatMessage)
            {
                if (allMess.FirstOrDefault(x => x.Charroom_Id == ch.Charroom_Id) != null){
                    ChatMessage mess = allMess.FirstOrDefault(x => x.Charroom_Id == ch.Charroom_Id);
                    if (mess.Date < ch.Date)
                    {
                        allMess.Add(ch);
                        allMess.Remove(mess);
                    }
                }
                else
                {
                    allMess.Add(ch);
                }
            }

            DGChats.ItemsSource = allMess.Where(x => App.DB.ChatroomMembers.FirstOrDefault(
                s => s.Chatroom_Id == x.Charroom_Id && s.Employee_Id == user.Id) != null).OrderByDescending(x => x.Date);
        }

        private void User_Click(object sender, RoutedEventArgs e)
        {
            if (DGChats.SelectedItem is ChatMessage depart)
            {
                ChatroomMembers depar = App.DB.ChatroomMembers.FirstOrDefault(x => x.Chatroom_Id == depart.Charroom_Id
                && x.Employee_Id == user.Id);
                NavigationService.Navigate(new Chat(depar));
            }
        }

        private void Employee_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Poisk(user, null));
        }

        private void CloseApp_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Opened());
        }

        private void Prof_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Register(App.user));
        }
    }
}
