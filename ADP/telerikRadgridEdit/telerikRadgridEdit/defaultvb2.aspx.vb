Imports Telerik.Web.UI

Public Class defaultvb2
    Inherits System.Web.UI.Page

    Protected Sub RadGrid1_ItemDeleted(ByVal source As Object, ByVal e As Telerik.Web.UI.GridDeletedEventArgs) Handles RadGrid1.ItemDeleted
        If Not e.Exception Is Nothing Then
            e.ExceptionHandled = True
            DisplayMessage(True, "Employee " + e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("EmployeeID").ToString() + " cannot be deleted. Reason: " + e.Exception.Message)
        Else
            DisplayMessage(False, "Employee " + e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("EmployeeID").ToString() + " deleted")
        End If
    End Sub

    Protected Sub RadGrid1_ItemUpdated(ByVal source As Object, ByVal e As Telerik.Web.UI.GridUpdatedEventArgs) Handles RadGrid1.ItemUpdated
        If Not e.Exception Is Nothing Then
            e.KeepInEditMode = True
            e.ExceptionHandled = True
            DisplayMessage(True, "Employee " + e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("EmployeeID").ToString() + " cannot be updated. Reason: " + e.Exception.Message)
        Else
            DisplayMessage(False, "Employee " + e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("EmployeeID").ToString() + " updated")
        End If
    End Sub

    Protected Sub RadGrid1_ItemInserted(ByVal source As Object, ByVal e As Telerik.Web.UI.GridInsertedEventArgs) Handles RadGrid1.ItemInserted
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
    End Sub

    Protected Sub RadGrid1_ItemCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.ItemCommand
        If e.CommandName = RadGrid.InitInsertCommandName Then '"Add new" button clicked

            Dim editColumn As GridEditCommandColumn = CType(RadGrid1.MasterTableView.GetColumn("EditCommandColumn"), GridEditCommandColumn)
            editColumn.Visible = False
        ElseIf (e.CommandName = RadGrid.RebindGridCommandName AndAlso e.Item.OwnerTableView.IsItemInserted) Then
            e.Canceled = True
        Else
            Dim editColumn As GridEditCommandColumn = CType(RadGrid1.MasterTableView.GetColumn("EditCommandColumn"), GridEditCommandColumn)
            If Not editColumn.Visible Then
                editColumn.Visible = True
            End If

        End If

        Select Case e.CommandName
            Case RadGrid.UpdateCommandName
                e.Item.Edit = False
            Case RadGrid.PerformInsertCommandName
                e.Item.Display = False
        End Select


    End Sub

    Protected Sub RadGrid1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadGrid1.PreRender
        If (Not Page.IsPostBack) Then
            RadGrid1.EditIndexes.Add(0)
            RadGrid1.Rebind()
        End If
    End Sub
End Class