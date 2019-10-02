<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Detalle_Solicitud.aspx.cs" Inherits="pagoCC2._1.PagoCC.Detalle_Solicitud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
<div class="panel panel-primary">
<div class="panel-heading"><h4><strong><i class="fas fa-file-invoice-dollar"></i> Detalle Solicitud Nº  : <asp:Label ID="lblid" runat="server" Text="Label"></asp:Label>  Estado :<asp:Label ID="lblestado" runat="server" Text="Label"></asp:Label></strong></h4></div>
<div class="panel-body" >

<div class="panel panel-default">
<div class="panel panel-body">
<div class="row">
<div class="col-sm-3">
<div class="form-group">
Empresa Emite Boleta:
<asp:DropDownList ID="ddlempresa" runat="server" CssClass="form-control" Enabled="False">
<asp:ListItem>World Transport Int Ltda</asp:ListItem>
<asp:ListItem>World Transport Courier Ltda</asp:ListItem>
<asp:ListItem>Tr3s Vias Ltda</asp:ListItem>
</asp:DropDownList>
</div>
</div>
<div class="col-sm-3">
<div class="form-group">
Fecha de Ingreso:
<asp:TextBox ID="txtfingreso" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
</div>
</div>
<div class="col-sm-3">
<div class="form-group">
T. Cambio USD:
<asp:TextBox ID="txttcambio" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
</div>
</div>
<div class="col-sm-3">
<div class="form-group">
Usuario :
<asp:TextBox ID="txtuser" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
</div>
</div>
</div>
</div>
</div>

   
<div class="panel panel-default">
<div class="panel-heading"><h4><strong>Detalles de Cheque</strong></h4></div>
<div class="panel panel-body">
<div class="row">
<div class="col-sm-3">
<div class="form-group">
Nº Boleta:
 <asp:TextBox ID="txtnboleta" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>
</div>
</div>
<div class="col-sm-3">
<div class="form-group">
Empresa :
<asp:DropDownList ID="ddlemprpago" runat="server" CssClass="form-control" DataSourceID="emitircheque" DataTextField="Codigo_Emp" DataValueField="Nombre_Emp" Enabled="False" OnSelectedIndexChanged="ddlemprpago_SelectedIndexChanged">
</asp:DropDownList>
<asp:SqlDataSource ID="emitircheque" runat="server" ConnectionString="<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>" SelectCommand="SELECT * FROM [CodEmpr]">
</asp:SqlDataSource>
</div>
</div>
<div class="col-sm-3">
<div class="form-group">
Emitir Cheque a :
<asp:TextBox ID="txtechequea" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
</div>
</div>
<div class="col-sm-3">
<div class="form-group">
Cargo en la Empresa :
<asp:TextBox ID="txtcargo" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
</div>
</div>
</div>
<div class="row">
<div class="col-sm-3">
<div class="form-group">
Emitir Boleta a Nombre de :
<asp:TextBox ID="txteboletaa" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
</div>
</div>
<div class="col-sm-3">
<div class="form-group">
Nombre Contacto comex :
<asp:TextBox ID="txtxcomex" runat="server" CssClass="form-control" Enabled="False" ></asp:TextBox>
</div>
</div>
<div class="col-sm-3">
Retira Cheque :
<asp:TextBox ID="txtretiracheque" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
</div>
<div class="col-sm-3">
</div>
</div>
<div class="row">
<div class="col-sm-12 text-center">
<asp:CheckBox ID="cbautopant" runat="server" Text="Autoriza CC Anticipada con Factura sin pago previo" Enabled="False" OnCheckedChanged="cbautopant_CheckedChanged"/>
</div>
</div>
</div> 
</div> 


