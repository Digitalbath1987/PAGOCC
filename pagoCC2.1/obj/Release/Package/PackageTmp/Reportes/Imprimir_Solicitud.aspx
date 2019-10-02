<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Imprimir_Solicitud.aspx.cs" Inherits="pagoCC2._1.Reportes.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title>Imprimir Solicitud de CC</title>
    <style type="text/css">
        .auto-style1 {
            width: 748px;
        }
        .auto-style2 {
            height: 19px;
            }
        .auto-style3 {
            text-align: center;
        }
        .auto-style9 {
            height: 19px;
            width: 74px;
        }
        .auto-style10 {
            height: 19px;
            width: 75px;
        }
        .auto-style14 {
            width: 74px;
        }
        .auto-style15 {
            width: 75px;
        }
        .auto-style17 {
            border-style: solid;
            border-width: 2px;
            height: 19px;
            width: 75px;
        }
        .auto-style18 {
            width: 74px;
            height: 20px;
        }
        .auto-style19 {
            width: 75px;
            height: 20px;
        }
        .auto-style20 {
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            width: 75px;
            text-align: center;
        }
        .auto-style21 {
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            width: 75px;
            height: 20px;
            text-align: center;
        }
        .auto-style22 {
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
        }
        .auto-style23 {
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            height: 19px;
        }
        .auto-style24 {
            width: 74px;
            height: 25px;
        }
        .auto-style25 {
            height: 25px;
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
        }
        .auto-style27 {
            height: 19px;
            text-align: center;
        }
        .auto-style28 {
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            text-align: center;
        }
        .auto-style29 {
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            height: 20px;
            text-align: center;
        }
        .auto-style30 {
            text-align: center;
            text-decoration: underline;
        }
        .auto-style31 {
            height: 21px;
        }
        .auto-style32 {
            width: 75px;
            height: 21px;
        }
        .auto-style33 {
            margin-top: 0px;
        }
        .auto-style34 {
            border-style: solid;
            border-width: 2px;
            padding: 1px 4px;
            font-size: small;
        }
        .auto-style35 {
            border-style: solid;
            border-width: 2px;
            height: 19px;
            width: 75px;
            text-align: center;
        }
        .auto-style36 {
            border-style: solid;
            border-width: 2px;
            height: 19px;
            text-align: center;
        }
        .auto-style37 {
            font-size: small;
        }
        .auto-style38 {
            width: 132px;
            text-align: right;
        }
        .auto-style39 {
            font-size: xx-large;
        }
    </style>


