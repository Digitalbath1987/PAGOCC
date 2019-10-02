<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Registrar_Pago.aspx.cs" Inherits="pagoCC2._1.PagoCC.Registrar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="../Content/Modal.css" rel="stylesheet" />
    
<style type="text/css">
 .DataGridFixedHeader
{
position: relative;
top: expression(this.offsetParent.scrollTop-3); /*this works fine with IE only, but FireFox seems to be ignoring this*/
}
</style>

<script>function MostrarModalJS() {
window.location.href = '#modalHtml';
}</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container">
<div class="panel panel-primary">
<div class="panel-heading"><h4><strong>Solicitud de Pago CC  <i class="fas fa-file-invoice-dollar"></i>
</strong></h4></div>
<div class="panel-body" >


<div class="row">
 <div class="col-sm-2">
<div class="form-group">
<h5><label for="ejemplo_email_1">
Numero de Solicitud:</label></h5>
<asp:TextBox ID="txtIdSol"  class="form-control" runat="server" disabled></asp:TextBox>
</div> 
</div> 
</div> 

    
<div class="panel panel-default">
<div class="row">
<div class="col-sm-3">
<div class="form-group">
<h4>
<strong>
Emitir Boleta Por Empresa :
</strong>
</h4>
</div>
</div>

<div class="col-sm-9">
<div class="form-group">

<h4>
<strong>
<asp:RadioButtonList ID="rbEmpresas" runat="server" RepeatDirection="Horizontal" Width="100%" >
<asp:ListItem Selected="True">World Transport Int Ltda</asp:ListItem>
<asp:ListItem>World Transport Courier Ltda</asp:ListItem>
<asp:ListItem>Tr3s Vias Ltda</asp:ListItem>
</asp:RadioButtonList>
</strong>
</h4>
</div>

</div>
    
</div>
</div>


<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-heading">

<div class="row text-center">

<div class="col-sm-6">

<h4><strong>Detalle de las Facturas Asociadas</strong></h4>

</div>

<div class="col-sm-6">
<button type="button" class="btn btn-sm"  onclick="MostrarModalJS(); return false;"><i class="glyphicon glyphicon-plus-sign"></i></button>
</div>



</div>
</div> 
<div class="panel-body">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">
<asp:GridView ID="gvDetalle" runat="server" Width="100%" Height="100%" DataKeyNames="id_DetallePCC" DataSourceID="Detalle" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true"  OnSelectedIndexChanged="gvDetalle_SelectedIndexChanged"  EmptyDataText="No se encontraron registros para los criterios de búsqueda ingresados" CellPadding="4" ForeColor="#333333" GridLines="None" >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="id_DetallePCC" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_DetallePCC" ShowHeader="False" Visible="False" />
            <asp:BoundField DataField="MontoCC" HeaderText="Monto CC" SortExpression="MontoCC" />
            <asp:BoundField DataField="id_CodEmpresa" HeaderText="Cod Empresa" SortExpression="id_CodEmpresa" />
            <asp:BoundField DataField="Fecha_Factura" HeaderText="Fecha Factura" SortExpression="Fecha_Factura" />
            <asp:BoundField DataField="N_Operacion" HeaderText="Nº Operacion" SortExpression="N_Operacion" />
            <asp:BoundField DataField="N_Factura" HeaderText="Nº Factura" SortExpression="N_Factura" />
            <asp:BoundField DataField="Profit_Neto" HeaderText="Profit" SortExpression="Profit_Neto" />
            <asp:BoundField DataField="PorcWTI" HeaderText="% WTI" SortExpression="PorcWTI" />
            <asp:BoundField DataField="Observacion" HeaderText="Observacion" SortExpression="Observacion" />
            

            <asp:CommandField ShowSelectButton="True" headerText="Selec"   ControlStyle-CssClass="btn default btn-lg  purple" SelectText="<i aria-hidden='true' class='glyphicon glyphicon-trash btn-lg'></i>">
<ControlStyle CssClass="btn default btn-xs purple"></ControlStyle>
</asp:CommandField>




        </Columns>
        <EditRowStyle BackColor="#999999"></EditRowStyle>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>
        <HeaderStyle CssClass="DataGridFixedHeader" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>
        <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
        <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>
        <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>
        <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>
        <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
    </asp:GridView>

<asp:SqlDataSource ID="Detalle" runat="server" ConnectionString="<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>" SelectCommand="SELECT id_DetallePCC,id_SolPCC,id_CodEmpresa,FORMAT(Fecha_Factura,'dd-MM-yyyy') as Fecha_Factura,N_Operacion,N_Factura,MontoCC,Profit_Neto,PorcWTI,Observacion FROM DetallePago WHERE ([id_SolPCC] = @id_SolPCC) ORDER BY [id_DetallePCC]">
<SelectParameters>
<asp:ControlParameter ControlID="txtIdSol" Name="id_SolPCC" PropertyName="Text" Type="String" />
</SelectParameters>
</asp:SqlDataSource>

