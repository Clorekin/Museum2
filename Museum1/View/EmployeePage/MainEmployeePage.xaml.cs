using System;
using Museum1.View.LoginPage;
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


namespace Museum1.View.EmployeePage
{
    /// <summary>
    /// Логика взаимодействия для MainEmployeePage.xaml
    /// </summary>
    public partial class MainEmployeePage : Page
    {
        public MainEmployeePage()
        {
            InitializeComponent();

            DataGridInfo.ItemsSource = FrameNavigate.db.Exhibit.ToList();
        }

        private void Btn_Back_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.CoreFrame.Navigate(new MainWindowLoginPage());
        }

        private void Btn_Update_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.db.SaveChanges();

            MessageBox.Show("Данные успешно сохранены",
                "Системное оповещение",
                MessageBoxButton.OK,
                MessageBoxImage.Information);
        }
    }
}
