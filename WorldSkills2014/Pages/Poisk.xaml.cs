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
    /// Логика взаимодействия для Poisk.xaml
    /// </summary>
    public partial class Poisk : Page
    {
        List<Department> departs;
        Employee user;
        ChatroomMembers chatroomMember;
        public Poisk(Employee comuser, ChatroomMembers chatroomMembers)
        {
            InitializeComponent();
            user = comuser;
            chatroomMember = chatroomMembers;
            if (user != null)
            {
                DGPerson.ItemsSource = App.DB.Employee.Where(x => x.Id != user.Id).ToList();
            }
            else
            {
                DGPerson.ItemsSource = App.DB.Employee.Where(x => App.DB.ChatroomMembers.Where(s => s.Chatroom_Id
                == chatroomMember.Chatroom_Id && s.Employee_Id == x.Id).Count() == 0).ToList();
            }
            
            DGDepart.ItemsSource = App.DB.Department.ToList();
            
            departs = new List<Department>();
            foreach (Department depart in App.DB.Department)
            {
                departs.Add(depart);
            }
        }

        private void StrokaPoist_SelectionChanged(object sender, RoutedEventArgs e)
        {
            Refresh();
        }

        private void Refresh()
        {
            if (user != null)
            {
                var filtered = App.DB.Employee.Where(x => x.Id != user.Id).ToList();
            
                var select = StrokaPoist.Text.ToLower();
                filtered = filtered.Where(s => departs.FirstOrDefault(x => x == s.Department) != null).ToList();

                if (string.IsNullOrWhiteSpace(select) == false)
                {
                    filtered = filtered.Where(s => s.FullName.ToLower().Contains(select)).ToList();
                }
                DGPerson.ItemsSource = filtered;
            }
            else
            {
                var filtered = App.DB.Employee.Where(x => App.DB.ChatroomMembers.Where(s => s.Chatroom_Id 
                == chatroomMember.Chatroom_Id && s.Employee_Id == x.Id).Count() == 0).ToList();

                var select = StrokaPoist.Text.ToLower();
                filtered = filtered.Where(s => departs.FirstOrDefault(x => x == s.Department) != null).ToList();

                if (string.IsNullOrWhiteSpace(select) == false)
                {
                    filtered = filtered.Where(s => s.FullName.ToLower().Contains(select)).ToList();
                }
                DGPerson.ItemsSource = filtered;
            }
        }

        private void GetUser_Click(object sender, RoutedEventArgs e)
        {
            if (DGPerson.SelectedItem is Employee depart)
            {
                if (user != null)
                {
                    Chatroom newroom = new Chatroom();
                    newroom.Topic = user.Name + " - " + depart.Name;

                    ChatroomMembers newChat = new ChatroomMembers();
                    ChatroomMembers newChat2 = new ChatroomMembers();
                    newChat.Employee = depart;
                    newChat2.Employee = user;
                    newChat.Chatroom = newroom;
                    newChat2.Chatroom = newroom;
                    App.DB.Chatroom.Add(newroom);
                    App.DB.ChatroomMembers.Add(newChat);
                    App.DB.ChatroomMembers.Add(newChat2);
                    App.DB.SaveChanges();
                    NavigationService.Navigate(new Chat(newChat2));
                }
                else
                {
                    ChatroomMembers newChat = new ChatroomMembers();
                    newChat.Employee = depart;
                    newChat.Chatroom = chatroomMember.Chatroom;
                    App.DB.ChatroomMembers.Add(newChat);
                    App.DB.SaveChanges();
                    NavigationService.Navigate(new Chat(chatroomMember));
                }
            }
        }

        private void ItUser_Unchecked(object sender, RoutedEventArgs e)
        {
            if (DGDepart.SelectedItem is Department depart)
            {
                departs.Remove(depart);
                Refresh();
            }
        }

        private void ItUser_Checked(object sender, RoutedEventArgs e)
        {
            if (DGDepart.SelectedItem is Department depart)
            {
                departs.Add(depart);
                Refresh();
            }
        }
    }
}
