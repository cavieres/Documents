<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="grid-form-template.aspx.vb" Inherits="telerikRadgridEdit.grid_form_template" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns='http://www.w3.org/1999/xhtml'>
<head runat="server">
    <title>Telerik ASP.NET Example</title>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
    <p id="divMsgs" runat="server">
        <asp:Label ID="Label1" runat="server" EnableViewState="False" Font-Bold="True" ForeColor="#FF8080"></asp:Label>
        <asp:Label ID="Label2" runat="server" EnableViewState="False" Font-Bold="True" ForeColor="#00C000"></asp:Label>
    </p>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" DefaultLoadingPanelID="RadAjaxLoadingPanel1" ClientIDMode="Static">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="GrillaConvenios">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="GrillaConvenios"/>
                    <telerik:AjaxUpdatedControl ControlID="divMsgs"/>
                    <telerik:AjaxUpdatedControl ControlID="RadInputManager1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecorationZoneID="demo" DecoratedControls="All" EnableRoundedCorners="false" />
    <div id="demo" class="demo-container no-bg">

        <telerik:RadComboBox ID="listCodConv" runat="server" RenderMode="Lightweight" AutoPostBack="true">
        </telerik:RadComboBox>

        <telerik:RadComboBox ID="listFechaVigencia" runat="server" RenderMode="Lightweight" AutoPostBack="true">
        </telerik:RadComboBox>


        <telerik:RadGrid RenderMode="Lightweight" ID="GrillaConvenios" runat="server" CssClass="RadGrid" GridLines="None"
            AllowPaging="True" PageSize="3" AllowSorting="True" AutoGenerateColumns="False"
            ShowStatusBar="true">
            <MasterTableView CommandItemDisplay="TopAndBottom" GridLines="None"
                DataKeyNames="Tramo" AllowFilteringByColumn="False" AllowSorting="True">
                <Columns>
                    <telerik:GridEditCommandColumn EditText="Modificar" UniqueName="EditCommandColumn" />
                    <telerik:GridBoundColumn DataField="CodConv" HeaderText="Product ID" ReadOnly="true"
                        ForceExtractValue="Always" ConvertEmptyStringToNull="true" Visible="false" />
                    <telerik:GridBoundColumn DataField="Tramo" HeaderText="Tramo" />
                    <telerik:GridBoundColumn DataField="Dias" HeaderText="Cantidad de días" />
                    <telerik:GridBoundColumn DataField="TipoDias" HeaderText="Tipo de días" />
                    <telerik:GridBoundColumn DataField="InicioVigencia" Visible="false" ReadOnly="true" Display="false" />
                    <telerik:GridBoundColumn DataField="FinVigencia" Visible="false" ReadOnly="true" Display="false" />
                    <telerik:GridButtonColumn ConfirmText="¿Eliminar este convenio?" ConfirmDialogType="RadWindow"
                        ConfirmTitle="Eliminar Convenio" CommandName="Delete" ButtonType="LinkButton" Text="Eliminar" />
                </Columns>
                <EditFormSettings EditFormType="Template">
                    <FormTemplate>
                        <table id="Table2" cellspacing="2" cellpadding="1" width="100%" border="0" rules="none"
                            style="border-collapse: collapse;">
                            <tr class="EditFormHeader">
                                <td colspan="2">
                                    <b>Employee Details</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="Table3" width="450px" border="0" class="module">
                                        <tr>
                                            <td>Tramo:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtTramo" runat="server" Text='<%# Bind("Tramo") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Cantidad de días:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDias" runat="server" Text='<%# Bind("Dias") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Tipo de días:
                                            </td>
                                            <td>
                                                <asp:DropDownList OnInit="ddlTipoDias_Init" ID="ddlTipoDias" runat="server" SelectedValue='<%# Bind("TipoDias") %>'
                                                    DataSourceID="sqlDs" TabIndex="7" DataTextField="Descrip" DataValueField="Codigo"
                                                    AppendDataBoundItems="True">
                                                    <asp:ListItem Selected="True" Text="Seleccione" Value="">
                                                    </asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        
                                    </table>
                                </td>
                                
                            </tr>
                            <tr>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="btnUpdate" Text='<%# IIf((TypeOf(Container) is GridEditFormInsertItem), "Insert", "Update") %>'
                                        runat="server" CommandName='<%# IIf((TypeOf(Container) is GridEditFormInsertItem), "PerformInsert", "Update")%>'></asp:Button>&nbsp;
                                    <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                                        CommandName="Cancel"></asp:Button>
                                </td>
                            </tr>
                        </table>
                    </FormTemplate>
                </EditFormSettings>
            </MasterTableView>
            <ClientSettings>
                <ClientEvents OnRowDblClick="RowDblClick"></ClientEvents>
            </ClientSettings>
        </telerik:RadGrid>
    </div>
    
        <asp:SqlDataSource ID="sqlDs" runat="server" DataSourceMode="DataSet">
        </asp:SqlDataSource>  

        <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" />
    </form>
</body>
</html>