</div>
</div>
</div>



</div>
</div>
</div>
</div>


<div class="container-fluid">
<div class="row">
<div class="col-sm-8" >

<div class="row">
<div class="col-sm-3" >
Total USD: <asp:TextBox ID="txtTotalusd" runat="server" class="form-control"   AutoPostBack="True" disabled></asp:TextBox>
<br />
</div>
</div>


</div>


<div class="col-sm-4" >


<div class="panel panel-default">
<div class="panel-body" style="background-color:lavender;">

<div class="row">  
<div class="col-sm-12">
<div class="form-group">
T.Cambio
<asp:TextBox ID="txttcambio" runat="server" class="form-control" AutoPostBack="True" OnTextChanged="txttcambio_TextChanged" ></asp:TextBox>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txttcambio" ErrorMessage="*" ForeColor="Red" ValidationExpression="^(\d|-)?(\d|)*\,?\d*$" ValidationGroup="registrar">*</asp:RegularExpressionValidator>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txttcambio" ErrorMessage="*" ForeColor="Red" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-12">
<div class="form-group">
Bruto<asp:TextBox ID="txtbruto" runat="server" class="form-control" disabled></asp:TextBox>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-12">
<div class="form-group">
10%<asp:TextBox ID="txt10porc" runat="server" class="form-control" disabled></asp:TextBox>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-12">
<div class="form-group">
Liquido<asp:TextBox ID="txtliq" runat="server" class="form-control" disabled></asp:TextBox>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>



<div class="row" >
<div class="col-sm-5">
</div>
<div class="col-sm-7">
<div class="panel panel-default">
<div class="panel-body" style="background-color:lavender;">

<div class="row"> 
<div class="col-sm-4">
<p class="text-right">Boleta Nº :</p> 
</div>
<div class="col-sm-8">
<div class="form-group">
<asp:TextBox ID="txtnboleta" runat="server"  class="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvboletan" runat="server" ControlToValidate="txtnboleta" ErrorMessage="*" ForeColor="Red" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-4">
<p class="text-right">Empresa :</p> 
</div>
<div class="col-sm-8">
<div class="form-group">
<asp:DropDownList ID="ddlempecheq" runat="server" class="form-control"  Selected="True" DataSourceID="chequea" DataTextField="Codigo_Emp" DataValueField="Nombre_Emp">
</asp:DropDownList>
<asp:SqlDataSource ID="chequea" runat="server" ConnectionString="<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>" SelectCommand="SELECT CodEmpr.Codigo_Emp,CodEmpr.Nombre_Emp  FROM  CodEmpr, DetallePago where CodEmpr.Codigo_Emp = DetallePago.id_CodEmpresa and id_SolPCC = @codigo">
<SelectParameters>
<asp:ControlParameter ControlID="txtIdSol" Name="codigo" PropertyName="Text" />
</SelectParameters>
</asp:SqlDataSource>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-4">
<p class="text-right">Emitir Cheque a :</p> 
</div>
<div class="col-sm-8">
<div class="form-group">
<asp:TextBox ID="txtechequea" runat="server"  class="form-control" ></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvechequea" runat="server" ControlToValidate="txtechequea" ErrorMessage="*" ForeColor="Red" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-4">
<p class="text-right">
Cargo en la Empresa :
</p> 
</div>
<div class="col-sm-8">
<div class="form-group">
<asp:TextBox ID="txtcargo" runat="server"  class="form-control" ></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvcargo" runat="server" ControlToValidate="txtcargo" ErrorMessage="*" ForeColor="Red" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-4">
<p class="text-right">
Emitir Boleta a Nombre de :
</p> 
</div>
<div class="col-sm-8">
<div class="form-group">
<asp:TextBox ID="txteboleta" runat="server"  class="form-control" ></asp:TextBox>
<asp:RequiredFieldValidator ID="rfveboletnom" runat="server" ControlToValidate="txteboleta" ErrorMessage="*" ForeColor="Red" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-4">
<p class="text-right">
Nombre Contacto comex :
</p> 
</div>
<div class="col-sm-8">
<div class="form-group">
<asp:TextBox ID="txtcomex" runat="server"  class="form-control" ></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvcomex" runat="server" ControlToValidate="txtcomex" ErrorMessage="*" ForeColor="Red" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-4 mb-3">
<p class="text-right">Retira Cheque :</p> 
</div>
<div class="col-sm-8 mb-3">
<div class="form-group">
<asp:TextBox ID="txtretira"  class="form-control" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvretira" runat="server" ControlToValidate="txtretira" ErrorMessage="*" ForeColor="Red" ValidationGroup="registrar">*</asp:RequiredFieldValidator>
</div>
</div>
</div>

