Imports System.Data.SqlClient

Public Class VacationRepository
    Inherits PayRollFramework.DataAccess.Base.DBManager

    Public Sub New(ByVal conn As String)
        MyBase.New("System.Data.SqlClient", conn)
    End Sub

    Private Culture = New System.Globalization.CultureInfo("es-AR")

    Public Function GetVacationAgreement(ByVal codConv As Integer, ByVal inicioVigencia As Date, ByVal finVigencia As Date) As List(Of VacationAgreement)
        Dim sql = String.Format("SELECT CodConv, Tramo, Dias, TipoDias, IniVigncia, FinVigncia " &
                                "FROM RVACSCONV WHERE CodConv = {0} AND IniVigncia = '{1}' AND FinVigncia = '{2}'",
                                codConv, inicioVigencia.ToString("yyyy-MM-dd", Culture), finVigencia.ToString("yyyy-MM-dd", Culture))
        Dim res As DataTable
        Try
            res = ExecuteDataSet(sql).Tables(0)
        Catch ex As Exception
            Return New List(Of VacationAgreement)
        End Try

        Dim vacationConf As New List(Of VacationAgreement)

        vacationConf = AutoMapper.Mapper.DynamicMap(Of IDataReader, List(Of VacationAgreement))(res.CreateDataReader)

        Return vacationConf
    End Function

    Public Function SetVacationAgreement(ByVal vacationConfig As VacationAgreement) As Integer
        Dim sql = String.Format("INSERT INTO RVACSCONV VALUES('{0}', '{1}', '{2}', '{3}', '{4}', '{5}', '{6}')",
                                vacationConfig.CodConv, vacationConfig.Tramo, vacationConfig.Dias, vacationConfig.TipoDias,
                                vacationConfig.InicioVigencia.ToString("yyyy-MM-dd", Culture),
                                vacationConfig.FinVigencia.ToString("yyyy-MM-dd", Culture), 0)

        Return ExecuteNonQuery(sql)
    End Function

    Public Function UpdateVacationAgreement(ByVal codConv As Integer, ByVal tramo As Integer, ByVal vacationConfig As VacationAgreement) As Integer
        Dim sql = String.Format("UPDATE RVACSCONV SET Tramo = '{0}', Dias = '{1}', TipoDias = '{2}' " &
                                "WHERE CodConv = '{3}' AND Tramo = '{4}'",
                                vacationConfig.Tramo, vacationConfig.Dias, vacationConfig.TipoDias,
                                codConv, tramo)

        Return ExecuteNonQuery(sql)
    End Function

    Public Function DeleteVacationAgreement(ByVal codConv As Integer, ByVal tramo As Integer) As Integer
        Dim sql = String.Format("DELETE FROM RVACSCONV WHERE CodConv = '{0}' AND Tramo = '{1}'", codConv, tramo)

        Return ExecuteNonQuery(sql)
    End Function

    Public Function GetVacationAgreementEffectiveDate(ByVal codConv As Integer) As List(Of VacationAgreementEffectiveDate)
        Dim sql = String.Format("SELECT IniVigncia, FinVigncia, CONVERT(VARCHAR, IniVigncia, 103) + ' - ' + " &
                                "CONVERT(VARCHAR, FinVigncia, 103) AS rangoVigencia FROM RVACSCONV WHERE CodConv = {0}" &
                                "GROUP BY CONVERT(VARCHAR, IniVigncia, 103) + ' - ' + CONVERT(VARCHAR, FinVigncia, 103), IniVigncia, FinVigncia",
                                codConv)

        Dim fechasVigencia = (From fechaVigencia In ExecuteDataSet(sql).Tables(0)
                              Select New VacationAgreementEffectiveDate With {
                                  .StartDate = fechaVigencia("IniVigncia"),
                                  .EndDate = fechaVigencia("IniVigncia"),
                                  .RangeText = Convert.ToString(fechaVigencia("rangoVigencia"))
                                  }).ToList()

        Return fechasVigencia
    End Function

    Public Function GetVacationAgreementCodes() As Dictionary(Of Integer, String)
        Dim sql = String.Format("SELECT Codigo, CONVERT(VARCHAR, Codigo) + ' - ' + Descrip AS Text from RTABLAS " &
                                "where Cotab = 3 and Codigo <> 0 ORDER By Codigo")

        Dim convenios = (From convenio In ExecuteDataSet(sql).Tables(0)
                         Select convenio).ToDictionary(Of Integer, String)(Function(x) x("Codigo"), Function(x) x("Text"))


        Return convenios
    End Function

    Public Function GetVacationAgreementDayTypes() As Dictionary(Of Integer, String)
        Dim sql = String.Format("SELECT Codigo, Descrip from RTABLAS " &
                                "where Cotab = 4 and Codigo <> 0 ORDER By Codigo")

        Dim convenios = (From convenio In ExecuteDataSet(sql).Tables(0)
                         Select convenio).ToDictionary(Of Integer, String)(Function(x) x("Codigo"), Function(x) x("Descrip"))


        Return convenios
    End Function

End Class
