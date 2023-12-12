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
using WorldSkills2014.Models;

namespace WorldSkills2014.AppWindow
{
    /// <summary>
    /// Логика взаимодействия для RedactTopic.xaml
    /// </summary>
    public partial class RedactTopic : Window
    {
        ChatroomMembers chatMessage;
        public RedactTopic(ChatroomMembers Chat)
        {
            InitializeComponent();
            chatMessage = Chat;
            Topic.Text = Chat.Chatroom.Topic;
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            chatMessage.Chatroom.Topic = Topic.Text;
            App.DB.SaveChanges();
            DialogResult = true;
        }
    }
}
