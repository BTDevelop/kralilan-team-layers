<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="hesap-dondur.ascx.cs" Inherits="PL.profil.hesap_dondur" %>
<style>
    .btn-success {
        background-color: #16A085;
        color: #FFFFFF;
        width: 235px;
        font-weight: bold;
    }

    .form-control {
        border-radius: 6px;
    }

        .form-control:focus {
            border-color: #16A085;
            border: 2px solid #16A085;
        }
</style>
<div class="col-sm-9 page-content">
    <div class="inner-box">
        <h2 class="title-2"><i class="icon-cancel-circled "></i>Hesabımı Dondur</h2>

        <p>
            Üyeliğinizi pasife almanıza üzüldük...<br />
            <br />

            Sizi kralilan.com ailesinin bir üyesi olarak görmeye devam etmek istediğimiz için görüşleriniz bizim için çok değerli. Üyeliğiniz ile ilgili yaşadığınız bir sorun veya sormak istedikleriniz varsa bize Destek Merkezi üzerinden ulaşabilirsiniz.
            <br />
            kralilan.com üyeliğinizi pasife alırsanız;
        </p>
        <ol>
            <li><i class="fa fa-minus-square"></i>&nbsp;Yayında olan ilanlarınızın tamamı yayından kalkacaktır,</li>
            <li><i class="fa fa-minus-square"></i>&nbsp;Doping kullandığınız ilanınız varsa ücret iadesi yapılamayacaktır,</li>
            <li><i class="fa fa-minus-square"></i>&nbsp;E-posta adresinizin yeni bir üyelikte kullanılamayacağını da üzülerek hatırlatmak isteriz.</li>
        </ol>
        <br />
        <asp:Button ID="Iptal" type="submit" CssClass="btn btn-success" runat="server" Text="Üyeliğimi Pasife Almak İstiyorum" OnClick="Iptal_Click" />
    </div>
    <!--/.inner-box-->
</div>
