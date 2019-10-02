<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="pagoCC2._1.Home1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

  
    <script>
      

    </script>
    <link href="Content/Modal.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
<div class="container">
<div class="panel panel-primary">
<div class="panel-heading"><h4><strong>Estadisticas de Resultados</strong> <i class="fas fa-chart-line"></i></h4> 

</div>
<div class="panel-body" >

<div class="row" >

<div class="col-sm-6">
        <div class="container">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">
    <asp:Chart ID="Chart1" runat="server" DataSourceID="PendientesChart" Width="500px" Height="500px" BackHatchStyle="DarkUpwardDiagonal">
        <Titles>
            <asp:Title Name="Mis Solicitudes" Text="Mis Solicitudes" Font="Microsoft Sans Serif; 12pt" />
        </Titles>
        <Series>
            <asp:Series Name="Series1" XValueMember="Estado" YValueMembers="cantidad" ChartType="Doughnut"></asp:Series>
</Series>
<Legends>
<asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default" LegendStyle="Row" />
</Legends>
<ChartAreas>
<asp:ChartArea Name="ChartArea1"></asp:ChartArea>
</ChartAreas>
</asp:Chart>
<asp:SqlDataSource runat="server" ID="PendientesChart" ConnectionString='<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>' SelectCommand="select Estado, COUNT(Estado) as cantidad From SolicitudPcc where Usuario =@Usuario and Estado!='2' group by Estado">
<SelectParameters>
<asp:SessionParameter SessionField="Usuario" DefaultValue="" Name="Usuario"></asp:SessionParameter>
</SelectParameters>
</asp:SqlDataSource>
</div> 
</div> 
</div> 
</div>
<div class="col-sm-6">
      <div class="container">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">
<asp:Chart ID="Chart2" runat="server" DataSourceID="CCpormes"  Width="500px" Height="500px">
<Titles>
<asp:Title Name="CC por mes" Text="Monto x Mes" Font="Microsoft Sans Serif; 12pt" />
</Titles>
<Series>
<asp:Series Name="Monto" XValueMember="Mes" YValueMembers="Monto"></asp:Series>
</Series>
<Legends>
<asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default" LegendStyle="Row" />
</Legends>
<ChartAreas>
<asp:ChartArea Name="ChartArea1"></asp:ChartArea>
</ChartAreas>
</asp:Chart>
<asp:SqlDataSource runat="server" ID="CCpormes" ConnectionString='<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>' SelectCommand="SELECT SUM(DetallePago.MontoCC) as Monto , FORMAT(SolicitudPcc.Fecha_Ingreso,'MM') as Mes FROM DetallePago , SolicitudPcc where SolicitudPcc.Usuario=@Usuario and  DetallePago.id_SolPCC = SolicitudPcc.ncontador group by FORMAT(SolicitudPcc.Fecha_Ingreso,'MM')">
<SelectParameters>
<asp:SessionParameter SessionField="Usuario" Name="Usuario"></asp:SessionParameter>
</SelectParameters>
</asp:SqlDataSource>
</div>
</div>
    </div>
        </div>
</div>
</div> 
</div> 
</div>
<div class="container">
<div class="panel panel-primary">
<div class="panel-heading"><h4><strong>Mensajes</strong> <i class="fas fa-comments"></i></h4></div>
<div class="panel-body" >
<div class="row" >
<div class="col-sm-12">
<div class="scrolling-table-container">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">
<asp:GridView ID="gvMensajes" runat="server" AutoGenerateColumns="False" DataKeyNames="Solicitud" DataSourceID="Mensajes" CellPadding="4" ForeColor="#333333" Height="100%" Width="100%" GridLines="None" ShowHeaderWhenEmpty="true" EmptyDataText="Sin Mensajes en los CC Solicitadas" OnSelectedIndexChanged="gvMensajes_SelectedIndexChanged">
<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
<Columns>
<asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa"></asp:BoundField>
<asp:BoundField DataField="Solicitud" HeaderText="N Solicitud CC" SortExpression="Solicitud"></asp:BoundField>
<asp:BoundField DataField="Usuario" HeaderText="Usuario Mensaje" SortExpression="Usuario"></asp:BoundField>
<asp:BoundField DataField="Fecha_Ingreso" HeaderText="Fecha Ingreso" ReadOnly="True" SortExpression="Fecha_Ingreso"></asp:BoundField>
<asp:BoundField DataField="Mensaje" HeaderText="Mensaje" SortExpression="Mensaje"></asp:BoundField>
<asp:CommandField ShowSelectButton="True" headerText="Detalle"   ControlStyle-CssClass="btn default btn-lg  purple" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-folder-open btn-lg'></i>">
<ControlStyle CssClass="btn default btn-xs purple"></ControlStyle>
</asp:CommandField>
</Columns>
<EditRowStyle BackColor="#999999"></EditRowStyle>
<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>
<PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>
<RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
<SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>
<SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>
<SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>
<SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
</asp:GridView>
<asp:SqlDataSource runat="server" ID="Mensajes" ConnectionString='<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>' SelectCommand="SELECT SolicitudPcc.Empresa,DetallePcc.NContsolpcc as Solicitud,DetallePcc.Usuario,FORMAT(DetallePcc.FechaingDet,'dd-MM-yyyy') as Fecha_Ingreso,DetallePcc.Detalle as Mensaje FROM DetallePcc , SolicitudPcc where SolicitudPcc.ncontador= DetallePcc.NContsolpcc and SolicitudPcc.Estado !='2' and SolicitudPcc.Usuario=@Usuario  order by NContsolpcc,FechaingDet Desc">
<SelectParameters>
<asp:SessionParameter SessionField="Usuario" Name="Usuario"></asp:SessionParameter>
</SelectParameters>
</asp:SqlDataSource>
</div> 
</div> 
</div>
</div> 
</div>    
</div>
</div> 
</div> 
</asp:Content>