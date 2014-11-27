using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Sockets;
using System.Windows.Forms;
using System.Threading;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;

namespace BakeryMonitor_MVC
{
    public delegate void ModelHandler<IModel>(IModel sender, ModelEventArgs e);

    public class ModelEventArgs : EventArgs
    {
        public BakeryLog newlog;
        public ModelEventArgs(BakeryLog l)
        { 
            newlog = l; 
        }

    }
    public interface IModel
    {
        void attach(IModelObserver imo);
        void listen();
        void stoplistening();
        void setwritelogs(bool value);

    }
    public interface IModelObserver
    {
        void newlog(IModel model, ModelEventArgs e);
    }

    public class UDPListener : IModel
    {
        public List<BakeryLog> Logs;
        public List<BakeryLog> NewLogs;
        public bool listening = false;
        private BackgroundWorker bgwUDPListener;
        public event ModelHandler<IModel> newlog;
        UdpClient listener;
        bool writelogs;
        public UDPListener()
        {
            Logs = new List<BakeryLog>();
            writelogs = false;
            bgwUDPListener = new BackgroundWorker();
            bgwUDPListener.DoWork += new DoWorkEventHandler(bgwUDPListener_DoWork);
            bgwUDPListener.ProgressChanged += new ProgressChangedEventHandler(bgwUDPListener_ProgressChanged);
            bgwUDPListener.WorkerReportsProgress = true;
            bgwUDPListener.WorkerSupportsCancellation = true;
        }
            
        public void listen()
        {
            //need to check here if we are already listening
            bgwUDPListener.RunWorkerAsync();

        }
        public void stoplistening()
        {
            listening = false;
            listener.Close();
        }
        public void setwritelogs(bool value)
        {
            writelogs = value;
        }
        public void attach(IModelObserver imo)
        {
            newlog += new ModelHandler<IModel>(imo.newlog);
        }

        private void bgwUDPListener_DoWork(object sender, DoWorkEventArgs e)
        {


            try
            {
                int listenPort = Properties.Settings.Default.Port;
                listening = true;
                listener= new UdpClient(listenPort);
                //listener.Client.ReceiveTimeout = 1000;
                IPEndPoint groupEP = new IPEndPoint(IPAddress.Any, listenPort);
                string received_data;
                byte[] receive_byte_array;
                try
                {
                    while (listening)
                    {
                        receive_byte_array = listener.Receive(ref groupEP);
                        received_data = Encoding.ASCII.GetString(receive_byte_array, 0, receive_byte_array.Length);
                        BakeryLog newlog = AddLog(received_data);
                        bgwUDPListener.ReportProgress(0, newlog);
                    }
                    listener.Close();
                }
                catch (Exception ex)
                {
                    Debug.WriteLine(ex.Message);
                }
                
            }
            catch(Exception ex)
            {
                Debug.WriteLine(ex.Message);
                Debug.WriteLine(ex.InnerException.Message);
            }
        }
        private void bgwUDPListener_ProgressChanged(object sender,ProgressChangedEventArgs e)
        {
            BakeryLog nl = (BakeryLog)e.UserState;
            this.newlog.Invoke(this, new ModelEventArgs(nl));
        }
        private BakeryLog AddLog(string logdata)
        {
            string[] s = logdata.Split('|');
            BakeryLog newlog = new BakeryLog(s[0], Convert.ToDateTime(s[1]), s[2], s[3]);
            Logs.Add(newlog);
            if (writelogs)
                WriteLogs(newlog);
            return newlog;
        }
        private void WriteLogs(BakeryLog newlog)
        {
            try 
            {
                string basefolder=Properties.Settings.Default.LogFolder;
                string logfolder = String.Format("{0}\\{1}",basefolder,newlog.shortname);
                string logfile=string.Format("{0}\\{1}.log",logfolder,newlog.id);

                if (!Directory.Exists(basefolder))
                    Directory.CreateDirectory(basefolder);

                if (!Directory.Exists(logfolder))
                    Directory.CreateDirectory(logfolder);

                using (StreamWriter sw=new StreamWriter(logfile,true))
                {
                       sw.WriteLine(String.Format("{0},{1}",newlog.datetime,newlog.log));
                }

            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
                Debug.WriteLine(ex.InnerException.Message);
            }
        }
    }
}
