<%@ Page Title="" Language="C#" MasterPageFile="~/mp.Master" AutoEventWireup="true" CodeBehind="Sorgulamalar.aspx.cs" Inherits="aytek.Sorgulamalar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-md">
        <div class="col align-self-center">
            <fieldset class="border p-2">
                <legend class="float-none w-auto p-2">Depremzede Kayıt ve Sorgulama İşlemleri İşlemleri</legend>


&nbsp;<table class="w-100">
                    <tr>
                        <td style="vertical-align: top">


               <table >
                    <tr>
                        <td>Adı</td>
                        <td>
                            <asp:TextBox class="form-control" placeholder="Adı" required="" ID="txt_ad0" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Soyadı</td>
                        <td>
                            <asp:TextBox class="form-control" placeholder="Soyadı" required="" ID="txt_sad0" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>TC</td>
                        <td>
                            <asp:TextBox class="form-control" placeholder="TC" required="" ID="txt_tc0" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Doğum Tarihi</td>
                        <td>
                            <asp:TextBox class="form-control" placeholder="" required="" ID="dt_dtar0" runat="server" TextMode="Date"></asp:TextBox>
                            <asp:TextBox class="form-control" placeholder="" required="" ID="dt_dtar1" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Geldiği İl</td>
                        <td>
                            <asp:DropDownList class="form-control" placeholder="" required="Seçiniz" ID="dd_gil0" runat="server" AppendDataBoundItems="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Telefon</td>
                        <td>
                            <asp:TextBox class="form-control" placeholder="Telefon" required="" ID="txt_tel0" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Cinsiyet</td>
                        <td>
                            <asp:DropDownList class="form-control" placeholder="" required="" ID="dd_cinsiyet0" runat="server" AppendDataBoundItems="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Konteyner/Çadır</td>
                        <td>
                            <asp:DropDownList class="form-control" placeholder="" required="" ID="dd_konteyner0" runat="server" AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="dd_konteyner0_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:DropDownList class="form-control" placeholder="" required="" ID="dd_kontno0" runat="server" AutoPostBack="True">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;<asp:Button class="btn btn-lg btn-primary" ID="btnsor" runat="server" Text="Sorgula" OnClick="btnsor_Click" Width="106px" />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                </table>
                        </td>
                        <td style="vertical-align: top">
                            <asp:GridView  ID="GridView1" class="table table-striped" runat="server" data-bs-toggle="modal" data-bs-target="#staticBackdrop" AutoGenerateColumns="False" DataKeyNames="İd" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" AllowSorting="True"  >
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" SelectText="İhtiyaç Gir" />
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
