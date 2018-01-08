Public Class VacationService
    Public Function GetVacationAgreement(ByVal codConv As Integer, ByVal inicioVigencia As Date, ByVal finVigencia As Date) As List(Of VacationAgreement)
        Return New VacationRepository("Data Source=DESKTOP-0V41I5P\SQLEXPRESS;Database=oraclear;user id=sa;password=sasql").GetVacationAgreement(codConv, inicioVigencia, finVigencia)
    End Function

    Public Function SetVacationAgreement(ByVal vacationConfig As VacationAgreement) As Integer
        Dim repo = New VacationRepository("Data Source=DESKTOP-0V41I5P\SQLEXPRESS;Database=oraclear;user id=sa;password=sasql")

        Return repo.SetVacationAgreement(vacationConfig)
    End Function

    Public Function UpdateVacationAgreement(ByVal codConv As Integer, ByVal tramo As Integer, ByVal vacationConfig As VacationAgreement) As Integer
        Dim repo = New VacationRepository("Data Source=DESKTOP-0V41I5P\SQLEXPRESS;Database=oraclear;user id=sa;password=sasql")

        Return repo.UpdateVacationAgreement(codConv, tramo, vacationConfig)
    End Function

    Public Function DeleteVacationAgreement(ByVal codConv As Integer, ByVal tramo As Integer) As Integer
        Dim repo = New VacationRepository("Data Source=DESKTOP-0V41I5P\SQLEXPRESS;Database=oraclear;user id=sa;password=sasql")

        Return repo.DeleteVacationAgreement(codConv, tramo)
    End Function

    Public Function GetVacationAgreementEffectiveDate(ByVal codConv As Integer) As List(Of VacationAgreementEffectiveDate)
        Dim repo = New VacationRepository("Data Source=DESKTOP-0V41I5P\SQLEXPRESS;Database=oraclear;user id=sa;password=sasql")

        Return repo.GetVacationAgreementEffectiveDate(codConv)
    End Function

    Public Function GetVacationAgreementCodes() As Dictionary(Of Integer, String)
        Dim repo = New VacationRepository("Data Source=DESKTOP-0V41I5P\SQLEXPRESS;Database=fitar;user id=sa;password=sasql")

        Return repo.GetVacationAgreementCodes()
    End Function

    Public Function GetVacationAgreementDayTypes() As Dictionary(Of Integer, String)
        Dim repo = New VacationRepository("Data Source=DESKTOP-0V41I5P\SQLEXPRESS;Database=fitar;user id=sa;password=sasql")

        Return repo.GetVacationAgreementDayTypes()
    End Function
End Class
