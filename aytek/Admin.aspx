<%@ Page Title="" Language="C#" MasterPageFile="~/mp.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="aytek.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container-md">
        <div class="col align-self-center">
            
                <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">

        <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
            <HeaderTemplate>
                Kullanıcı Tanımlama İşlemleri
            </HeaderTemplate>
            <ContentTemplate>
                <br />
                <table class="w-100">
                    <tr>
                        <td style="vertical-align: top; text-align: right;">
                            <table>
                                <tr>
                                    <td>Kullanıcı Adı</td>
                                    <td>
                                        <asp:TextBox ID="txt_ad" class="form-control" required="" placeholder="Kullanıcı Adı" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Kullanıcı Şifre</td>
                                    <td>
                                        <asp:TextBox ID="txt_sif" class="form-control" required="" placeholder="Şifre" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Kullanıcı Rol</td>
                                    <td>
                                        <asp:DropDownList ID="dd_user" class="form-control" placeholder="" runat="server">
                                            <asp:ListItem>Admin</asp:ListItem>
                                            <asp:ListItem>Kullanıcı</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" class="btn btn-lg btn-primary" OnClick="Button1_Click1" Text="Kaydet" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </td>
                        <td style="vertical-align: top">
                            <asp:GridView ID="GridView1" class="table table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="k_ad" HeaderText="k_ad" SortExpression="k_ad" />
                                    <asp:BoundField DataField="k_sifre" HeaderText="k_sifre" SortExpression="k_sifre" />
                                    <asp:BoundField DataField="k_rol" HeaderText="k_rol" SortExpression="k_rol" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_depremzedeCs %>" DeleteCommand="DELETE FROM [tbl_users] WHERE [id] = @id" InsertCommand="INSERT INTO [tbl_users] ([k_ad], [k_sifre], [k_rol]) VALUES (@k_ad, @k_sifre, @k_rol)" SelectCommand="SELECT * FROM [tbl_users]" UpdateCommand="UPDATE [tbl_users] SET [k_ad] = @k_ad, [k_sifre] = @k_sifre, [k_rol] = @k_rol WHERE [id] = @id">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="k_ad" Type="String" />
                                    <asp:Parameter Name="k_sifre" Type="String" />
                                    <asp:Parameter Name="k_rol" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="k_ad" Type="String" />
                                    <asp:Parameter Name="k_sifre" Type="String" />
                                    <asp:Parameter Name="k_rol" Type="String" />
                                    <asp:Parameter Name="id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
            <HeaderTemplate>
                İhityaç Kategori Tanımlama
            </HeaderTemplate>
            <ContentTemplate>
                <table  >
                    <tr>
                        <td style="vertical-align: top">Kategori Adı</td>
                        <td class="auto-style1" style="vertical-align: top">
                            <asp:TextBox ID="txt_kat" class="form-control" placeholder="Kategori Adı" required="" runat="server"></asp:TextBox>
                            <br />
                            <asp:Button ID="Button2" class="btn btn-lg btn-primary" runat="server" OnClick="Button2_Click" Text="Kaydet" />
                        </td>
                        <td>
                            <asp:GridView ID="GridView2" class="table table-striped" runat="server" AllowPaging="True"  AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource3" Width="100%">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="i_kategori" HeaderText="i_kategori" SortExpression="i_kategori" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db_depremzedeCs %>" DeleteCommand="DELETE FROM [tbl_ihtiyackat] WHERE [id] = @id" InsertCommand="INSERT INTO [tbl_ihtiyackat] ([i_kategori]) VALUES (@i_kategori)" SelectCommand="SELECT * FROM [tbl_ihtiyackat]" UpdateCommand="UPDATE [tbl_ihtiyackat] SET [i_kategori] = @i_kategori WHERE [id] = @id">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="i_kategori" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="i_kategori" Type="String" />
                                    <asp:Parameter Name="id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style1">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
                <table>
                    <tr>
                        <td style="vertical-align: top">Kategori Adı<br />
                            <br />
                            Alt Kategori</td>
                        <td class="auto-style2" style="vertical-align: top">
                            <asp:DropDownList ID="dd_katt" runat="server" class="form-control" DataSourceID="SqlDataSource2" DataTextField="i_kategori" DataValueField="id">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db_depremzedeCs %>" SelectCommand="SELECT id, i_kategori FROM tbl_ihtiyackat"></asp:SqlDataSource>
                            <br />
                            <asp:TextBox ID="txt_altk" class="form-control" placeholder="Adı" required="" runat="server"></asp:TextBox>
                            <br />
                            <asp:Button ID="Button3" class="btn btn-lg btn-primary" runat="server" OnClick="Button3_Click" Text="Kaydet" />
                        </td>
                        <td>
                            <asp:GridView ID="GridView3" class="table table-striped" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource4" Width="100%">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="kat" HeaderText="kat" SortExpression="kat" />
                                    <asp:BoundField DataField="altkat" HeaderText="altkat" SortExpression="altkat" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:db_depremzedeCs %>" DeleteCommand="DELETE FROM [tbl_ihtiyacaltk] WHERE [id] = @id" InsertCommand="INSERT INTO [tbl_ihtiyacaltk] ([kat], [altkat]) VALUES (@kat, @altkat)" SelectCommand="SELECT * FROM [tbl_ihtiyacaltk]" UpdateCommand="UPDATE [tbl_ihtiyacaltk] SET [kat] = @kat, [altkat] = @altkat WHERE [id] = @id">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="kat" Type="Int32" />
                                    <asp:Parameter Name="altkat" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="kat" Type="Int32" />
                                    <asp:Parameter Name="altkat" Type="String" />
                                    <asp:Parameter Name="id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

                    <ajaxToolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="TabPanel3">
                        <HeaderTemplate>
                            Konut Tip Tanımlama
                        </HeaderTemplate>
                        <ContentTemplate>
                            <table class="w-100">
                                <tr>
                                    <td>Konut Tip:<asp:TextBox ID="txtknttip" runat="server"></asp:TextBox>
                                        <br />
                                        Konut No:<asp:TextBox ID="txtkntno" runat="server"></asp:TextBox>
                                        <br />
                                        Konut Kontenjan:<asp:TextBox ID="txtkntkon" runat="server"></asp:TextBox>
                                        <br />
                                        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Kaydet" />
                                    </td>
                                    <td>
                                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource5">
                                            <Columns>
                                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                                <asp:BoundField DataField="k_tip" HeaderText="k_tip" SortExpression="k_tip" />
                                                <asp:BoundField DataField="k_ad" HeaderText="k_ad" SortExpression="k_ad" />
                                                <asp:BoundField DataField="k_kon" HeaderText="k_kon" SortExpression="k_kon" />
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:db_depremzedeCs %>" DeleteCommand="DELETE FROM [tbl_koncad] WHERE [id] = @id" InsertCommand="INSERT INTO [tbl_koncad] ([k_tip], [k_ad], [k_kon]) VALUES (@k_tip, @k_ad, @k_kon)" SelectCommand="SELECT * FROM [tbl_koncad]" UpdateCommand="UPDATE [tbl_koncad] SET [k_tip] = @k_tip, [k_ad] = @k_ad, [k_kon] = @k_kon WHERE [id] = @id">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="k_tip" Type="String" />
                                    <asp:Parameter Name="k_ad" Type="String" />
                                    <asp:Parameter Name="k_kon" Type="Int32" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="k_tip" Type="String" />
                                    <asp:Parameter Name="k_ad" Type="String" />
                                    <asp:Parameter Name="k_kon" Type="Int32" />
                                    <asp:Parameter Name="id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </ajaxToolkit:TabPanel>

    </ajaxToolkit:TabContainer>
                </div>
        </div>
    


</asp:Content>
