using System;
using Museum1.Model;
using Museum1.View;
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

namespace Museum1.View.UserPage
{
    /// <summary>
    /// Логика взаимодействия для MainUserPage.xaml
    /// </summary>
    public partial class MainUserPage : Page
    {
        public MainUserPage()
        {
            InitializeComponent();

            foreach (var guide in FrameNavigate.db.Guide.ToList())
            {
                Cmb_Guide.Items.Add(guide.Full_Name); //selectedindex.text
            }

            foreach (var excursion in FrameNavigate.db.Excursion.ToList())
            {
                Cmb_Excursion.Items.Add(excursion.Name);
            }
        }

        private void Btn_Close_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.CoreFrame.Navigate(new MainWindowLoginPage());
        }

        private async void Btn_RegEx_Click(object sender, RoutedEventArgs e)
        {
            FrameNavigate.db.Registration.Add(new Registration
            {
                FullName = Tb_Login.Text,
                Date = DatePick.SelectedDate,
                Excursion = Cmb_Excursion.SelectedItem.ToString(),
                Guide = Cmb_Guide.SelectedItem.ToString(),

            });

            await FrameNavigate.db.SaveChangesAsync();
            MessageBox.Show("Регистрация успешна",
            "Системное сообщение",
            MessageBoxButton.OK,
            MessageBoxImage.Information);

            FrameNavigate.CoreFrame.Navigate(new MainWindowLoginPage());
        }
    }
}
