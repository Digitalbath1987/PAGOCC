<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pagoCC2._1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sistema de Pagos de CC</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>


    
<div class="grid-block embed-responsive-16by9" style="background-image: url('/PagoCC/Imagenes/Fondo_Login.jpg') ;background-repeat: no-repeat; background-attachment:fixed; background-size: cover; width: 100%; height: 100vh; ">
 
<form runat="server" >
<div>
<div class="row">
<div class="col-sm-4">
</div>
<div class="col-sm-4  text-center">
<br />
<br />
<br />
<br />

<div class="container">
<div class="row">
<div class="col-sm-4">
<div class="panel panel-default">
<div class="panel-heading"><h4><strong>World Transport Pago CC</strong></h4></div> 

<div class="panel-body">


<div class="input-group">
<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
<asp:TextBox  id="txt_User"  runat="server" class="form-control" placeholder="Usuario"></asp:TextBox>
</div>
<br />
<div class="input-group">
<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
<asp:TextBox  id="txt_Pass" type="password" runat="server"  class="form-control" placeholder="Password"></asp:TextBox>
</div>
<br />
<div class="input-group">
 <button type="button" class="btn btn-primary" id="Btn_Login" runat="server" onserverclick="Btn_Login_ServerClick"><span class="glyphicon glyphicon-ok-sign"></span>  Iniciar Sesion</button>
</div>

</div>

<div class="panel-footer">

<a href="#">¿Olvido su Contraseña ?</a>

</div>
</div>
</div>
</div>
</div>

</div>
<div class="col-sm-4">
</div>
</div>
</div>

    </form>


    <br />
    <br />

    <br />

<footer class="text-center">
<strong>Developed by Mario Rosales Figueroa © Copyright 2017 All Rights Reserved , World Transport International Ltda.</strong>
</footer>
 


</body>
</html>
