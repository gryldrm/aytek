<%@ Page Title="" Language="C#" MasterPageFile="~/mp.Master" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="aytek.Anasayfa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
           
                     
            <div class="container">
  <div class="row">
 

    <div class="col-4">Kayıtlı Depremzede Sayısı:<asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2">
        <ItemTemplate>
            <strong><asp:Label ID="Column1Label" runat="server" Font-Size="Larger" Text='<%# Eval("Column1") %>' />
            </strong>
        </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db_depremzedeCs %>" SelectCommand="SELECT count ([d_tc])
     
  FROM [db_depremzede].[dbo].[tbl_dzede]"></asp:SqlDataSource>
      </div>
    <div class="col-4">
           <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource3">
               <ItemTemplate>
                   Çadır/Konteyner Sayısı:
                   <asp:Label ID="Çadır_Konteyner_SayısıLabel" runat="server" Font-Bold="True" Font-Size="Larger" Text='<%# Eval("[Çadır/Konteyner Sayısı]") %>' />
                   
                   Yatak Sayısı:
                   <asp:Label ID="Yatak_SayısıLabel" runat="server" Font-Bold="True" Font-Size="Larger" Text='<%# Eval("[Yatak Sayısı]") %>' />
               
               </ItemTemplate>
           </asp:DataList>
           <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db_depremzedeCs %>" SelectCommand="SELECT count ([k_tip]) as [Çadır/Konteyner Sayısı], sum([k_kon]) as [Yatak Sayısı]
  FROM [db_depremzede].[dbo].[tbl_koncad]"></asp:SqlDataSource>
      </div>
    <div class="col-4"><asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource4">
        <ItemTemplate>
            Boş Yatak Sayısı:
            <asp:Label ID="Boş_Yatak_SayısıLabel" runat="server" Font-Bold="True" Font-Size="Larger" Text='<%# Eval("[Boş Yatak Sayısı]") %>' />
            <br />
            <br />
        </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:db_depremzedeCs %>" SelectCommand="SELECT        (SELECT        SUM(k_kon) AS [Yatak Sayısı]
                          FROM            tbl_koncad) -
                             (SELECT        COUNT(d_tc) AS Expr1
                               FROM            tbl_dzede) AS [Boş Yatak Sayısı]
FROM            tbl_dzede AS tbl_dzede_1"></asp:SqlDataSource>
      </div>
    <div class="col-4">
        Kayıtlı Son 20 Depremzzede<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_depremzedeCs %>" SelectCommand="SELECT top 20 * FROM [View_Dzede]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="İd" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="İd" HeaderText="İd" ReadOnly="True" SortExpression="İd" />
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
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
      </div>
  </div>
</div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
