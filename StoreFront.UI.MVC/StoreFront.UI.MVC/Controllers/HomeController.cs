using StoreFront.UI.MVC.Models; //used to connect w/ ContactViewModel
using System.Net; // using for NetWorkCredential
using System.Net.Mail; //MailMessage
using System.Web.Mvc;

namespace StoreFront.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            //ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpPost]
        public ActionResult Contact(ContactViewModel cvm)
        {
            //This is where we process what the user put in and process the content
            //Basic steps for sending an email in .NET

            //1 create a string for the email body -- REMEMBER this is a string so you can format it however you want!
            string body = $"Message received from MVC2 Secured. From {cvm.Name} - Subject: {cvm.Subject} <b />Message: {cvm.Message}";

            //2 create the MailMessage object and customize
            MailMessage msg = new MailMessage("admin@amandaallen.net", "amandaallen0227@gmail.com", "Message from you contact form", body);

            //This is how you CC someone!
            //msg.CC.Add("ewhittaker@centriq.com");
            //msg.CC.Add("jrutherford@centriq.com");
            msg.IsBodyHtml = true;

            //3 create the  SmtpClient object --> supply mail server, username, and password
            SmtpClient client = new SmtpClient("mail.amandaallen.net");
            client.Credentials = new NetworkCredential("admin@amandaallen.net", "Cambridge35!");
            client.Port = 8889; //b/c I use Xfinity l o l

            //4 Attempt to send the email
            try
            {
                //this is where the actually client is connecting to the database
                client.Send(msg);
                return View("EmailConfirmation", cvm);
            }
            catch (System.Exception)
            {
                ViewBag.ErrorMessage = "Something went wrong. Try again or contact an administrator.";
                return View(cvm);
            }



        }


    }
}
