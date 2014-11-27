using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Diagnostics;

namespace BakeryMonitor_MVC
{
    public partial class frmMain : Form, IView,IModelObserver
    {
        IController controller;
        bool listening = false;
        bool logging = false;
        public event ViewHandler<IView> listen;
        public event ViewHandler<IView> stoplistening;
        public event ViewHandler2<IView> writelogs;
        UDPListener m;

        public void setController(IController ctrlr)
        {
            controller = ctrlr;
        }
        public frmMain(IModel model)
        {
            InitializeComponent();
            m = (UDPListener)model;
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            this.objectListView1.SetObjects(m.Logs);
            
        }
        public void newlog(IModel model,ModelEventArgs e)
        {
            //this is where the newlogs are added.
            Debug.WriteLine("blahblah");
            this.objectListView1.AddObject(e.newlog);
        }

        private void btnListen_Click(object sender, EventArgs e)
        {
            if (listening)
            {
                btnListen.Text = "Listen";
                stoplistening.Invoke(this,new ViewEventArgs(0));
                listening = false;
                slbListenStatus.Text = "UDP Listener Disabled";
            }
            else
            {
                btnListen.Text = "Stop Listening";
                listen.Invoke(this, new ViewEventArgs(1));
                slbListenStatus.Text = String.Format("UDP Listener running on port {0}", Properties.Settings.Default.Port);
                listening = true;
            }
        }

        private void btnEnableLogging_Click(object sender, EventArgs e)
        {
            if (logging)
            {
                btnEnableLogging.Text = "Start Logging";
                writelogs.Invoke(this, new ViewEventArgs2(false));
                logging = false;
            }
            else
            {
                btnEnableLogging.Text = "Stop Logging";
                writelogs.Invoke(this, new ViewEventArgs2(true));
                logging = true;

            }
        }
        
    }
}
