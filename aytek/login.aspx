<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="aytek.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8"/>
    <link rel="shortcut icon" href="img/icons/icon-48x48.png" />
   
    <title>AYDIN-BTH</title>
    <link href="../css/app.css" rel="stylesheet"/>
   
    <style type="text/css">
        .auto-style1 {
            width: 640px;
            height: 640px;
        }
    </style>
   
</head>
<body>
    <form id="form1" runat="server">

        <main class="d-flex w-100">
            <div class="container d-flex flex-column">
                <div class="row vh-100">
                    <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
                        <div class="d-table-cell align-middle">

                            <div class="text-center mt-4">
                                <h1 class="h2">DEPREMZEDE TAKİP GİRİŞ EKRANI</h1>
                                <p class="lead">
                                    &nbsp;</p>
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <div class="m-sm-4">
                                        <div class="text-center">
                                            <img src="img/aytek.jpg" alt="Charles Hall" class="img-fluid rounded-circle" width="132" height="132" />&nbsp;&nbsp;
                                            </div>
                                        <div class="mb-3">
                                            <label class="form-label">Kullanıcı Adı</label>


                                            <asp:TextBox class="form-control form-control-lg" ID="txtAd" runat="server"></asp:TextBox>
                                            &nbsp;<label class="form-label">Şifre</label>
                                            <asp:TextBox ID="txtSifre" runat="server" class="form-control form-control-lg" type="password"></asp:TextBox>
                                            &nbsp;<small>
	 

                                            </small>
                                        </div>
                                        <div>
                                        </div>
                                        <div class="text-center mt-3">

                                          
                                            <br />
                                            <asp:Button ID="btnGiris" runat="server" OnClick="btnGiris_Click" Text="Giriş" class="btn btn-lg btn-primary" />
                                            <br />
                                            <asp:Label ID="lblDurum" runat="server"></asp:Label>
                                            <br />

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </main>

        <script src="../js/app.js"></script>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_depremzedeCs %>" SelectCommand="SELECT * FROM [tbl_users]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>

    </form>
</body>
</html>

