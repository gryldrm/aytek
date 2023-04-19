<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rapor.aspx.cs" Inherits="aytek.Rapor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="id" DataSourceID="SqlDataSource1" Width="100%">
            <ItemTemplate>
                id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                <br />
                d_tc:
                <asp:Label ID="d_tcLabel" runat="server" Text='<%# Eval("d_tc") %>' />
                <br />
                d_ad:
                <asp:Label ID="d_adLabel" runat="server" Text='<%# Eval("d_ad") %>' />
                <br />
                d_sad:
                <asp:Label ID="d_sadLabel" runat="server" Text='<%# Eval("d_sad") %>' />
                <br />
                d_dtar:
                <asp:Label ID="d_dtarLabel" runat="server" Text='<%# Eval("d_dtar") %>' />
                <br />
                d_gyer:
                <asp:Label ID="d_gyerLabel" runat="server" Text='<%# Eval("d_gyer") %>' />
                <br />
                d_tel:
                <asp:Label ID="d_telLabel" runat="server" Text='<%# Eval("d_tel") %>' />
                <br />
                d_cins:
                <asp:Label ID="d_cinsLabel" runat="server" Text='<%# Eval("d_cins") %>' />
                <br />
                d_kont:
                <asp:Label ID="d_kontLabel" runat="server" Text='<%# Eval("d_kont") %>' />
                <br />
                d_kontno:
                <asp:Label ID="d_kontnoLabel" runat="server" Text='<%# Eval("d_kontno") %>' />
                <br />
                d_ktar:
                <asp:Label ID="d_ktarLabel" runat="server" Text='<%# Eval("d_ktar") %>' />
                <br />
                d_kuser:
                <asp:Label ID="d_kuserLabel" runat="server" Text='<%# Eval("d_kuser") %>' />
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_depremzedeCs %>" SelectCommand="SELECT * FROM [tbl_dzede]"></asp:SqlDataSource>
    </form>
</body>
</html>