<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-heading"><h4><strong>Operaciones</strong></h4></div>
<div class="panel panel-body">
<div class="scrolling-table-container">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">
<asp:GridView ID="gvoperacion" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_DetallePCC" DataSourceID="Detallescc" ForeColor="#333333" Height="100%" HorizontalAlign="Center"  Width="100%" GridLines="None">
<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
<asp:BoundField DataField="id_DetallePCC" HeaderText="id_DetallePCC" InsertVisible="False" ReadOnly="True" SortExpression="id_DetallePCC" Visible="False" />
<asp:BoundField DataField="id_SolPCC" HeaderText="id_SolPCC" SortExpression="id_SolPCC" Visible="False"  />
<asp:BoundField DataField="id_CodEmpresa" HeaderText="Cod Empresa" SortExpression="id_CodEmpresa" />
<asp:BoundField DataField="Fecha_Factura" HeaderText="Fecha Factura" SortExpression="Fecha_Factura" />
<asp:BoundField DataField="N_Operacion" HeaderText="Nº Operacion" SortExpression="N_Operacion" />
<asp:BoundField DataField="N_Factura" HeaderText="Nº Factura" SortExpression="N_Factura" />
<asp:BoundField DataField="MontoCC" HeaderText="Monto USD" SortExpression="MontoCC" />
<asp:BoundField DataField="Profit_Neto" HeaderText="Profit Neto" SortExpression="Profit_Neto" />
<asp:BoundField DataField="PorcWTI" HeaderText="% WTI" SortExpression="PorcWTI" />
<asp:BoundField DataField="Observacion" HeaderText="Observacion" SortExpression="Observacion" />
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
<asp:SqlDataSource ID="Detallescc" runat="server" ConnectionString="<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>" SelectCommand="SELECT id_DetallePCC,id_SolPCC,id_CodEmpresa,FORMAT(Fecha_Factura,'dd-MM-yyyy') as Fecha_Factura,N_Operacion,N_Factura,MontoCC,Profit_Neto,PorcWTI,Observacion FROM [DetallePago] WHERE ([id_SolPCC] = @id_SolPCC)" OnSelecting="Detallescc_Selecting">
<SelectParameters>
<asp:ControlParameter ControlID="lblid" Name="id_SolPCC" PropertyName="Text" Type="String" />
</SelectParameters>
</asp:SqlDataSource>
</div> 
</div> 
</div> 
</div> 
</div> 
</div> 
</div>   
   

<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel panel-body text-center">
<asp:Button ID="btnimprimir" runat="server" CssClass="btn btn-primary btn-lg" Text="Imprimir" OnClick="btnimprimir_Click" />
<asp:Button ID="btnmodificar" runat="server" CssClass="btn btn-danger btn-lg" Text="Modificar" OnClick="btnmod_Click" />
<asp:Button ID="btnGrabar" runat="server" CssClass="btn btn-primary btn-lg" Text="Grabar" Visible="false" OnClick="btngrabar_Click"/>
</div> 
</div> 
</div> 
</div>


<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel panel-body">
<div class="scrolling-table-container">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">
<asp:GridView ID="GvComentarios" runat="server" AutoGenerateColumns="False" CaptionAlign="Bottom"  EmptyDataText="Sin Registros" ShowHeaderWhenEmpty="True" CellPadding="4" CssClass="auto-style76" DataSourceID="Comentarios" ForeColor="#333333" GridLines="None" Height="50%" HorizontalAlign="Center" Width="100%">
<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
<asp:BoundField DataField="NContsolpcc" HeaderText="NContsolpcc" SortExpression="NContsolpcc" Visible="false" />
<asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
<asp:BoundField DataField="FechaingDet" HeaderText="Fecha" SortExpression="FechaingDet" />
<asp:BoundField DataField="Detalle" HeaderText="Comentario" SortExpression="Detalle" />
</Columns>
<EditRowStyle BackColor="#999999" />
<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" Width="30%" />
<SortedAscendingCellStyle BackColor="#E9E7E2" />
<SortedAscendingHeaderStyle BackColor="#506C8C" />
<SortedDescendingCellStyle BackColor="#FFFDF8" />
<SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>
<asp:SqlDataSource ID="Comentarios" runat="server" ConnectionString="<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>" SelectCommand="SELECT NContsolpcc,Usuario,FORMAT(FechaingDet,'dd-MM-yyyy') as FechaingDet,Detalle FROM DetallePcc WHERE ([NContsolpcc] = @NContsolpcc)">
<SelectParameters>
<asp:ControlParameter ControlID="lblid" Name="NContsolpcc" PropertyName="Text" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource>
<asp:TextBox ID="txtComentario" runat="server" CssClass="form-control" Height="130px" style="border-style: solid; border-width: 3px" Width="100%"></asp:TextBox>
<asp:Button ID="btnGrabarComentario" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btnComentario_Click" Text="Comentar" ValidationGroup="recibido" />
</div> 
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
