from behave import when, then

from expert.data.datos_emision_liquidacion_historicas import EmiLiqHisData
from expert.actions.emision_liquidacion_historicas_action import EmisionLiquidacionHistoricasAction
from expert.actions.menu_action import MenuAction
from scriptize.report import report


@when("ir a emision de liquidacion historicas")
def step_impl(context):
    context.menu_action = MenuAction()
    context.menu_action.click_emision_liquidacion_historicas()
    report.write_line("Ir a emision liquidacion historicas", report.Status.SUCCESS, True)


@when("generar liquidacion historicas")
def step_impl(context):
    context.emision_liquidacion_historicas = EmisionLiquidacionHistoricasAction()
    emiLiqHis_data = EmiLiqHisData()
    context.emision_liquidacion_historicas.ejecutar_liquidacion_historicas(emiLiqHis_data.periodo,
                                                                           emiLiqHis_data.empresa,
                                                                           emiLiqHis_data.ordenamiento)
    report.write_line("Generar liquidacion historicas", report.Status.SUCCESS, True)


@then("comprobar descarga PDF")
def step_impl(context):
    try:
        assert (context.emision_liquidacion_historicas.comprobar_descarga_PDF(context.download_folder))
        report.write_line("Descarga exitosa PDF", report.Status.SUCCESS, True)
    except AssertionError:
        report.write_line("Descarga fallida PDF", report.Status.WARNING, False)
