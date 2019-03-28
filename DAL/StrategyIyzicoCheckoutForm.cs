using Iyzipay;
using Iyzipay.Model;
using Iyzipay.Request;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class StrategyIyzicoCheckoutForm 
    {
        public string buyerId {get; set;}
        public string buyerName { get; set; }
        public string buyerSurname { get; set; }
        public string buyerGSMNumber { get; set; }
        public string buyerEmail { get; set; }
        public string buyerIdentityNumber { get; set; }
        public string buyerIp { get; set; }
        public string buyerCity { get; set; }
        public string buyerZipCode { get; set; }
        public string buyerAddress { get; set; }
        public string buyerBasketId { get; set; }
        public string buyerBasketName { get; set; }
        public string buyerBasketCategory { get; set; }
        public string buyerBasketPrice { get; set; }
        public string price { get; set; }
        public string paidPrice { get; set; }
        public string conversationId { get; set; }
        public List<BasketItem> basketItems { get; set; }
        public string callbackUrl { get; set; }

        public CheckoutFormInitialize initializeCheckoutBuilder()
        {
            CreateCheckoutFormInitializeRequest request = new CreateCheckoutFormInitializeRequest();
            request.Locale = Locale.TR.ToString();
            request.ConversationId = conversationId;
            request.Price = price;
            request.PaidPrice = paidPrice;
            request.Currency = Currency.TRY.ToString();
            request.BasketId = buyerBasketId;
            request.PaymentGroup = PaymentGroup.PRODUCT.ToString();
            request.CallbackUrl = callbackUrl;
            //"https://www.kralilan.com/yeni-magaza-odeme/"

            List<int> enabledInstallments = new List<int>();
            enabledInstallments.Add(2);
            enabledInstallments.Add(3);
            enabledInstallments.Add(6);
            enabledInstallments.Add(9);
            request.EnabledInstallments = enabledInstallments;

            Buyer buyer = new Buyer();
            buyer.Id = buyerId;
            buyer.Name = buyerName;
            buyer.Surname = buyerSurname;
            buyer.GsmNumber = buyerGSMNumber;
            buyer.Email = buyerEmail;
            buyer.IdentityNumber = buyerIdentityNumber;
            buyer.RegistrationAddress = buyerAddress;
            buyer.Ip = buyerIp;
            buyer.City = buyerCity;
            buyer.Country = "Turkey";
            buyer.ZipCode = buyerZipCode;
            request.Buyer = buyer;

            Address billingAddress = new Address();
            billingAddress.ContactName = buyerName;
            billingAddress.City = buyerCity;
            billingAddress.Country = "Turkey";
            billingAddress.Description = buyerAddress;
            billingAddress.ZipCode = buyerZipCode;
            request.BillingAddress = billingAddress;

            List<BasketItem> basketItems = new List<BasketItem>();
            BasketItem firstBasketItem = new BasketItem();
            firstBasketItem.Id = buyerBasketId;
            firstBasketItem.Name = buyerBasketName;
            firstBasketItem.Category1 = buyerBasketCategory;
            firstBasketItem.ItemType = BasketItemType.VIRTUAL.ToString();
            firstBasketItem.Price = buyerBasketPrice;
            basketItems.Add(firstBasketItem);
            request.BasketItems = basketItems; 

            Options options = new Options();
            options.ApiKey = "wyBxkxcGMxMdemTzA26k7reEBxyfuS6A";
            options.SecretKey = "jUqowI6O3zEQVNm2ZIo6H5nU5QKUWzxn";
            options.BaseUrl = "https://api.iyzipay.com";

            CheckoutFormInitialize checkoutFormInitialize = CheckoutFormInitialize.Create(request, options);

            return checkoutFormInitialize;
        }


        public CheckoutFormInitialize initializeCheckoutBuilderForm()
        {
            CreateCheckoutFormInitializeRequest request = new CreateCheckoutFormInitializeRequest();
            request.Locale = Locale.TR.ToString();
            request.ConversationId = conversationId;
            request.Price = price;
            request.PaidPrice = paidPrice;
            request.Currency = Currency.TRY.ToString();
            request.BasketId = buyerBasketId;
            request.PaymentGroup = PaymentGroup.PRODUCT.ToString();
            request.CallbackUrl = "https://www.kralilan.com/odeme-formu/";

            List<int> enabledInstallments = new List<int>();
            enabledInstallments.Add(2);
            enabledInstallments.Add(3);
            enabledInstallments.Add(6);
            enabledInstallments.Add(9);
            request.EnabledInstallments = enabledInstallments;

            Buyer buyer = new Buyer();
            buyer.Id = buyerId;
            buyer.Name = buyerName;
            buyer.Surname = buyerSurname;
            buyer.GsmNumber = buyerGSMNumber;
            buyer.Email = buyerEmail;
            buyer.IdentityNumber = buyerIdentityNumber;
            buyer.RegistrationAddress = buyerAddress;
            buyer.Ip = buyerIp;
            buyer.City = buyerCity;
            buyer.Country = "Turkey";
            buyer.ZipCode = buyerZipCode;
            request.Buyer = buyer;

            Address billingAddress = new Address();
            billingAddress.ContactName = buyerName;
            billingAddress.City = buyerCity;
            billingAddress.Country = "Turkey";
            billingAddress.Description = buyerAddress;
            billingAddress.ZipCode = buyerZipCode;
            request.BillingAddress = billingAddress;

            request.BasketItems = basketItems;

            Options options = new Options();
            options.ApiKey = "wyBxkxcGMxMdemTzA26k7reEBxyfuS6A";
            options.SecretKey = "jUqowI6O3zEQVNm2ZIo6H5nU5QKUWzxn";
            options.BaseUrl = "https://api.iyzipay.com";

            CheckoutFormInitialize checkoutFormInitialize = CheckoutFormInitialize.Create(request, options);

            return checkoutFormInitialize;
        }

    }
}
