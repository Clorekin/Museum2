using Museum1.Model;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
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

namespace Museum1.View.LoginPage
{
    /// <summary>
    /// Логика взаимодействия для MainWindowRegistrationPage.xaml
    /// </summary>
    public partial class MainWindowRegistrationPage : Page
    {
        public MainWindowRegistrationPage()
        {
            InitializeComponent();

            FrameNavigate.CoreFrame.Navigate(new MainWindowLoginPage());
            FrameNavigate.db = new MuseumEntities();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.CoreFrame.Navigate(new MainTxtPage());
        }

        private async void BtnReg_Click(object sender, RoutedEventArgs e)
        {
            
            if(string.IsNullOrEmpty(Tb_Login.Text) ||
               string.IsNullOrEmpty(Reg_Txb.Password) ||
               string.IsNullOrEmpty(RepeatReg_Txb.Password))
            {
                MessageBox.Show("Все поля должны быть заполнены!",
                    "Системное сообщение",
                    MessageBoxButton.OK,
                    MessageBoxImage.Error);

            }
            else if (FrameNavigate.db.Users.Count(u => u.Login == Tb_Login.Text) > 0)
            {

                MessageBox.Show("Пользователь с таким именем уже зарегестрирован!",
                        "Системное сообщение",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);

            }
            else if (Reg_Txb.Password != RepeatReg_Txb.Password)
            {
                MessageBox.Show("Пароли не совпадают!",
                "Системное сообщение",
                MessageBoxButton.OK,
                MessageBoxImage.Error);
            }

            else
            {
                FrameNavigate.db.Users.Add(new Users
                {
                    Login = Tb_Login.Text,
                    Password = Reg_Txb.Password,
                });

                await FrameNavigate.db.SaveChangesAsync();
                MessageBox.Show("Пользователь зарегистрирован",
                "Системное сообщение",
                MessageBoxButton.OK,
                MessageBoxImage.Information);

                FrameNavigate.CoreFrame.Navigate(new MainWindowLoginPage());
            }
        }
    }
}
