using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.PaymentHelper
{
    public interface IPayment
    {
        void Pay();

        object CheckoutForm();
    }
}
