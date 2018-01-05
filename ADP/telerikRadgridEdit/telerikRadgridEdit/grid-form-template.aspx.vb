Imports System.Web.UI.WebControls
Imports Telerik.Web.UI

Partial Class grid_form_template
    Inherits System.Web.UI.Page

    Private LocalCulture = New System.Globalization.CultureInfo("es-AR")

    Protected ReadOnly Property DbContext() As List(Of VacationAgreement)
        Get
            Dim startDate As DateTime
            Dim endDate As DateTime

            If Not listFechaVigencia.SelectedItem Is Nothing Then
                startDate = Convert.ToDateTime(listFechaVigencia.SelectedItem.Text.Split("-")(0), LocalCulture)
                endDate = Convert.ToDateTime(listFechaVigencia.SelectedItem.Text.Split("-")(1), LocalCulture)
            End If

            Return New VacationService().GetVacationAgreement(listCodConv.SelectedValue, startDate, endDate)
        End Get
    End Property

    Protected Sub RadGrid1_NeedDataSource(ByVal source As Object, ByVal e As GridNeedDataSourceEventArgs) Handles GrillaConvenios.NeedDataSource
        GrillaConvenios.DataSource = DbContext
    End Sub

    Protected Sub RadGrid1_ItemDeleted(ByVal source As Object, ByVal e As Telerik.Web.UI.GridDeletedEventArgs) Handles GrillaConvenios.ItemDeleted
        If Not e.Exception Is Nothing Then
            e.ExceptionHandled = True
            DisplayMessage(True, "Employee " + e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("EmployeeID").ToString() + " cannot be deleted. Reason: " + e.Exception.Message)
        Else
            DisplayMessage(False, "Employee " + e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("EmployeeID").ToString() + " deleted")
        End If
    End Sub

    Protected Sub RadGrid1_ItemUpdated(ByVal source As Object, ByVal e As Telerik.Web.UI.GridUpdatedEventArgs) Handles GrillaConvenios.ItemUpdated
        If Not e.Exception Is Nothing Then
            e.KeepInEditMode = True
            e.ExceptionHandled = True
            DisplayMessage(True, "Employee " + e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("EmployeeID").ToString() + " cannot be updated. Reason: " + e.Exception.Message)
        Else
            DisplayMessage(False, "Employee " + e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("EmployeeID").ToString() + " updated")
        End If
    End Sub

    Protected Sub RadGrid1_ItemInserted(ByVal source As Object, ByVal e As Telerik.Web.UI.GridInsertedEventArgs) Handles GrillaConvenios.ItemInserted
        If Not e.Exception Is Nothing Then
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
            DisplayMessage(True, "Employee cannot be inserted. Reason: " + e.Exception.Message)
        Else
            DisplayMessage(False, "Employee inserted")
        End If
    End Sub

    Private Sub DisplayMessage(ByVal isError As Boolean, ByVal text As String)
        Dim label As Label = IIf(isError, Me.Label1, Me.Label2)
        label.Text = text
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'calInicioVigencia.Culture = LocalCulture
        'calFinVigencia.Culture = LocalCulture

        If Not IsPostBack Then

            listCodConv.DataSource = New VacationService().GetVacationAgreementCodes()
            listCodConv.DataValueField = "Key"
            listCodConv.DataTextField = "Value"
            listCodConv.DataBind()

            GetFechasVigenciasVacConf()

            listCodConv.SelectedIndex = 0
            listFechaVigencia.SelectedIndex = 0
        End If

        ScriptManager.ScriptResourceMapping.AddDefinition(
            "jquery",
            New ScriptResourceDefinition With
            {
            .Path = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"
            }
            )
    End Sub

    Private Sub GetFechasVigenciasVacConf()
        listFechaVigencia.DataSource = New VacationService().GetVacationAgreementEffectiveDate(listCodConv.SelectedValue)
        listFechaVigencia.DataTextField = "RangeText"
        listFechaVigencia.DataBind()
    End Sub

    Protected Sub RadGrid1_ItemCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles GrillaConvenios.ItemCommand
        If e.CommandName = RadGrid.InitInsertCommandName Then '"Add new" button clicked

            Dim editColumn As GridEditCommandColumn = CType(GrillaConvenios.MasterTableView.GetColumn("EditCommandColumn"), GridEditCommandColumn)
            editColumn.Visible = False
        ElseIf (e.CommandName = RadGrid.RebindGridCommandName AndAlso e.Item.OwnerTableView.IsItemInserted) Then
            e.Canceled = True
        Else
            Dim editColumn As GridEditCommandColumn = CType(GrillaConvenios.MasterTableView.GetColumn("EditCommandColumn"), GridEditCommandColumn)
            If Not editColumn.Visible Then
                editColumn.Visible = True
            End If

        End If
    End Sub

    Protected Sub RadGrid1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles GrillaConvenios.PreRender
        If (Not Page.IsPostBack) Then
            GrillaConvenios.EditIndexes.Add(0)
            GrillaConvenios.Rebind()
        End If
    End Sub

    Protected Sub GrillaConvenios_InsertCommand(ByVal source As Object, ByVal e As GridCommandEventArgs) Handles GrillaConvenios.InsertCommand
        Dim userControl As UserControl = CType(e.Item.FindControl(GridEditFormItem.EditFormUserControlID), UserControl)

        'Prepare new row to add it in the DataSource
        'Dim newRow As DataRow = Me.Employees.NewRow

        'Insert new values
        Dim newValues As Hashtable = New Hashtable

        newValues("Tramo") = CType(userControl.FindControl("TextBox7"), TextBox).Text
    End Sub
End Class
