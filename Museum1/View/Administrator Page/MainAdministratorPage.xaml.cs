using System;
using Museum1.View;
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
using Museum1.View.LoginPage;

namespace Museum1.View.Administrator_Page
{
    /// <summary>
    /// Логика взаимодействия для MainAdministratorPage.xaml
    /// </summary>
    public partial class MainAdministratorPage : Page
    {
        public MainAdministratorPage()
        {
            InitializeComponent();

            DataGridExh.ItemsSource = FrameNavigate.db.Exhibit.ToList();
        }

        private void Btn_Excursion_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.CoreFrame.Navigate(new ExcursionAdministratorPage());
        }

        private void Btn_Clients_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.CoreFrame.Navigate(new ClientAdministratorPage());
        }

        private void Btn_Employee_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.CoreFrame.Navigate(new EmployeeAdministratorPage());
        }

        private void Btn_Exit_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.CoreFrame.Navigate(new MainWindowLoginPage());
        }

        private void Btn_Save_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.db.SaveChanges();

            MessageBox.Show("Данные успешно сохранены",
            "Системное оповещение",
            MessageBoxButton.OK,
            MessageBoxImage.Information);
        }
    }
}