</head>
<body  style="width: 748px; height: 939px" >
     <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" class="auto-style1">
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td colspan="2">
                   
                  
                    
                     <div class="auto-style38"><strong>Nº
                    <asp:Label ID="lblid" runat="server" Text="Label" CssClass="auto-style39"></asp:Label>
                    </strong></div>
                    
                     
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="10">
                    
                    <div>
                         <asp:Image ID="wtc" runat="server" Height="41px" ImageUrl="~/Imagenes/Courier.png" Visible="False" />
                    <asp:Image ID="wti" runat="server" CssClass="auto-style33" Height="96px" ImageUrl="~/Imagenes/wt.png" Visible="False" Width="154px" />
                    <asp:Image ID="tres" runat="server" Height="98px" ImageUrl="~/Imagenes/3v.png" Visible="False" Width="106px" />


                    </div>
                   
                  
                    
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3">Estado :&nbsp; <strong>
                    <asp:Label ID="lblestado" runat="server" Text="Label"></asp:Label>
                    </strong></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style17">Nº Folio</td>
                <td class="auto-style35">
                    <asp:Label ID="lblnfolio" runat="server" Text="Pendiente"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="10"><strong>SOLICITUD DE&nbsp; PAGO CC&nbsp; 
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style9"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td colspan="4"><strong>EMITIR BOLETA POR EMPRESA :</strong></td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="10">
                    <strong>
                    <asp:RadioButtonList ID="rbempresa" runat="server" RepeatDirection="Horizontal" Height="100%" Width="100%" Enabled="False">
                    <asp:ListItem>World Transport Int Ltda</asp:ListItem>
                    <asp:ListItem>World Transport Courier Ltda</asp:ListItem>
                    <asp:ListItem>Tr3s Vias Ltda</asp:ListItem>
                    </asp:RadioButtonList>
                    </strong>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="10"> 
                    <div class="auto-style3">
                        <asp:GridView ID="gvoperacion" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="id_DetallePCC" DataSourceID="Detallescc" ForeColor="Black" Height="100%" HorizontalAlign="Center" Width="100%" CssClass="auto-style37">
                    <Columns>
                        <asp:BoundField DataField="id_DetallePCC" HeaderText="id_DetallePCC" InsertVisible="False" ReadOnly="True" SortExpression="id_DetallePCC" Visible="False" />
                        <asp:BoundField DataField="id_SolPCC" HeaderText="id_SolPCC" SortExpression="id_SolPCC" Visible="False"  />
                        <asp:BoundField DataField="id_CodEmpresa" HeaderText="Cod Empresa" SortExpression="id_CodEmpresa" />
                        <asp:BoundField DataField="Fecha_Factura" HeaderText="Fecha Factura" SortExpression="Fecha_Factura" />
                        <asp:BoundField DataField="N_Operacion" HeaderText="Nº Operacion" SortExpression="N_Operacion" >   
                        <ItemStyle Font-Bold="True" Font-Size="Medium" ForeColor="Black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="N_Factura" HeaderText="Nº Factura" SortExpression="N_Factura" />
                        <asp:BoundField DataField="MontoCC" HeaderText="Monto USD" SortExpression="MontoCC" />
                        <asp:BoundField DataField="Profit_Neto" HeaderText="Profit Neto" SortExpression="Profit_Neto" />
                        <asp:BoundField DataField="PorcWTI" HeaderText="% WTI" SortExpression="PorcWTI" />
                        <asp:BoundField DataField="Observacion" HeaderText="Observacion" SortExpression="Observacion" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                    </div>
                <asp:SqlDataSource ID="Detallescc" runat="server" ConnectionString="<%$ ConnectionStrings:PagosCC.Properties.Settings.Cadena %>" SelectCommand="SELECT id_DetallePCC,id_SolPCC,id_CodEmpresa,FORMAT(Fecha_Factura,'dd-MM-yyyy') as Fecha_Factura,N_Operacion,N_Factura,MontoCC,Profit_Neto,PorcWTI,Observacion FROM DetallePago WHERE ([id_SolPCC] = @id_SolPCC)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblid" Name="id_SolPCC" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource></td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style20"><strong>Total USD</strong></td>
                <td class="auto-style28" colspan="2"><strong>
                    <asp:Label ID="txtTotalusd" runat="server" Text="Label"></asp:Label>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style20"><strong>TCambio</strong></td>
                <td class="auto-style28" colspan="2"><strong>
                    <asp:Label ID="txttcambio" runat="server" Text="Label"></asp:Label>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style18"></td>
                <td class="auto-style18"></td>
                <td class="auto-style19"></td>
                <td class="auto-style19"></td>
                <td class="auto-style19"></td>
                <td class="auto-style19"></td>
                <td class="auto-style19"></td>
                <td class="auto-style21"><strong>Bruto</strong></td>
                <td class="auto-style29" colspan="2"><strong>
                    <asp:Label ID="txtbruto" runat="server" Text="Label"></asp:Label>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style20"><strong>10%</strong></td>
                <td class="auto-style28" colspan="2"><strong>
                    <asp:Label ID="txt10porc" runat="server" Text="Label"></asp:Label>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style20"><strong>Liquido</strong></td>
                <td class="auto-style28" colspan="2"><strong>
                    <asp:Label ID="txtliq" runat="server" Text="Label"></asp:Label>
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style34" colspan="3"><strong>Nº Boleta :</strong></td>
                <td class="auto-style22" colspan="5">
                    <asp:Label ID="lblnboleta" runat="server" Text="lblnboleta"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style22" colspan="3"><strong style="font-size: small">Empresa :</strong></td>
                <td class="auto-style22" colspan="5">
                    <asp:Label ID="lblemprcobro" runat="server" Text="lblemprcobro"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style9"></td>
                <td class="auto-style23" colspan="3"><strong style="font-size: small">Emitir Cheque a :</strong></td>
                <td class="auto-style23" colspan="5">
                    <asp:Label ID="lblechequea" runat="server" Text="lblechequea"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style22" colspan="3"><strong style="font-size: small">Cargo en la Empresa :</strong></td>
                <td class="auto-style22" colspan="5">
                    <asp:Label ID="lblcargo" runat="server" Text="lblcargo"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style22" colspan="3"><strong style="font-size: small">Nombre Contacto comex :</strong></td>
                <td class="auto-style22" colspan="5">
                    <asp:Label ID="lblcontact" runat="server" Text="lblcontact"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td class="auto-style22" colspan="3"><strong style="font-size: small">Emitir Boleta a Nombre de :</strong></td>
                <td class="auto-style22" colspan="5">
                    <asp:Label ID="lbleboletaa" runat="server" Text="lbleboletaa"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style24"></td>
                <td class="auto-style24"></td>
                <td class="auto-style25" colspan="3"><strong style="font-size: small">Retira Cheque :</strong></td>
                <td class="auto-style25" colspan="5">
                    <asp:Label ID="lblretiracheque" runat="server" Text="lblretiracheque"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style9"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style27" colspan="2">_______________</td>
                <td class="auto-style10"></td>
                <td class="auto-style27" colspan="2">_______________</td>
                <td class="auto-style10"></td>
                <td class="auto-style27" colspan="2">_______________</td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style27" colspan="2"><strong>Vendedor:
                    <asp:Label ID="lblvendedor" runat="server" Text="Label"></asp:Label>
                    </strong></td>
                <td class="auto-style10"></td>
                <td class="auto-style27" colspan="2"><strong>Finanzas</strong></td>
                <td class="auto-style10"></td>
                <td class="auto-style27" colspan="2"><strong>Auditor</strong></td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style9"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td class="auto-style30" colspan="4">La Firma Autoriza solo lo Siguiente:</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style31" colspan="7">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Emitir Boleta nombre de otro beneficiario" Enabled="False" />
                </td>
                <td class="auto-style31" colspan="2">____________</td>
                <td class="auto-style32"></td>
            </tr>
            <tr>
                <td colspan="7" class="auto-style31">
                    <asp:CheckBox ID="cbautopant" runat="server" Text="Autoriza CC Anticipada con Factura sin pago previo" Enabled="False" />
                </td>
                <td colspan="2" class="auto-style31">____________</td>
                <td class="auto-style32"></td>
            </tr>
            <tr>
                <td class="auto-style31" colspan="7">
                    <asp:CheckBox ID="CheckBox3" runat="server" OnCheckedChanged="CheckBox3_CheckedChanged" Text="Autoriza cheque Sin Nominar" Enabled="False" />
                </td>
                <td class="auto-style31" colspan="2">____________</td>
                <td class="auto-style32"></td>
            </tr>
            <tr>
                <td class="auto-style31" colspan="7">
                    <asp:CheckBox ID="CheckBox5" runat="server" OnCheckedChanged="CheckBox3_CheckedChanged" Text="Autoriza Cheque Sin Cruzar" Enabled="False" />
                </td>
                <td class="auto-style31" colspan="2">____________</td>
                <td class="auto-style32"></td>
            </tr>
            <tr>
                <td class="auto-style31" colspan="7">
                    <asp:CheckBox ID="CheckBox4" runat="server" Text="Otros :" Enabled="False" />
                </td>
                <td class="auto-style31" colspan="2">____________</td>
                <td class="auto-style32"></td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="4"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3">Fecha Ingreso a Sistema :</td>
                <td class="auto-style27" colspan="2">
                    <asp:Label ID="lblingreso" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
                <td class="auto-style10"></td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3">Fecha Aprobacion Finanzas:</td>
                <td class="auto-style27" colspan="2">
                    <asp:Label ID="lblfinanzas" runat="server" Text="Pendiente"></asp:Label>
                </td>
                <td class="auto-style10"></td>
                <td class="auto-style36" colspan="2">Nº Cheque :</td>
                <td class="auto-style36" colspan="2">
                    <asp:Label ID="lblCheque" runat="server" Text="Pendiente"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3">Fecha&nbsp; Aprobacion Auditoria :</td>
                <td class="auto-style27" colspan="2">
                    <asp:Label ID="lblauditoria" runat="server" Text="Pendiente"></asp:Label>
                </td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="3">Fecha Finalizacion :</td>
                <td class="auto-style27" colspan="2">
                    <asp:Label ID="lblfinalizacion" runat="server" Text="Pendiente"></asp:Label>
                </td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
            </tr>
            </table>
    </form>
</body>
</html>
