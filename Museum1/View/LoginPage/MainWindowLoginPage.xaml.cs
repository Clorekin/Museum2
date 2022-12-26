using Museum1.Model;
using Museum1.View;
using Museum1.View.Administrator_Page;
using Museum1.View.EmployeePage;
using Museum1.View.UserPage;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace Museum1.View.LoginPage
{
    /// <summary>
    /// Логика взаимодействия для MainWindowLoginPage.xaml
    /// </summary>
    public partial class MainWindowLoginPage : Page
    {
        public MainWindowLoginPage()
        {
            InitializeComponent();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            FrameNavigate.CoreFrame.Navigate(new MainTxtPage());
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            try
            {
                Users usermodel = FrameNavigate.db.Users.FirstOrDefault(u =>
                u.Login == Tb_Login.Text && u.Password == Reg_Txb.Password);

                if (usermodel == null)
                {
                    MessageBox.Show("Ошибка данных",
                        "Системное сообщение",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
                }
                else
                {
                    switch (usermodel.ID_Role)
                    {
                        case 1:
                            FrameNavigate.CoreFrame.Navigate(new MainAdministratorPage());
                            break;
                        case 2:
                            FrameNavigate.CoreFrame.Navigate(new MainEmployeePage());
                            break;
                        case 0:
                            FrameNavigate.CoreFrame.Navigate(new MainUserPage());
                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(),
                    "Системная ошибка",
                    MessageBoxButton.OK,
                    MessageBoxImage.Error);
            }
        }

        private void BtnUserReg_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.CoreFrame.Navigate(new MainWindowRegistrationPage());

        }
    }
}
