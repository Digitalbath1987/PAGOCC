<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Exportar_Registros.aspx.cs" Inherits="pagoCC2._1.Mantenedor.Exportar_Registros" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/Modal.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
<div class="panel panel-primary">
<div class="panel-heading">
    
<div class="container">
<h4>
<p>    
<strong>Exportar Registros a excel</strong> 
<button type="button" class="btn btn-success btn-xs" id="BtnExportExcel" runat="server" onserverclick="BtnExportExcel_ServerClick">
<span class="glyphicon glyphicon-save-file"></span> Descargar
</button>
</p>
</h4> 
</div>   
    


</div>
<div class="panel-body">
<div class="text-center">

<div class="text-center">
<div class="scrolling-table-container">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">


<asp:GridView ID="GVExpExcel" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Exportar_Excel" ForeColor="#333333" GridLines="None" Height="100%" HorizontalAlign="Center" Width="100%" CssClass="auto-style39">
<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
<asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
<asp:BoundField DataField="Numero_PCC" HeaderText="Numero_PCC" SortExpression="Numero_PCC" />
<asp:BoundField DataField="Fecha_Ingreso_Sistema" HeaderText="Fecha_Ingreso_Sistema" SortExpression="Fecha_Ingreso_Sistema" />
<asp:BoundField DataField="Fecha_Recibido_Finanzas" HeaderText="Fecha_Recibido_Finanzas" SortExpression="Fecha_Recibido_Finanzas" />
<asp:BoundField DataField="Fecha_Aprobado_Finanzas" HeaderText="Fecha_Aprobado_Finanzas" SortExpression="Fecha_Aprobado_Finanzas" />
<asp:BoundField DataField="Fecha_Recibido_Auditor" HeaderText="Fecha_Recibido_Auditor" SortExpression="Fecha_Recibido_Auditor" />
<asp:BoundField DataField="Fecha_Aprobado_Auditor" HeaderText="Fecha_Aprobado_Auditor" SortExpression="Fecha_Aprobado_Auditor" />
<asp:BoundField DataField="Fecha_Finalizacion" HeaderText="Fecha_Finalizacion" SortExpression="Fecha_Finalizacion" />
<asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa" />
<asp:BoundField DataField="NFolio" HeaderText="NFolio" SortExpression="NFolio" />
<asp:BoundField DataField="NCheque" HeaderText="NCheque" SortExpression="NCheque" />
<asp:BoundField DataField="NBoleta" HeaderText="NBoleta" SortExpression="NBoleta" />
<asp:BoundField DataField="facturas" HeaderText="facturas" ReadOnly="True" SortExpression="facturas" />
<asp:BoundField DataField="operaciones" HeaderText="operaciones" ReadOnly="True" SortExpression="operaciones" />
<asp:BoundField DataField="tcambio" HeaderText="tcambio" SortExpression="tcambio" />
<asp:BoundField DataField="monto" HeaderText="monto" ReadOnly="True" SortExpression="monto" />
<asp:BoundField DataField="empcheque" HeaderText="empcheque" SortExpression="empcheque" />
<asp:BoundField DataField="echequea" HeaderText="echequea" SortExpression="echequea" />
<asp:BoundField DataField="cargo" HeaderText="cargo" SortExpression="cargo" />
<asp:BoundField DataField="eboletaa" HeaderText="eboletaa" SortExpression="eboletaa" />
<asp:BoundField DataField="comexcontact" HeaderText="comexcontact" SortExpression="comexcontact" />
<asp:BoundField DataField="retiracheque" HeaderText="retiracheque" SortExpression="retiracheque" />
<asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
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
<asp:SqlDataSource ID="Exportar_Excel" runat="server" ConnectionString="<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>" SelectCommand="SELECT SolicitudPcc.Usuario,SolicitudPcc.ncontador as Numero_PCC,SolicitudPcc.Fecha_Ingreso as Fecha_Ingreso_Sistema,SolicitudPcc.FRecepFina as Fecha_Recibido_Finanzas,SolicitudPcc.FAprobFinanz as Fecha_Aprobado_Finanzas,SolicitudPcc.FRecepAudi as Fecha_Recibido_Auditor ,SolicitudPcc.FAprobAuditor as Fecha_Aprobado_Auditor,SolicitudPcc.FFinalizaFin as Fecha_Finalizacion,SolicitudPcc.Empresa,SolicitudPcc.NFolio,SolicitudPcc.NCheque,SolicitudPcc.NBoleta,stuff((select ', '+ DetallePago.N_Factura from DetallePago where DetallePago.id_SolPCC = SolicitudPcc.ncontador for XML path('')),1,1,'') facturas,stuff((select ', '+ DetallePago.N_Operacion from DetallePago where DetallePago.id_SolPCC = SolicitudPcc.ncontador for XML path('')),1,1,'') operaciones,SolicitudPcc.tcambio,(SELECT sum (DetallePago.MontoCC) FROM DetallePago where DetallePago.id_SolPCC = SolicitudPcc.ncontador ) as monto  ,SolicitudPcc.empcheque,SolicitudPcc.echequea,SolicitudPcc.cargo,SolicitudPcc.eboletaa,SolicitudPcc.comexcontact,SolicitudPcc.retiracheque,SolicitudPcc.Estado FROM SolicitudPcc   order by ncontador desc">
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
<div class="row">

<div class="alert alert-success alert-dismissible" visible="false" id="lblmensaje_ok" runat="server" >
<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
<strong>Registro Actualizado!</strong>Se desacargo el achivo en formato XLS.
</div>



</div>
</div>






</asp:Content>
