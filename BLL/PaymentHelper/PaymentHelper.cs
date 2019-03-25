using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.PaymentHelper
{
    public class PaymentHelper
    {

        private IPayment payment;

        public void PaymentTo(IPayment payment)
        {
            this.payment = payment;
        }

        public object CheckoutForm()
        {
            return this.payment.CheckoutForm();
        }

    }
}
