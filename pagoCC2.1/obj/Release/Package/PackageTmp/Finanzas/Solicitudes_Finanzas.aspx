<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Solicitudes_Finanzas.aspx.cs" Inherits="pagoCC2._1.Finanzas.Solicitudes_Finanzas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../Content/Modal.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container">
<div class="panel panel-primary">
<div class="panel-heading"><h4><strong>Finanzas</strong></h4></div>
<div class="panel-body">
<div class="text-center">

<div class="panel panel-default">
<div class="panel-heading"><strong>Solicitudes de Pagos Pendientes Revision de pago</strong></div>
<div class="panel-body">
<div class="scrolling-table-container">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">

<asp:GridView ID="gvsolpendientes" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ncontador" EmptyDataText="Sin Registros" ShowHeaderWhenEmpty="True" DataSourceID="solpend" ForeColor="#333333" GridLines="None" Height="100%" Width="100%" OnSelectedIndexChanged="gvsolpendientes_SelectedIndexChanged">
<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
<asp:BoundField DataField="id_Solicitud" HeaderText="id_Solicitud" InsertVisible="False" Visible="False"  ReadOnly="True" SortExpression="id_Solicitud" />
<asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
<asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa" />
<asp:BoundField DataField="Fecha_Ingreso" HeaderText="Fecha Ingreso" SortExpression="Fecha_Ingreso" />
<asp:BoundField DataField="facturas" HeaderText="Facturas" SortExpression="facturas" />
<asp:BoundField DataField="operaciones" HeaderText="Operaciones" SortExpression="operaciones" />
<asp:BoundField DataField="tcambio" HeaderText="T.Cambio USD" SortExpression="tcambio" />
<asp:BoundField DataField="monto" HeaderText="Monto USD" SortExpression="monto" />
<asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
<asp:BoundField DataField="ncontador" HeaderText="Nº Solicitud" SortExpression="ncontador" />
<asp:BoundField DataField="FRecepAudi" HeaderText="Recibido Auditor" SortExpression="FRecepAudi" />
<asp:BoundField DataField="FRecepFina" HeaderText="Recibido Finanzas" SortExpression="FRecepFina" />
<asp:CommandField ShowSelectButton="True" headerText="Detalle"   ControlStyle-CssClass="btn default btn-lg  purple" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-folder-open btn-lg'></i>">
<ControlStyle CssClass="btn default btn-xs purple"></ControlStyle>
</asp:CommandField>
</Columns>
<EditRowStyle BackColor="#999999" />
<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
<SortedAscendingCellStyle BackColor="#E9E7E2" />
<SortedAscendingHeaderStyle BackColor="#506C8C" />
<SortedDescendingCellStyle BackColor="#FFFDF8" />
<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>
<asp:SqlDataSource ID="solpend" runat="server" ConnectionString="<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>" SelectCommand="SELECT SolicitudPcc.id_Solicitud,SolicitudPcc.FRecepAudi,SolicitudPcc.FRecepFina,SolicitudPcc.Empresa,SolicitudPcc.Usuario,FORMAT(SolicitudPcc.Fecha_Ingreso,'dd-MM-yyyy') as Fecha_Ingreso,SolicitudPcc.tcambio,SolicitudPcc.Estado,SolicitudPcc.ncontador,SolicitudPcc.empcheque,SolicitudPcc.echequea,SolicitudPcc.cargo,SolicitudPcc.eboletaa,SolicitudPcc.comexcontact,SolicitudPcc.retiracheque,stuff((select ', '+ DetallePago.N_Factura from DetallePago where DetallePago.id_SolPCC = SolicitudPcc.ncontador for XML path('')),1,1,'') facturas,stuff((select ', '+ DetallePago.N_Operacion from DetallePago where DetallePago.id_SolPCC = SolicitudPcc.ncontador for XML path('')),1,1,'') operaciones,(SELECT sum (DetallePago.MontoCC) FROM DetallePago where DetallePago.id_SolPCC = SolicitudPcc.ncontador ) as monto  FROM SolicitudPcc where SolicitudPcc.Estado = 'Solicitado'  order by id_Solicitud desc "></asp:SqlDataSource>
</div>
</div>
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading"><strong>Solicitudes de Pagos Pendientes de Emitir Cheque</strong></div>
<div class="panel-body">
<div class="scrolling-table-container">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">
<asp:GridView ID="gvsolchequespend" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ncontador" DataSourceID="solchequepend" ForeColor="#333333" EmptyDataText="Sin Registros" ShowHeaderWhenEmpty="True" Height="100%" Width="100%" OnSelectedIndexChanged="gvsolchequespend_SelectedIndexChanged" GridLines="None">
<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
<asp:BoundField DataField="id_Solicitud" HeaderText="id_Solicitud" InsertVisible="False" Visible="False"  ReadOnly="True" SortExpression="id_Solicitud" />
<asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
<asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa" />
<asp:BoundField DataField="Fecha_Ingreso" HeaderText="Fecha Ingreso" SortExpression="Fecha_Ingreso" />
<asp:BoundField DataField="facturas" HeaderText="Facturas" SortExpression="facturas" />
<asp:BoundField DataField="operaciones" HeaderText="Operaciones" SortExpression="operaciones" />
<asp:BoundField DataField="tcambio" HeaderText="T.Cambio USD" SortExpression="tcambio" />
<asp:BoundField DataField="monto" HeaderText="Monto USD" SortExpression="monto" />
<asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
<asp:BoundField DataField="NFolio" HeaderText="Nº Folio" SortExpression="NFolio" />
<asp:BoundField DataField="ncontador" HeaderText="Nº Solicitud" SortExpression="ncontador" />
<asp:BoundField DataField="FRecepAudi" HeaderText="Recibido Auditor" SortExpression="FRecepAudi" />
<asp:BoundField DataField="FRecepFina" HeaderText="Recibido Finanzas" SortExpression="FRecepFina" />
<asp:CommandField ShowSelectButton="True" headerText="Detalle"   ControlStyle-CssClass="btn default btn-lg  purple" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-folder-open btn-lg'></i>">
<ControlStyle CssClass="btn default btn-xs purple"></ControlStyle>
</asp:CommandField>  
</Columns>
<EditRowStyle BackColor="#999999" />
<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
<SortedAscendingCellStyle BackColor="#E9E7E2" />
<SortedAscendingHeaderStyle BackColor="#506C8C" />
<SortedDescendingCellStyle BackColor="#FFFDF8" />
<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>
<asp:SqlDataSource ID="solchequepend" runat="server" ConnectionString="<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>" SelectCommand="SELECT SolicitudPcc.id_Solicitud,FORMAT(SolicitudPcc.FRecepAudi,'dd-MM-yyyy') as FRecepAudi,FORMAT(SolicitudPcc.FRecepFina,'dd-MM-yyyy') as FRecepFina,SolicitudPcc.Empresa,SolicitudPcc.Usuario,FORMAT(SolicitudPcc.Fecha_Ingreso,'dd-MM-yyyy') as Fecha_Ingreso,SolicitudPcc.tcambio,SolicitudPcc.Estado,SolicitudPcc.NFolio,SolicitudPcc.ncontador,SolicitudPcc.empcheque,SolicitudPcc.echequea,SolicitudPcc.cargo,SolicitudPcc.eboletaa,SolicitudPcc.comexcontact,SolicitudPcc.retiracheque,stuff((select ', '+ DetallePago.N_Factura from DetallePago where DetallePago.id_SolPCC = SolicitudPcc.ncontador for XML path('')),1,1,'') facturas,stuff((select ', '+ DetallePago.N_Operacion from DetallePago where DetallePago.id_SolPCC = SolicitudPcc.ncontador for XML path('')),1,1,'') operaciones,(SELECT sum (DetallePago.MontoCC) FROM DetallePago where DetallePago.id_SolPCC = SolicitudPcc.ncontador ) as monto  FROM SolicitudPcc where SolicitudPcc.Estado = 'Pendiente Finanzas' order by id_Solicitud desc"></asp:SqlDataSource>
</div>
</div>
</div>
</div>
</div>


</div>
</div>
</div>
</div>

</asp:Content>
