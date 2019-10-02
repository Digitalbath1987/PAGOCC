<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="pagoCC2._1.Mantenedor.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/Modal.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
<div class="panel panel-primary">
<div class="panel-heading"><h4><strong>Usuarios</strong></h4></div>
<div class="panel-body">
<div class="text-center">

<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-6">
<div class="panel panel-default">
<div class="panel-heading"><strong>Crear Usuario</strong></div>
<div class="panel-body" >

<div class="row" >
<div class="col-sm-4">
<strong>Nombre</strong>
</div>
<div class="col-sm-8">
<asp:TextBox ID="nombre" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvnombre" runat="server" ControlToValidate="nombre" ErrorMessage="*" ForeColor="Red" ValidationGroup="crearuser">*</asp:RequiredFieldValidator>
</div>
</div>

<div class="row" >
<div class="col-sm-4">
<strong>Usuario</strong>
</div>
<div class="col-sm-8">
<asp:TextBox ID="usuario" runat="server" CssClass="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvusuario" runat="server" ControlToValidate="usuario" ErrorMessage="*" ForeColor="Red" ValidationGroup="crearuser">*</asp:RequiredFieldValidator>
</div>
</div>

<div class="row" >
<div class="col-sm-4">
<strong>Contraseña</strong>
</div>
<div class="col-sm-8">
<asp:TextBox ID="contraseña" runat="server" CssClass="form-control" TextMode="Password" ></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvcontraseña" runat="server" ControlToValidate="contraseña" ErrorMessage="*" ForeColor="Red" ValidationGroup="crearuser">*</asp:RequiredFieldValidator>
</div>
</div>

<div class="row" >
<div class="col-sm-4">
<strong>Correo</strong>
</div>
<div class="col-sm-8">
<asp:TextBox ID="mail" runat="server" CssClass="form-control"  TextMode="Email"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvcorreo" runat="server" ControlToValidate="mail" ErrorMessage="*" ForeColor="Red" ValidationGroup="crearuser">*</asp:RequiredFieldValidator>
</div>
</div>
        
<div class="row" >
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-body" >
<div class="text-center">

 <div class="row" >
<div class="col-sm-6">
<strong>Eliminar</strong>
</div>
<div class="col-sm-6">
<asp:RadioButtonList ID="rbelimi" runat="server" RepeatDirection="Horizontal" CssClass="form-control">
<asp:ListItem Selected="True">NO</asp:ListItem>
<asp:ListItem>SI</asp:ListItem></asp:RadioButtonList>
</div>
</div>


<div class="row" >
<div class="col-sm-6">
<strong>Modificar</strong>
</div>
<div class="col-sm-6">
<asp:RadioButtonList ID="rbmodi" runat="server" CssClass="form-control" RepeatDirection="Horizontal">
<asp:ListItem Selected="True">NO</asp:ListItem>
<asp:ListItem>SI</asp:ListItem>
</asp:RadioButtonList>
</div>
</div>

<div class="row" >
<div class="col-sm-6">
<strong>Registrar</strong>
</div>
<div class="col-sm-6">
<asp:RadioButtonList ID="rbregi" runat="server" CssClass="form-control" RepeatDirection="Horizontal"  OnSelectedIndexChanged="rbregi_SelectedIndexChanged">
<asp:ListItem Selected="True">NO</asp:ListItem>
<asp:ListItem>SI</asp:ListItem>
</asp:RadioButtonList>
</div>
</div>

<div class="row" >
<div class="col-sm-6">
<strong>Mantenedor</strong>
</div>
<div class="col-sm-6">
<asp:RadioButtonList ID="rbmant" runat="server" CssClass="form-control" RepeatDirection="Horizontal" >
<asp:ListItem Selected="True">NO</asp:ListItem>
<asp:ListItem>SI</asp:ListItem>
</asp:RadioButtonList>
</div>
</div>

<div class="row" >
<div class="col-sm-6">
<strong>Finanzas</strong>
</div>
<div class="col-sm-6">
<asp:RadioButtonList ID="rbfinanzas" runat="server" CssClass="form-control" RepeatDirection="Horizontal" >
<asp:ListItem Selected="True">NO</asp:ListItem>
<asp:ListItem>SI</asp:ListItem>
</asp:RadioButtonList>
</div>
</div>

<div class="row" >
<div class="col-sm-6">
<strong>Auditoria</strong>
</div>
<div class="col-sm-6">
<asp:RadioButtonList ID="rbauditoria" runat="server" CssClass="form-control" RepeatDirection="Horizontal">
<asp:ListItem Selected="True">NO</asp:ListItem>
<asp:ListItem>SI</asp:ListItem>
</asp:RadioButtonList>
</div>
</div>

<div class="row" >
<div class="col-sm-12 text-center"><br />
<asp:Button ID="Registrar" runat="server" CssClass="btn btn-primary" OnClick="Registrar_Click" Text="Ingresar" ValidationGroup="crearuser" />
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

<div class="col-sm-3"></div>
</div>

<div class="row">

<div class="alert alert-success alert-dismissible" visible="false" id="lblmensaje_ok" runat="server" >
<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
<strong>Registrado!</strong> El usuario fue creado Correctamente.
</div>

<div class="alert alert-danger alert-dismissible" visible="false" id="lblmensaje_nook" runat="server">
<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
<strong>Acceso Denegado!</strong> No Posee Permiso, Contacte al Administrador.
</div>

</div>

</div>
    

