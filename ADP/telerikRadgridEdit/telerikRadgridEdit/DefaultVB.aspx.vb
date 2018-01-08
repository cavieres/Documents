Imports Telerik.Web.UI

Public Class DefaultVB
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

    Protected Sub RadGrid1_EditCommand(ByVal source As Object, ByVal e As GridCommandEventArgs) Handles GrillaConvenios.EditCommand
        Dim editableItem = (DirectCast(e.Item, GridEditableItem))

        ViewState("TramoIdPrevious") = DirectCast(editableItem.GetDataKeyValue("Tramo"), Integer)
    End Sub

    Protected Sub RadGrid1_UpdateCommand(ByVal source As Object, ByVal e As GridCommandEventArgs) Handles GrillaConvenios.UpdateCommand
        Dim editableItem = (DirectCast(e.Item, GridEditableItem))

        'Dim tramoIdSelected = DirectCast(editableItem.GetDataKeyValue("Tramo"), Integer)
        Dim tramoIdPrevious = ViewState("TramoIdPrevious")

        ' Get vacation configuration modified.
        Dim convenioVac = DbContext.Where(Function(n) n.Tramo = tramoIdPrevious).FirstOrDefault()


        If convenioVac IsNot Nothing Then
            'update entity's state
            editableItem.UpdateValues(convenioVac)

            Try
                'save chanages to Db
                Dim service = New VacationService()
                service.UpdateVacationAgreement(convenioVac.CodConv, tramoIdPrevious, convenioVac)
            Catch generatedExceptionName As System.Exception
                ShowErrorMessage()
            End Try
        End If
    End Sub

    ''' <summary>
    ''' Shows a <see cref="RadWindow"/> alert if an error occurs
    ''' </summary>
    Private Sub ShowErrorMessage()
        RadAjaxManager1.ResponseScripts.Add(String.Format("window.radalert(""Por favor, ingrese informacion correcta."")"))
    End Sub

    Protected Sub RadGrid1_ItemCreated(ByVal sender As Object, ByVal e As GridItemEventArgs) Handles GrillaConvenios.ItemCreated
        If TypeOf e.Item Is GridEditableItem AndAlso (e.Item.IsInEditMode) Then
            Dim editableItem As GridEditableItem = DirectCast(e.Item, GridEditableItem)
            SetupInputManager(editableItem)
        End If
    End Sub

    Private Sub SetupInputManager(ByVal editableItem As GridEditableItem)
        ' style and set ProductName column's textbox as required
        Dim textBox = (DirectCast(editableItem.EditManager.GetColumnEditor("Tramo"), GridTextBoxColumnEditor)).TextBoxControl

        Dim inputSetting As InputSetting = RadInputManager1.GetSettingByBehaviorID("TextBoxSettingTramo")
        inputSetting.TargetControls.Add(New TargetInput(textBox.UniqueID, True))
        inputSetting.InitializeOnClient = True
        inputSetting.Validation.IsRequired = True

        ' style UnitPrice column's textbox 
        textBox = (DirectCast(editableItem.EditManager.GetColumnEditor("Dias"), GridTextBoxColumnEditor)).TextBoxControl

        inputSetting = RadInputManager1.GetSettingByBehaviorID("TextBoxSettingDias")
        inputSetting.InitializeOnClient = True
        inputSetting.TargetControls.Add(New TargetInput(textBox.UniqueID, True))

        '' style UnitsInStock column's textbox 
        textBox = (DirectCast(editableItem.EditManager.GetColumnEditor("TipoDias"), GridTextBoxColumnEditor)).TextBoxControl
        'Dim combo = (DirectCast(editableItem.EditManager.GetColumnEditor("listTipoDias"), GridDropDownColumnEditor)).TemplateControl


        inputSetting = RadInputManager1.GetSettingByBehaviorID("TextBoxSettingTipoDias")
        inputSetting.InitializeOnClient = True
        inputSetting.TargetControls.Add(New TargetInput(textBox.UniqueID, True))
        'inputSetting.TargetControls.Add(New TargetInput(combo.UniqueID, True))
    End Sub

    Protected Sub RadGrid1_InsertCommand(ByVal source As Object, ByVal e As GridCommandEventArgs) Handles GrillaConvenios.InsertCommand
        Dim editableItem = (DirectCast(e.Item, GridEditableItem))
        'create new entity
        Dim convenioVac As New VacationAgreement

        'populate its properties
        Dim values As New Hashtable()
        editableItem.ExtractValues(values)

        convenioVac.CodConv = listCodConv.SelectedValue

        If values("Tramo") IsNot Nothing Then
            convenioVac.Tramo = Integer.Parse(values("Tramo").ToString())
        End If

        If values("Dias") IsNot Nothing Then
            convenioVac.Dias = Integer.Parse(values("Dias").ToString())
        End If

        If values("TipoDias") IsNot Nothing Then
            convenioVac.TipoDias = Integer.Parse(values("TipoDias").ToString())
        End If

        Dim startDate As DateTime
        Dim endDate As DateTime

        Select Case btnAgregarFechaVigencia.Text
            Case "Agregar Fechas"
                ' Adding vacation agreement with EXISTING date range.
                If listFechaVigencia.SelectedItem Is Nothing Then
                    RadAjaxManager1.ResponseScripts.Add(String.Format("window.radalert(""No es posible crear convenio vacaciones: No hay fecha vigencia seleccionada."")"))
                    Return
                Else
                    startDate = Convert.ToDateTime(listFechaVigencia.SelectedItem.Text.Split("-")(0), LocalCulture)
                    endDate = Convert.ToDateTime(listFechaVigencia.SelectedItem.Text.Split("-")(1), LocalCulture)
                End If
            Case "Cancelar"
                ' Adding vacation agreement with NEW date range.
                If calInicioVigencia.SelectedDate Is Nothing Or calFinVigencia.SelectedDate Is Nothing Then
                    RadAjaxManager1.ResponseScripts.Add(String.Format("window.radalert(""No es posible crear convenio vacaciones: No hay fecha vigencia seleccionada."")"))
                    Return
                Else
                    startDate = calInicioVigencia.SelectedDate
                    endDate = calFinVigencia.SelectedDate
                End If

                Dim rangosFechasSolapados = (From fechaVigencia In New VacationService().GetVacationAgreementEffectiveDate(listCodConv.SelectedValue)
                                             Where (DateTime.Compare(startDate, fechaVigencia.StartDate) >= 0 And DateTime.Compare(endDate, fechaVigencia.EndDate) <= 0) Or
                                                 (DateTime.Compare(startDate, fechaVigencia.StartDate) <= 0 And DateTime.Compare(endDate, fechaVigencia.StartDate) >= 0) Or
                                                 (DateTime.Compare(startDate, fechaVigencia.EndDate) <= 0 And DateTime.Compare(endDate, fechaVigencia.EndDate) >= 0) Or
                                                 DateTime.Compare(startDate, endDate) = 0 Or
                                                 DateTime.Compare(startDate, endDate) > 0
                                             Select fechaVigencia).Count()

                If rangosFechasSolapados > 0 Then
                    RadAjaxManager1.ResponseScripts.Add(String.Format("window.radalert(""No es posible crear convenio vacaciones: Rangos de fechas vigencia estan solapados con los existentes."")"))
                    Return
                End If
        End Select

        convenioVac.InicioVigencia = startDate
        convenioVac.FinVigencia = endDate

        Try
            'save chanages to Db
            Dim service = New VacationService()
            service.SetVacationAgreement(convenioVac)

        Catch generatedExceptionName As System.Exception
            ShowErrorMessage()
        End Try

        EnableAddDateControls(False)

        GetFechasVigenciasVacConf()

        ' Select effective date list (created) in drop down list.
        listFechaVigencia.SelectedIndex = listFechaVigencia.FindItemIndexByText(
            startDate.ToString("dd/MM/yyyy", LocalCulture) + " - " + endDate.ToString("dd/MM/yyyy", LocalCulture))

    End Sub

    Protected Sub RadGrid1_DeleteCommand(ByVal source As Object, ByVal e As GridCommandEventArgs) Handles GrillaConvenios.DeleteCommand

        Dim convenioId = Convert.ToInt32(listCodConv.SelectedValue)
        Dim tramoId = DirectCast((DirectCast(e.Item, GridDataItem)).GetDataKeyValue("Tramo"), Integer)

        'retrive entity form the Db
        Dim agreementToDelete = DbContext.Where(Function(n) n.Tramo = tramoId).FirstOrDefault()
        If agreementToDelete IsNot Nothing Then

            Try
                'save chanages to Db
                Dim service = New VacationService()
                service.DeleteVacationAgreement(convenioId, tramoId)
            Catch generatedExceptionName As System.Exception
                ShowErrorMessage()
            End Try
        End If
    End Sub

    Protected Sub listCodConv_SelectedIndexChanged() Handles listCodConv.SelectedIndexChanged
        GetFechasVigenciasVacConf()

        GrillaConvenios.DataSource = DbContext()
        GrillaConvenios.DataBind()
    End Sub

    Protected Sub listFechaVigencia_SelectedIndexChanged() Handles listFechaVigencia.SelectedIndexChanged
        GrillaConvenios.DataSource = DbContext()
        GrillaConvenios.DataBind()
    End Sub

    Private Sub GetFechasVigenciasVacConf()
        listFechaVigencia.DataSource = New VacationService().GetVacationAgreementEffectiveDate(listCodConv.SelectedValue)
        listFechaVigencia.DataTextField = "RangeText"
        listFechaVigencia.DataBind()
    End Sub

    Private Sub EnableAddDateControls(ByVal enable As Boolean)
        calInicioVigencia.Visible = enable
        calFinVigencia.Visible = enable
        listFechaVigencia.Visible = Not enable
        btnAgregarFechaVigencia.Text = IIf(enable, "Cancelar", "Agregar Fechas")
    End Sub

    Protected Sub btnAgregarFechaVigencia_Click() Handles btnAgregarFechaVigencia.Click

        Select Case btnAgregarFechaVigencia.Text
            Case "Agregar Fechas"
                EnableAddDateControls(True)
            Case "Cancelar"
                EnableAddDateControls(False)
        End Select

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        calInicioVigencia.Culture = LocalCulture
        calFinVigencia.Culture = LocalCulture

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

    Protected Sub GrillaConvenios_ItemDataBound(ByVal sender As Object, ByVal e As GridItemEventArgs) Handles GrillaConvenios.ItemDataBound
        If (TypeOf e.Item Is GridEditableItem AndAlso CType(e.Item, GridEditableItem).IsInEditMode) Then
            Dim editedItem As GridEditableItem = CType(e.Item, GridEditableItem)
            Dim editMan As GridEditManager = editedItem.EditManager
            Dim editor As GridDropDownListColumnEditor = CType(editMan.GetColumnEditor("listTipoDias"), GridDropDownListColumnEditor)
            editor.ComboBoxControl.AppendDataBoundItems = True

            editor.DataSource = New VacationService().GetVacationAgreementDayTypes()
            editor.DataValueField = "Key"
            editor.DataTextField = "Value"
            editor.DataBind()

            '    'editor.ComboBoxControl.Items.Insert(0, New RadComboBoxItem("-Select-", "-select-"))
            editor.SelectedValue = DataBinder.Eval(e.Item.DataItem, "TipoDias").ToString()
        End If

        If TypeOf e.Item Is GridDataItem AndAlso Not e.Item.IsInEditMode Then
            Dim item As GridDataItem = DirectCast(e.Item, GridDataItem)
            'Dim row As DataRowView = DirectCast(e.Item.DataItem, DataRowView)
            'item("listTipoDias").Text = row("TipoDias").ToString()
            Dim vacationAgreementSelected = DirectCast(e.Item.DataItem, VacationAgreement)
            item("listTipoDias").Text = vacationAgreementSelected.TipoDias
        End If
    End Sub

End Class