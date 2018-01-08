<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="defaultvb2.aspx.vb" Inherits="telerikRadgridEdit.defaultvb2" %>

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
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="divMsgs"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecorationZoneID="demo" DecoratedControls="All" EnableRoundedCorners="false" />
    <div id="demo" class="demo-container no-bg">
        <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" CssClass="RadGrid" GridLines="None"
            AllowPaging="True" PageSize="20" AllowSorting="True" AutoGenerateColumns="False"
            ShowStatusBar="true" AllowAutomaticDeletes="True" AllowAutomaticInserts="True"
            AllowAutomaticUpdates="True" DataSourceID="SqlDataSource1">
            <MasterTableView CommandItemDisplay="TopAndBottom" GridLines="None" DataSourceID="SqlDataSource1"
                DataKeyNames="Tramo" AllowFilteringByColumn="False" AllowSorting="True">
                <Columns>
                    <telerik:GridEditCommandColumn UniqueName="EditCommandColumn">
                    </telerik:GridEditCommandColumn>
                   <telerik:GridBoundColumn UniqueName="CodConv" HeaderText="ID" DataField="CodConv">
                        <HeaderStyle Width="70px"></HeaderStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Tramo" HeaderText="TOC" DataField="Tramo">
                        <HeaderStyle Width="80px"></HeaderStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Dias" HeaderText="FirstName" DataField="Dias">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="TipoDias" HeaderText="LastName" DataField="TipoDias">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="IniVigncia" HeaderText="Hire Date" DataField="IniVigncia"
                        DataFormatString="{0:d}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="FinVigncia" HeaderText="Title" DataField="FinVigncia">
                    </telerik:GridBoundColumn>
                    <telerik:GridButtonColumn CommandName="Delete" Text="Delete">
                    </telerik:GridButtonColumn>
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
                                            <td class="title" style="font-weight: bold;" colspan="2">Company Info:</td>
                                        </tr>
                                        <tr>
                                            <td>Country:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("CodConv") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>City:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Tramo") %>' TabIndex="1">
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Region:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Dias") %>' TabIndex="2">
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <b>Personal Info:</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>FirstName:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox2" Text='<%# Bind("TipoDias") %>' runat="server" TabIndex="8">
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Last Name:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox3" Text='<%# Bind("IniVigncia") %>' runat="server" TabIndex="9">
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Birth Date:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox5" Text='<%# Bind("FinVigncia") %>' runat="server" TabIndex="9">
                                                </asp:TextBox>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-0V41I5P\SQLEXPRESS;Database=oraclear;user id=sa;password=sasql"
        SelectCommand="SELECT * FROM rvacsconv">
        
    </asp:SqlDataSource>
    </form>
</body>
</html>