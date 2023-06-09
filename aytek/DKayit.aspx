﻿<%@ Page Title="" Language="C#" MasterPageFile="~/mp.Master" AutoEventWireup="true" CodeBehind="DKayit.aspx.cs" Inherits="aytek.DKayit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-md">
        <div class="col align-self-center">
            <fieldset class="border p-2">
                <legend class="float-none w-auto p-2">Depremzede Kayıt ve Sorgulama İşlemleri İşlemleri</legend>


&nbsp;<table class="w-100">
                    <tr>
                        <td style="vertical-align: top">


                            &nbsp;</td>
                        <td style="vertical-align: top">
                                <table class="auto-style1" __designer:mapid="106" >
                                    <tr __designer:mapid="107">
                                        <td __designer:mapid="108">Adı</td>
                                        <td __designer:mapid="109">
                                            <asp:TextBox class="form-control" placeholder="Adı" required="" ID="txt_ad" runat="server"></asp:TextBox>
                                        </td>
                                        <td __designer:mapid="10b">Geldiği İl</td>
                                        <td __designer:mapid="10c">
                                            <asp:DropDownList class="form-control" placeholder="" required="" ID="dd_gil" runat="server" AppendDataBoundItems="True">
                                            </asp:DropDownList>
                                        </td>
                                        <td __designer:mapid="10e">
                                            <asp:Button class="btn btn-lg btn-primary" ID="btnkaydet" runat="server" Text="Kaydet" OnClick="btnkaydet_Click" />
                                            <asp:Button class="btn btn-lg btn-primary" ID="btn_gun" runat="server" Text="Güncelle" Visible="False" OnClick="btn_gun_Click" />
                                            <asp:Button class="btn btn-lg btn-primary" ID="Button1" runat="server" OnClick="Button1_Click" Text="İhtiyaç Gir" />
                                            <asp:Button class="btn btn-lg btn-primary" ID="Button2" runat="server" OnClick="btn_yk_Click" Text="Yeni Kayıt" />
                                        </td>
                                    </tr>
                                    <tr __designer:mapid="112">
                                        <td __designer:mapid="113" class="auto-style1">Soyadı</td>
                                        <td __designer:mapid="114" class="auto-style1">
                                            <asp:TextBox class="form-control" placeholder="" required="" ID="txt_sad" runat="server"></asp:TextBox>
                                        </td>
                                        <td __designer:mapid="116" class="auto-style1">Telefon</td>
                                        <td __designer:mapid="117" class="auto-style1">
                                            <asp:TextBox class="form-control" placeholder="" required="" ID="txt_tel" runat="server">0</asp:TextBox>
                                        </td>
                                        <td __designer:mapid="119" class="auto-style1"></td>
                                    </tr>
                                    <tr __designer:mapid="11a">
                                        <td __designer:mapid="11b">TC</td>
                                        <td __designer:mapid="11c">
                                            <asp:TextBox class="form-control" placeholder="TC" required="" ID="txt_tc" runat="server"></asp:TextBox>
                                        </td>
                                        <td __designer:mapid="11e">Cinsiyet</td>
                                        <td __designer:mapid="11f">
                                            <asp:DropDownList class="form-control" placeholder="" required="" ID="dd_cinsiyet" runat="server" AppendDataBoundItems="True">
                                            </asp:DropDownList>
                                        </td>
                                        <td __designer:mapid="121">
                                            <asp:Label ID="lblid" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr __designer:mapid="123">
                                        <td __designer:mapid="124">Doğum Tarihi</td>
                                        <td __designer:mapid="125">
                                            <asp:TextBox class="form-control" placeholder="Doğum Taihi" required="" ID="dt_dtar" runat="server" TextMode="Date"></asp:TextBox>
                                        </td>
                                        <td __designer:mapid="127">Konteyner/Çadır</td>
                                        <td __designer:mapid="128">
                                            <asp:DropDownList class="form-control" placeholder="" required="" ID="dd_konteyner" runat="server" AutoPostBack="True" AppendDataBoundItems="True">
                                            </asp:DropDownList>
                                            <asp:DropDownList class="form-control" placeholder="" required="" ID="dd_kontno" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="k_ad" DataValueField="k_ad">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:db_depremzedeCs %>" SelectCommand="SELECT TOP (100) PERCENT k_tip, k_ad FROM tbl_koncad WHERE (k_tip = @kont) ORDER BY k_tip, k_ad">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="dd_konteyner" Name="kont" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td __designer:mapid="12e">&nbsp;</td>
                                    </tr>
                                    <tr __designer:mapid="123">
                                        <td __designer:mapid="124" colspan="5">
                            <asp:GridView  ID="GridView1" class="table table-striped" runat="server" data-bs-toggle="modal" data-bs-target="#staticBackdrop" AutoGenerateColumns="False" DataKeyNames="İd" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" AllowSorting="True"  >
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                    <asp:BoundField DataField="İd" HeaderText="İd" InsertVisible="False" ReadOnly="True" SortExpression="İd" />
                                    <asp:BoundField DataField="TC" HeaderText="TC" SortExpression="TC" />
                                    <asp:BoundField DataField="Adı" HeaderText="Adı" SortExpression="Adı" />
                                    <asp:BoundField DataField="Soyadı" HeaderText="Soyadı" SortExpression="Soyadı" />
                                    <asp:BoundField DataField="Cinsiyet" HeaderText="Cinsiyet" SortExpression="Cinsiyet" />
                                    <asp:BoundField DataField="İl" HeaderText="İl" SortExpression="İl" />
                                    <asp:BoundField DataField="Doğum Tarihi" HeaderText="Doğum Tarihi" SortExpression="Doğum Tarihi" />
                                    <asp:BoundField DataField="Telefon" HeaderText="Telefon" SortExpression="Telefon" />
                                    <asp:BoundField DataField="Kaldığı Yer" HeaderText="Kaldığı Yer" SortExpression="Kaldığı Yer" />
                                    <asp:BoundField DataField="No" HeaderText="No" SortExpression="No" />
                                    <asp:BoundField DataField="Kayıt Tarihi" HeaderText="Kayıt Tarihi" SortExpression="Kayıt Tarihi" />
                                    <asp:BoundField DataField="Personel" HeaderText="Personel" SortExpression="Personel" />
                                </Columns>
                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:db_depremzedeCs %>" SelectCommand="SELECT        dbo.tbl_dzede.id AS İd, dbo.tbl_dzede.d_tc AS TC, dbo.tbl_dzede.d_ad AS Adı, dbo.tbl_dzede.d_sad AS Soyadı, dbo.tbl_cinsiyet.d_cins AS Cinsiyet, dbo.tbl_iller.sehir_adi AS İl, dbo.tbl_dzede.d_dtar AS [Doğum Tarihi], 
                         dbo.tbl_dzede.d_tel AS Telefon, dbo.tbl_dzede.d_kont AS [Kaldığı Yer], dbo.tbl_dzede.d_kontno AS No, dbo.tbl_dzede.d_ktar AS [Kayıt Tarihi], dbo.tbl_dzede.d_kuser AS Personel
