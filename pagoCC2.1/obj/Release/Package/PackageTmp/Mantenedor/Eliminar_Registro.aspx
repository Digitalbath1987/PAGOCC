<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Eliminar_Registro.aspx.cs" Inherits="pagoCC2._1.Mantenedor.Eliminar_Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="../Content/Modal.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container">
<div class="panel panel-primary">
<div class="panel-heading"><h4><strong>Eliminar Registro</strong></h4></div>
<div class="panel-body">
<div class="text-center">
<div class="scrolling-table-container">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">
<asp:GridView ID="gvregistros" runat="server" AutoGenerateColumns="False" CellPadding="4"  DataKeyNames="id_Solicitud" DataSourceID="Users" ForeColor="#333333" Height="100%" Width="100%" GridLines="None" OnSelectedIndexChanged="gvregistros_SelectedIndexChanged">
<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
<asp:BoundField DataField="ncontador" HeaderText="Nº Solicitud" SortExpression="ncontador" />
<asp:BoundField DataField="id_Solicitud" HeaderText="id_Solicitud" Visible="false" SortExpression="id_Solicitud" InsertVisible="False" ReadOnly="True" />
<asp:BoundField DataField="Empresa" HeaderText="Empresa" SortExpression="Empresa" />
<asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
<asp:BoundField DataField="Fecha_Ingreso" HeaderText="Fecha Ingreso" SortExpression="Fecha_Ingreso" />
<asp:BoundField DataField="tcambio" HeaderText="t cambio" SortExpression="tcambio" />
<asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
<asp:BoundField DataField="NFolio" HeaderText="NFolio" SortExpression="NFolio" />
<asp:BoundField DataField="NCheque" HeaderText="NCheque" SortExpression="NCheque" />
<asp:BoundField DataField="NBoleta" HeaderText="NBoleta" SortExpression="NBoleta" />
<asp:CommandField ShowSelectButton="True" HeaderText="Eliminar" ControlStyle-CssClass="btn default btn-lg  purple" SelectText="<i aria-hidden='true' class='glyphicon glyphicon glyphicon-pencil btn-lg'></i>">
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
<asp:SqlDataSource ID="Users" runat="server" ConnectionString="<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>" SelectCommand="SELECT * FROM [SolicitudPcc] ORDER BY [ncontador] DESC"></asp:SqlDataSource>
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
<strong>Registro Actualizado!</strong>Se proceso correctamente su solicitud.
</div>

<div class="alert alert-danger alert-dismissible" visible="false" id="lblmensaje_nook" runat="server">
<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
<strong>Acceso Denegado!</strong> No Posee Permiso, Contacte al Administrador.
</div>

</div>
</div>





<div id="modalHtml" class="modalDialog">
<div><a href="#cerrar" title="Cerrar" class="close">X</a>

<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-heading"><strong>ID Usuario :</strong><strong>Usuario :</strong></div>
<div class="panel-body" >

<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="col-sm-3">
<asp:Button ID="btngrabarmod" runat="server" CssClass="btn btn-primary btn-lg" OnClick="btngrabarmod_Click" Text="Modificar" />
</div>
<div class="col-sm-9">
<div class="alert alert-warning">
<strong>Warning!</strong>Esto habilitara la opcion de modificar al ver los detalles de la solicitud.
</div>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="col-sm-3">
<asp:Button ID="btneliminar" runat="server" CssClass="btn btn-danger btn-lg" OnClick="btneliminarmod_Click" Text="Eliminar"/>
</div>
<div class="col-sm-9">
<div class="alert alert-danger">
<strong>Danger!</strong> al seleccionar esta opcion se eliminaran los registros asociados a excepcion de las facturas asignadas ,
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
</div>






</asp:Content>
