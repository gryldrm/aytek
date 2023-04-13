<%@ Page Title="" Language="C#" MasterPageFile="~/mp.Master" AutoEventWireup="true" CodeBehind="Ihtiyaclar.aspx.cs" Inherits="aytek.Ihtiyaclar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container-md">
        <div class="col align-self-center">
            <fieldset class="border p-2">
                <legend class="float-none w-auto p-2">İhtiyaç İşlemleri</legend>


               
             
           
                <table class="w-100">
                    <tr>
                        <td class="auto-style1" style="vertical-align: top">


               
             
           
                <table >
                    <tr>
                        <td>Tc</td>
                        <td>
                            <asp:TextBox class="form-control" placeholder="TC" required="" ID="txt_tc" runat="server" OnTextChanged="txt_tc_TextChanged" AutoPostBack="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Adı-Soyadı</td>
                        <td>
                            <asp:TextBox class="form-control" placeholder="" required="" ID="txt_adsad" runat="server" OnTextChanged="txt_tc_TextChanged" AutoPostBack="True" Enabled="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>İhtiyaç Kategori</td>
                        <td>
                            <asp:DropDownList class="form-control" placeholder="" required="" ID="dd_ihkat" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dd_ihkat_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:DropDownList class="form-control" placeholder="" required="" ID="dd_ihaltk" runat="server">
                            </asp:DropDownList>
&nbsp;</td>
                    </tr>
                    <tr>
                        <td>Beden/Adet</td>
                        <td>
                            <asp:TextBox class="form-control" placeholder="Beden" required="" ID="txt_beden" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="lbl_id" runat="server" Text="lbl_id" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Button class="btn btn-lg btn-primary" ID="btn_kaydet" runat="server" Text="Kaydet" OnClick="Button1_Click" />
                            <asp:Button class="btn btn-lg btn-primary" ID="btn_gncl" runat="server" Text="Güncelle" OnClick="btn_gncl_Click" Visible="False" />
                        </td>
                    </tr>
                </table>


               
             
           
                        </td>
                        <td style="vertical-align: top">
                            <asp:GridView ID="GridView1" class="table table-striped" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="İd" DataSourceID="SqlDataSource1" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                    <asp:BoundField DataField="İd" HeaderText="İd" InsertVisible="False" ReadOnly="True" SortExpression="İd" />
                                    <asp:BoundField DataField="TC" HeaderText="TC" SortExpression="TC" />
                                    <asp:BoundField DataField="Kategori" HeaderText="Kategori" SortExpression="Kategori" />
                                    <asp:BoundField DataField="İhtiyaç" HeaderText="İhtiyaç" SortExpression="İhtiyaç" />
                                    <asp:BoundField DataField="Beden" HeaderText="Beden" SortExpression="Beden" />
                                    <asp:BoundField DataField="Tarih" HeaderText="Tarih" SortExpression="Tarih" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_depremzedeCs %>" DeleteCommand="DELETE FROM [tbl_ihtiyac] WHERE [id] = @id" InsertCommand="INSERT INTO [tbl_ihtiyac] ([d_tc], [i_kat], [i_ad], [i_beden], [i_tar]) VALUES (@d_tc, @i_kat, @i_ad, @i_beden, @i_tar)" SelectCommand="SELECT id AS İd, d_tc AS TC, i_kat AS Kategori, i_ad AS İhtiyaç, i_beden AS Beden, i_tar AS Tarih FROM tbl_ihtiyac" UpdateCommand="UPDATE [tbl_ihtiyac] SET [d_tc] = @d_tc, [i_kat] = @i_kat, [i_ad] = @i_ad, [i_beden] = @i_beden, [i_tar] = @i_tar WHERE [id] = @id">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="d_tc" Type="Int64" />
                                    <asp:Parameter Name="i_kat" Type="String" />
                                    <asp:Parameter Name="i_ad" Type="String" />
                                    <asp:Parameter Name="i_beden" Type="String" />
                                    <asp:Parameter DbType="Date" Name="i_tar" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="d_tc" Type="Int64" />
                                    <asp:Parameter Name="i_kat" Type="String" />
                                    <asp:Parameter Name="i_ad" Type="String" />
                                    <asp:Parameter Name="i_beden" Type="String" />
                                    <asp:Parameter DbType="Date" Name="i_tar" />
                                    <asp:Parameter Name="id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>


               
             
           
                <br />

            </fieldset>
        </div>
    </div>
</asp:Content>