</div>
</div>
</div>
</div>


<div class="row">
<div class="col-sm-12 text-center">
<asp:CheckBox ID="cbautopant" runat="server"  class="form-control" Text="Autoriza CC Anticipada con Factura sin pago previo"/><br />
</div>
</div>


<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel-body text-center">

<button ID="Btn_Registrar"  runat="server" onserverclick="Btn_Registrar_ServerClick" ValidationGroup="registrar"  type="button" class="btn btn-primary btn-lg">
<span class="glyphicon glyphicon-floppy-saved"></span> Registrar
</button>

</div>
</div>
</div>
</div>


</div>
</div>




<div id="modalHtml" class="modalDialog">

<div class="scrolling-table-container">
<div style="overflow-x:auto;">
<div class="table-responsive-sm">

<a href="#cerrar" title="Cerrar" class="close btn-lg">X</a>

<div class="row">
<div class="col-sm-12">
<div class="panel panel-default">
<div class="panel panel-heading text-center"><h2><strong>Registrar Detalle</strong></h2></div>
<div class="panel-body text-center">


<div class="row"> 
<div class="col-sm-3">
<p class="text-right">Fecha Factura :</p> 
</div>
<div class="col-sm-9">
<div class="form-group">
<asp:TextBox ID="txtfechafact" runat="server"  class="form-control" TextMode="Date"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvfeca" runat="server" ControlToValidate="txtfechafact" ErrorMessage="*" ForeColor="Red" ValidationGroup="grabardett">*</asp:RequiredFieldValidator>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-3">
<p class="text-right">Nº Factura :</p> 
</div>
<div class="col-sm-9">
<div class="form-group">
<asp:TextBox ID="txtnfact" runat="server"  class="form-control"></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvnfact" runat="server" ControlToValidate="txtnfact" ErrorMessage="*" ForeColor="Red" ValidationGroup="grabardett">*</asp:RequiredFieldValidator>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-3">
<p class="text-right">Nº Operacion :</p> 
</div>
<div class="col-sm-9">
<div class="form-group">
<asp:TextBox ID="txtnoper" runat="server"  class="form-control"  ></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvnope" runat="server" ControlToValidate="txtnoper" ErrorMessage="*" ForeColor="Red" ValidationGroup="grabardett">*</asp:RequiredFieldValidator>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-3">
<p class="text-right">Monto CC :</p> 
</div>
<div class="col-sm-9">
<div class="form-group">
<asp:TextBox ID="txtmontocc" runat="server"  class="form-control" ></asp:TextBox>
<asp:RequiredFieldValidator ID="rfvmontocc" runat="server" ControlToValidate="txtmontocc" ErrorMessage="*" ForeColor="Red" ValidationGroup="grabardett">*</asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="revmonto" runat="server" ControlToValidate="txtmontocc" ErrorMessage="*" ForeColor="Red" ValidationExpression="^(\d|-)?(\d|)*\,?\d*$" ValidationGroup="grabardett">*</asp:RegularExpressionValidator>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-3">
<p class="text-right">Empresa :</p> 
</div>
<div class="col-sm-9">
<div class="form-group">
<asp:DropDownList ID="ddlempresa" runat="server" DataSourceID="Empresas"  class="form-control"  DataTextField="Codigo_Emp" DataValueField="Codigo_Emp" >
</asp:DropDownList>
<asp:SqlDataSource ID="Empresas" runat="server" ConnectionString="<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>" SelectCommand="SELECT [Nombre_Emp], [Codigo_Emp] FROM [CodEmpr] ORDER BY [Codigo_Emp] ASC"></asp:SqlDataSource>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-3">
<p class="text-right">Profit Neto :</p> 
</div>
<div class="col-sm-9">
<div class="form-group">
<asp:TextBox ID="txtprofit"  class="form-control"  runat="server" ></asp:TextBox>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-3">
<p class="text-right">% Para WTI :</p> 
</div>
<div class="col-sm-9">
<div class="form-group">
<asp:TextBox ID="txtporcwti"  class="form-control"  runat="server" ></asp:TextBox>
</div>
</div>
</div>

<div class="row"> 
<div class="col-sm-3">
<p class="text-right">Observaciones :</p> 
</div>
<div class="col-sm-9">
<div class="form-group">
<asp:TextBox ID="txtobserv"  class="form-control"  runat="server"></asp:TextBox>
</div>
</div>
</div>


<div class="row"> 
<div class="col-sm-12">
<div class="form-group">

<strong>
<button ID="Btn_Grabar"  runat="server" type="button" onserverclick="Btn_Grabar_ServerClick" class="btn btn-primary btn-lg">
<span class="glyphicon glyphicon-floppy-saved"></span> Grabar
</button>
</strong>

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