<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-heading"><strong>Listado de Usuarios</strong></div>
<div class="panel-body" >
<div class="scrolling-table-container">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">
<asp:GridView ID="gvusers" runat="server" AutoGenerateColumns="False" CellPadding="4"  DataKeyNames="Id_Usuario" DataSourceID="Users" ForeColor="#333333" Height="100%" Width="100%" GridLines="None" OnSelectedIndexChanged="gvusers_SelectedIndexChanged">
<AlternatingRowStyle BackColor="White" />
<Columns>
<asp:BoundField DataField="Id_Usuario" HeaderText="Id_Usuario" SortExpression="Id_Usuario" Visible="false" />
<asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
<asp:BoundField DataField="Usuario" HeaderText="Usuario" SortExpression="Usuario" />
<asp:BoundField DataField="Correo" HeaderText="Correo" SortExpression="Correo" />
<asp:BoundField DataField="Eliminar" HeaderText="Eliminar" SortExpression="Eliminar" />
<asp:BoundField DataField="Modificar" HeaderText="Modificar" SortExpression="Modificar" />
<asp:BoundField DataField="Registrar" HeaderText="Registrar" SortExpression="Registrar" />
<asp:BoundField DataField="Mantenedor" HeaderText="Mantenedor" SortExpression="Mantenedor" />
<asp:BoundField DataField="Finanzas" HeaderText="Finanzas" SortExpression="Finanzas" />
<asp:BoundField DataField="Auditoria" HeaderText="Auditoria" SortExpression="Auditoria" />
 <asp:CommandField ShowSelectButton="True" headerText="Selec"   ControlStyle-CssClass="btn default btn-lg  purple"  SelectText="<i aria-hidden='true'  class='glyphicon glyphicon-folder-open btn-lg'></i>">
<ControlStyle CssClass="btn default btn-xs purple"></ControlStyle>
</asp:CommandField>
</Columns>
<EditRowStyle BackColor="#2461BF" />
<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
<RowStyle BackColor="#EFF3FB" />
<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
<SortedAscendingCellStyle BackColor="#F5F7FB" />
<SortedAscendingHeaderStyle BackColor="#6D95E1" />
<SortedDescendingCellStyle BackColor="#E9EBEF" />
<SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>
<asp:SqlDataSource ID="Users" runat="server" ConnectionString="<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>" SelectCommand="SELECT * FROM [Usuarios] ORDER BY [Nombre]"></asp:SqlDataSource>
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






    
<div id="modalHtml" class="modalDialog">
<div><a href="#cerrar" title="Cerrar" class="close">X</a>
<div class="textomodal">
<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-heading">
<div class="text-center"><strong>ID Usuario: <asp:Label ID="lblidmoduser" runat="server" Text="Label"></asp:Label> Usuario : <asp:Label ID="lbnombre" runat="server" Text="Label"></asp:Label></strong></div>
</div>
<div class="panel-body" >


<div class="row">

<div class="col-sm-6">
<strong>Modificar:</strong>
</div>
<div class="col-sm-6">
<asp:RadioButtonList ID="rbmodmod"  runat="server" RepeatDirection="Horizontal"  CssClass="form-control">
<asp:ListItem>NO</asp:ListItem>
<asp:ListItem>SI</asp:ListItem>
</asp:RadioButtonList>
</div>
</div>

<div class="row">
<div class="col-sm-6">
<strong>Eliminar:</strong> 
</div>
<div class="col-sm-6">
<asp:RadioButtonList ID="rbmodeli" runat="server" RepeatDirection="Horizontal"  CssClass="form-control"><asp:ListItem>NO</asp:ListItem>
<asp:ListItem>SI</asp:ListItem></asp:RadioButtonList>
</div>
</div>

<div class="row">

<div class="col-sm-6">
<strong>Finanzas : </strong>
</div>
<div class="col-sm-6">
<asp:RadioButtonList ID="rbmodfinanz" runat="server" RepeatDirection="Horizontal"  CssClass="form-control"><asp:ListItem>NO</asp:ListItem>
<asp:ListItem>SI</asp:ListItem></asp:RadioButtonList>
</div>
</div>

<div class="row">

<div class="col-sm-6">
<strong>Auditoria :</strong>
</div>
<div class="col-sm-6">
<asp:RadioButtonList ID="rbmodaudi" runat="server" RepeatDirection="Horizontal" CssClass="form-control"><asp:ListItem>NO</asp:ListItem>
<asp:ListItem>SI</asp:ListItem></asp:RadioButtonList>
</div>
</div>

<div class="row">

<div class="col-sm-6">
<strong>Mantenedor : </strong>
</div>
<div class="col-sm-6">
<asp:RadioButtonList ID="rbmodmant" runat="server" RepeatDirection="Horizontal"  CssClass="form-control"><asp:ListItem>NO</asp:ListItem>
<asp:ListItem>SI</asp:ListItem></asp:RadioButtonList>
</div>
</div>

<div class="row">

<div class="col-sm-6">
<strong>Registrar : </strong>
</div>
<div class="col-sm-6">
<asp:RadioButtonList ID="rbmodreg" runat="server" RepeatDirection="Horizontal"  CssClass="form-control"><asp:ListItem>NO</asp:ListItem>
<asp:ListItem>SI</asp:ListItem></asp:RadioButtonList>
</div>
</div>


<div class="modal-footer">
 <div class="text-center">
<asp:Button ID="btngrabarmod" runat="server" CssClass="btn btn-primary" OnClick="btngrabarmod_Click" Text="Modificar" />
<asp:Button ID="btneliminar" runat="server" CssClass="btn btn-danger" OnClick="btneliminarmod_Click" Text="Eliminar" />
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
