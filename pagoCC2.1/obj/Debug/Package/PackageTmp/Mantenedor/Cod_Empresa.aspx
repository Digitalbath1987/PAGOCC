<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Cod_Empresa.aspx.cs" Inherits="pagoCC2._1.Mantenedor.Cod_Empresa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/Modal.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
<div class="panel panel-primary">
<div class="panel-heading"><h4><strong>Codigo Empresas</strong></h4></div>
<div class="panel-body">
<div class="text-center">

<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-6">
<div class="panel panel-default">
<div class="panel-heading"><strong>Crear Codigo</strong></div>
<div class="panel-body" >


   
<div class="row" >
<div class="col-sm-4">
    <strong>Nombre Empresa</strong>
</div>
<div class="col-sm-8">
<asp:TextBox ID="txtnombreemp" runat="server" CssClass="form-control" ></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtnombreemp" ErrorMessage="*" ForeColor="Red" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
</div>
</div>


<div class="row" >
<div class="col-sm-4">
<strong>Rut</strong>
</div>
<div class="col-sm-8">
<asp:TextBox ID="txtrut" runat="server" CssClass="form-control" ></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtrut" ErrorMessage="*" ForeColor="Red" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
</div>
</div>


<div class="row" >
<div class="col-sm-4">
<strong>Codigo Empresa</strong>
</div>
<div class="col-sm-8">
<asp:TextBox ID="txtcodempr" runat="server" CssClass="form-control" ></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtcodempr" ErrorMessage="*" ForeColor="Red" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
</div>
</div>


<div class="row" >
<div class="col-sm-4">
<strong>Emitir Cheque A</strong>
</div>
<div class="col-sm-8">
<asp:TextBox ID="txtemitircha" runat="server" CssClass="form-control" ></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtemitircha" ErrorMessage="*" ForeColor="Red" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
</div>
</div>


<div class="row" >
<div class="col-sm-4">
<strong>Cargo</strong>
</div>
<div class="col-sm-8">
<asp:TextBox ID="txtcargo" runat="server" CssClass="form-control" ></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtcargo" ErrorMessage="*" ForeColor="Red" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
</div>
</div>


<div class="row" >
<div class="col-sm-4">
<strong>Email</strong>
</div>
<div class="col-sm-8">
<asp:TextBox ID="txtemail" runat="server" CssClass="form-control"  TextMode="Email"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtcargo" ErrorMessage="*" ForeColor="Red" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
</div>
</div>


<div class="row" >
<div class="col-sm-4">
<strong>Retira cheque</strong>
</div>
<div class="col-sm-8">
<asp:TextBox ID="txtretiracheque" runat="server" CssClass="form-control" ></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtretiracheque" ErrorMessage="*" ForeColor="Red" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
</div>
</div>


<div class="row" >
<div class="col-sm-4">
<strong>Contacto comex</strong>
</div>
<div class="col-sm-8">
<asp:TextBox ID="txtcontaccomex" runat="server" CssClass="form-control" ></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtcontaccomex" ErrorMessage="*" ForeColor="Red" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
</div>
</div>




<div class="row">

<div class="alert alert-success alert-dismissible" visible="false" id="lblmensaje_ok" runat="server" >
<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
<strong>Registro Actualizado!</strong>Los datos fueron actualizados correctamente.
</div>

<div class="alert alert-danger alert-dismissible" visible="false" id="lblmensaje_nook" runat="server">
<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
<strong>Acceso Denegado!</strong> No Posee Permiso, Contacte al Administrador.
</div>

</div>











<div class="row">
<div class="col-sm-12">
<asp:Button ID="Registrar" runat="server" CssClass="btn btn-primary" OnClick="Registrar_Click" Text="Ingresar" ValidationGroup="registrar" />
</div>
</div>

</div>
</div>
</div>
<div class="col-sm-3"></div>
</div>


<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-heading"><strong>Listado de Codigos</strong></div>
<div class="panel-body" >
<div class="scrolling-table-container">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">