FROM            dbo.tbl_dzede LEFT OUTER JOIN
                         dbo.tbl_cinsiyet ON dbo.tbl_dzede.d_cins = dbo.tbl_cinsiyet.id LEFT OUTER JOIN
                         dbo.tbl_iller ON dbo.tbl_dzede.d_gyer = dbo.tbl_iller.id" DeleteCommand="DELETE FROM [tbl_dzede] WHERE [id] = @id" InsertCommand="INSERT INTO [tbl_dzede] ([d_tc], [d_ad], [d_sad], [d_dtar], [d_gyer], [d_tel], [d_cins], [d_kont], [d_kontno], [d_ktar], [d_kuser]) VALUES (@d_tc, @d_ad, @d_sad, @d_dtar, @d_gyer, @d_tel, @d_cins, @d_kont, @d_kontno, @d_ktar, @d_kuser)" UpdateCommand="UPDATE [tbl_dzede] SET [d_tc] = @d_tc, [d_ad] = @d_ad, [d_sad] = @d_sad, [d_dtar] = @d_dtar, [d_gyer] = @d_gyer, [d_tel] = @d_tel, [d_cins] = @d_cins, [d_kont] = @d_kont, [d_kontno] = @d_kontno, [d_ktar] = @d_ktar, [d_kuser] = @d_kuser WHERE [id] = @id">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="d_tc" Type="Int64" />
                                    <asp:Parameter Name="d_ad" Type="String" />
                                    <asp:Parameter Name="d_sad" Type="String" />
                                    <asp:Parameter DbType="Date" Name="d_dtar" />
                                    <asp:Parameter Name="d_gyer" Type="Int32" />
                                    <asp:Parameter Name="d_tel" Type="Int64" />
                                    <asp:Parameter Name="d_cins" Type="Int32" />
                                    <asp:Parameter Name="d_kont" Type="String" />
                                    <asp:Parameter Name="d_kontno" Type="Int32" />
                                    <asp:Parameter Name="d_ktar" Type="DateTime" />
                                    <asp:Parameter Name="d_kuser" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="d_tc" Type="Int64" />
                                    <asp:Parameter Name="d_ad" Type="String" />
                                    <asp:Parameter Name="d_sad" Type="String" />
                                    <asp:Parameter DbType="Date" Name="d_dtar" />
                                    <asp:Parameter Name="d_gyer" Type="Int32" />
                                    <asp:Parameter Name="d_tel" Type="Int64" />
                                    <asp:Parameter Name="d_cins" Type="Int32" />
                                    <asp:Parameter Name="d_kont" Type="String" />
                                    <asp:Parameter Name="d_kontno" Type="Int32" />
                                    <asp:Parameter Name="d_ktar" Type="DateTime" />
                                    <asp:Parameter Name="d_kuser" Type="String" />
                                    <asp:Parameter Name="id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                <br />


               
                <br />

            </fieldset>
        </div>
    </div>

</asp:Content>
