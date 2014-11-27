using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BakeryMonitor_MVC
{
    public interface IController
    {
        
    }
    public class Controller:IController
    {
        IView view;
        public IModel model;

        public Controller(IView v, IModel m)
        {
            view = v;
            model = m;
            view.setController(this);
            model.attach((IModelObserver)view);
            view.listen += new ViewHandler<IView>(this.view_listen);
            view.stoplistening += new ViewHandler<IView>(this.view_stoplistening);
            view.writelogs += new ViewHandler2<IView>(this.view_writelogs);
        }
        public void view_listen(IView v, ViewEventArgs e)
        {
            model.listen();
        }
        public void view_stoplistening(IView v, ViewEventArgs e)
        {
            model.stoplistening();
        }
        public void view_writelogs(IView v, ViewEventArgs2 e)
        {
            model.setwritelogs(e.writelogs);
        }
    }
}
