using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BakeryMonitor_MVC
{
    public delegate void ViewHandler<IView>(IView sender,ViewEventArgs e);
    public delegate void ViewHandler2<IView>(IView sender,ViewEventArgs2 e);

    public class ViewEventArgs : EventArgs
    {
        public BakeryLog newlog;
        public ViewEventArgs(object o)
        {

        }
    }
    public class ViewEventArgs2 : EventArgs
    {
        public bool writelogs;
        public ViewEventArgs2(bool value)
        {
            writelogs=value;
        }
    }
    public interface IView
    {
        event ViewHandler<IView> listen;
        event ViewHandler<IView> stoplistening;
        event ViewHandler2<IView> writelogs;
        
        void setController(IController cont);
    }
}
