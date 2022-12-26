using Museum1.Model;
using Museum1.View;
using Museum1.View.Administrator_Page;
using Museum1.View.EmployeePage;
using Museum1.View.LoginPage;
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

namespace Museum1
{
    /// <summary>
    /// Логика взаимодействия для MainTxtPage.xaml
    /// </summary>
    public partial class MainTxtPage : Page
    {
        public MainTxtPage()
        {
            InitializeComponent();

            FrameNavigate.db = new MuseumEntities();
        }

        private void Btn_Auth_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.CoreFrame.Navigate(new MainWindowLoginPage());
        }

        private void Btn_Reg_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.CoreFrame.Navigate(new MainWindowRegistrationPage());
        }

        private void Btn_Exit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }
    }
}