<asp:GridView ID="gvEmpresas" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_Codigo" DataSourceID="Empresas" ForeColor="#333333" GridLines="None" Height="100%" Width="100%" CssClass="auto-style36" OnSelectedIndexChanged="gvEmpresas_SelectedIndexChanged">
<AlternatingRowStyle BackColor="White" />
<Columns>
<asp:BoundField DataField="id_Codigo" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_Codigo" />
<asp:BoundField DataField="RUT" HeaderText="RUT" SortExpression="RUT" />
<asp:BoundField DataField="Nombre_Emp" HeaderText="Nombre Empresa" SortExpression="Nombre_Emp" />
<asp:BoundField DataField="Codigo_Emp" HeaderText="Codigo Empresa" SortExpression="Codigo_Emp" />
<asp:BoundField DataField="EChequeA" HeaderText="Emitir Cheque A" SortExpression="EChequeA" />
<asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" />
<asp:BoundField DataField="RetiraCheque" HeaderText="Retira Cheque" SortExpression="RetiraCheque" />
<asp:BoundField DataField="Comex" HeaderText="Contacto Comex" SortExpression="Comex" />
 <asp:CommandField ShowSelectButton="True" headerText="Selec"   ControlStyle-CssClass="btn default btn-lg  purple"  SelectText="<i aria-hidden='true'  class='glyphicon glyphicon glyphicon-pencil btn-lg'></i>">
<ControlStyle CssClass="btn default btn-xs purple"></ControlStyle>
</asp:CommandField>
</Columns>
<EditRowStyle BackColor="#2461BF" />
<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="black" />
<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
<RowStyle BackColor="#EFF3FB" />
<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
<SortedAscendingCellStyle BackColor="#F5F7FB" />
<SortedAscendingHeaderStyle BackColor="#6D95E1" />
<SortedDescendingCellStyle BackColor="#E9EBEF" />
<SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>

<asp:SqlDataSource ID="Empresas" runat="server" ConnectionString="<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>" SelectCommand="SELECT * FROM [CodEmpr] ORDER BY [id_Codigo] DESC"></asp:SqlDataSource>
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

<div id="modalHtml" class="modalDialog">
 <div><a href="#cerrar" title="Cerrar" class="close">X</a>
     
<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-heading"><strong>Modificar Cod Empresa</strong></div>
<div class="panel-body">

<div class="row" >
<div class="col-sm-4">
<strong>RUT :</strong>  
</div>
<div class="col-sm-8">
<asp:TextBox ID="txtrutod" runat="server"  CssClass="form-control"></asp:TextBox>
</div>
</div>

<div class="row" >
<div class="col-sm-4">
<strong>Nombre Empresa :</strong> 
</div>
<div class="col-sm-8">
<asp:TextBox ID="txtnomemprmod"  CssClass="form-control" runat="server"></asp:TextBox>
</div>
</div>

<div class="row" >
<div class="col-sm-4">
<strong>Cod Empresa :</strong> 
</div>
<div class="col-sm-8">
<asp:TextBox ID="txtcodemprmod"   CssClass="form-control" runat="server"></asp:TextBox> 
</div>
</div>

<div class="row" >
<div class="col-sm-4">
<strong>Emitir cheque A :</strong> 
</div>
<div class="col-sm-8">
<asp:TextBox ID="txtemicheqmod"  CssClass="form-control" runat="server"></asp:TextBox>    
</div>
</div>

<div class="row" >
<div class="col-sm-4">
<strong>Cargo :</strong> 
</div>
<div class="col-sm-8">
<asp:TextBox ID="txtcargomod"   CssClass="form-control" runat="server"></asp:TextBox>
</div>
</div>

<div class="row" >
<div class="col-sm-4">
<strong>Retira Cheque :</strong> 
</div>
<div class="col-sm-8">
<asp:TextBox ID="txtreticheqmod"  CssClass="form-control" runat="server"></asp:TextBox>
</div>
</div>
    
<div class="row" >
<div class="col-sm-4">
<strong>Contacto comex :</strong> 
</div>
<div class="col-sm-8">
<asp:TextBox ID="txtcontcomexmod"  CssClass="form-control" runat="server"></asp:TextBox>
</div>
</div>
</div>
<div class="modal-footer">
 <div class="text-center">
     <div class="row" >
<div class="col-sm-12">
<asp:Button ID="btngrabarmod" runat="server" CssClass="btn btn-primary" OnClick="btngrabarmod_Click" Text="Modificar" />
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
