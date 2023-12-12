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
using WorldSkills2014.AppWindow;
using WorldSkills2014.Models;

namespace WorldSkills2014.Pages
{
    /// <summary>
    /// Логика взаимодействия для Chat.xaml
    /// </summary>
    public partial class Chat : Page
    {
        ChatroomMembers chatroomMember;
        public Chat(ChatroomMembers chatroomMembers)
        {
            InitializeComponent();
            chatroomMember = chatroomMembers;
            Topic.Text = "Topic: " + chatroomMembers.Chatroom.Topic;
        }

        private void Send_Click(object sender, RoutedEventArgs e)
        {
            if (Text.Text != null)
            {
                ChatMessage mess = new ChatMessage();
                mess.Date = DateTime.Now;
                mess.Messange = Text.Text;
                mess.Charroom_Id = chatroomMember.Chatroom_Id;
                mess.Sender_Id = chatroomMember.Employee_Id;
                App.DB.ChatMessage.Add(mess);
                App.DB.SaveChanges();
                NavigationService.GoBack();
                NavigationService.Navigate(new Chat(chatroomMember));
            }
        }

        private void AddUSer_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Poisk(null, chatroomMember));
        }

        private void Change_Click(object sender, RoutedEventArgs e)
        {
            var window = new RedactTopic(chatroomMember);
            var result = window.ShowDialog();
            if (result == true)
            {
                NavigationService.GoBack();
                NavigationService.Navigate(new Chat(chatroomMember));
            }
        }

        private void Leave_Click(object sender, RoutedEventArgs e)
        {
            if (App.DB.ChatroomMembers.Where(x => x.Chatroom_Id == chatroomMember.Chatroom_Id).Count() <= 2)
            {
                ChatroomMembers chatmember2 = App.DB.ChatroomMembers.FirstOrDefault(x =>
                x.Chatroom_Id == chatroomMember.Chatroom_Id && x.Id != chatroomMember.Id);
                App.DB.ChatroomMembers.Remove(chatmember2);
            }
            App.DB.ChatroomMembers.Remove(chatroomMember);
            App.DB.SaveChanges();
            NavigationService.Navigate(new Main(App.user));
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            DGUser.ItemsSource = App.DB.Employee.Where(x => App.DB.ChatroomMembers.Where(s => s.Employee_Id == x.Id &&
            s.Chatroom_Id == chatroomMember.Chatroom_Id).Count() != 0).ToList();
            DGChat.ItemsSource = App.DB.ChatMessage.Where(x => x.Charroom_Id == chatroomMember.Chatroom_Id).ToList();
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Main(App.user));
        }
    }
}
