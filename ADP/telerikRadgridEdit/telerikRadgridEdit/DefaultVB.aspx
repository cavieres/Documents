<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DefaultVB.aspx.vb" Inherits="telerikRadgridEdit.DefaultVB" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <style>
        #listFechaVigenciaPanel, #calInicioVigenciaPanel, 
        #calFinVigenciaPanel, #btnAgregarFechaVigenciaPanel {
	        display: inline !important;
        }
        
    </style>

</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    
    <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1" DefaultLoadingPanelID="RadAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="GrillaConvenios">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="GrillaConvenios" />
                    <telerik:AjaxUpdatedControl ControlID="RadWindowManager1" />
                    <telerik:AjaxUpdatedControl ControlID="RadInputManager1" />

                    <telerik:AjaxUpdatedControl ControlID="calInicioVigencia" />
                    <telerik:AjaxUpdatedControl ControlID="calFinVigencia" />
                    <telerik:AjaxUpdatedControl ControlID="listFechaVigencia" />
                    <telerik:AjaxUpdatedControl ControlID="btnAgregarFechaVigencia" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="btnAgregarFechaVigencia">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="calInicioVigencia" />
                    <telerik:AjaxUpdatedControl ControlID="calFinVigencia" />
                    <telerik:AjaxUpdatedControl ControlID="listFechaVigencia" />
                    <telerik:AjaxUpdatedControl ControlID="btnAgregarFechaVigencia" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="listFechaVigencia">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="GrillaConvenios" />
                </UpdatedControls>
            </telerik:AjaxSetting>

            <telerik:AjaxSetting AjaxControlID="listCodConv">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="listFechaVigencia" />
                    <telerik:AjaxUpdatedControl ControlID="GrillaConvenios" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" />
    
        <telerik:RadComboBox ID="listCodConv" runat="server" RenderMode="Lightweight" AutoPostBack="true">
        </telerik:RadComboBox>

        <telerik:RadComboBox ID="listFechaVigencia" runat="server" RenderMode="Lightweight" AutoPostBack="true">
        </telerik:RadComboBox>

        <telerik:RadDatePicker ID="calInicioVigencia" runat="server" RenderMode="Lightweight" Calendar-FirstDayOfWeek="Monday" AutoPostBack="true" Visible="false"></telerik:RadDatePicker>
        <telerik:RadDatePicker ID="calFinVigencia" runat="server" RenderMode="Lightweight" Calendar-FirstDayOfWeek="Monday" AutoPostBack="true" Visible="false"></telerik:RadDatePicker>

        <telerik:RadButton ID="btnAgregarFechaVigencia" runat="server" RenderMode="Lightweight" Text="Agregar Fechas" AutoPostBack="true"></telerik:RadButton>

        <telerik:RadGrid RenderMode="Lightweight" runat="server" ID="GrillaConvenios" AutoGenerateColumns="false" AllowPaging="true" PageSize="3">
            <MasterTableView DataKeyNames="Tramo" CommandItemDisplay="Top" InsertItemPageIndexAction="ShowItemOnCurrentPage" 
                NoMasterRecordsText="No hay convenios para la fecha seleccionada.">
                <CommandItemSettings RefreshText="Recargar" AddNewRecordText="Agregar convenio" />
                <EditFormSettings>
                    <EditColumn InsertText="Agregar" CancelText="Cancelar" UpdateText="Modificar"/>
                </EditFormSettings>
                <Columns>
                    <telerik:GridEditCommandColumn EditText="Modificar" />
                    <telerik:GridBoundColumn DataField="CodConv" HeaderText="Product ID" ReadOnly="true"
                        ForceExtractValue="Always" ConvertEmptyStringToNull="true" Visible="false" />
                    <telerik:GridBoundColumn DataField="Tramo" HeaderText="Tramo" />
                    <telerik:GridBoundColumn DataField="Dias" HeaderText="Cantidad de días" />
                    <telerik:GridBoundColumn DataField="TipoDias" HeaderText="Tipo de días" />
                    <telerik:GridDropDownColumn DropDownControlType="DropDownList" UniqueName="listTipoDias" 
                        HeaderText="Tipo de días" Visible="true"/>
                    <telerik:GridBoundColumn DataField="InicioVigencia" Visible="false" ReadOnly="true" Display="false" />
                    <telerik:GridBoundColumn DataField="FinVigencia" Visible="false" ReadOnly="true" Display="false" />
                    <telerik:GridButtonColumn ConfirmText="¿Eliminar este convenio?" ConfirmDialogType="RadWindow"
                        ConfirmTitle="Eliminar Convenio" CommandName="Delete" ButtonType="LinkButton" Text="Eliminar" />
                </Columns>
            </MasterTableView>
            <PagerStyle Mode="NextPrevAndNumeric" ChangePageSizeButtonToolTip="Cambiar tamaño de página" FirstPageToolTip="Primera Página" GoToPageButtonToolTip="Ir a la página" LastPageToolTip="Última Página" NextPagesToolTip="Siguientes Páginas" NextPageToolTip="Siguiente Página" PagerTextFormat="Cambiar p&amp;aacute;gina: {4} &amp;nbsp;P&amp;aacute;gina &lt;strong&gt;{0}&lt;/strong&gt; de &lt;strong&gt;{1}&lt;/strong&gt;, items &lt;strong&gt;{2}&lt;/strong&gt; de &lt;strong&gt;{3}&lt;/strong&gt; de &lt;strong&gt;{5}&lt;/strong&gt;." PageSizeLabelText="Tamaño de página:" PrevPagesToolTip="Páginas Previas" PrevPageToolTip="Página Previa" />
        </telerik:RadGrid>
    
    <telerik:RadInputManager RenderMode="Lightweight" runat="server" ID="RadInputManager1" Enabled="true">
        <telerik:TextBoxSetting BehaviorID="TextBoxSettingTramo">
        </telerik:TextBoxSetting>
        <telerik:TextBoxSetting BehaviorID="TextBoxSettingDias">
        </telerik:TextBoxSetting>
        <telerik:TextBoxSetting BehaviorID="TextBoxSettingTipoDias">
        </telerik:TextBoxSetting>
    </telerik:RadInputManager>
    <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" />
    </form>
</body>
</html>
