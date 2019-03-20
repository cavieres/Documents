from behave import when, then

from expert.data.datos_colaborador import ColaboradorData
from expert.actions.ficha_colaborador_action import FichaColaboradorAction
from expert.actions.finiquito_individual_action import FiniquitoIndividualAction
from expert.pages.finiquito_individual_page import FiniquitoIndividualPage
from expert.pages.menu_page import MenuPage
from scriptize.report import report


@when("ir al finiquito")
def step_impl(context):
    context.ficha_colaborador_action = FichaColaboradorAction()
    context.ficha_colaborador_action.navega_finiquitos()
    report.write_line("Ir a finiquitos", report.Status.SUCCESS, True)


@when("simular finiquito individual con feriado proporcional")
def step_impl(context):
    context.finiquito_individual_action = FiniquitoIndividualAction()
    colaborador_data = ColaboradorData()
    menu_page = MenuPage()
    fecha = menu_page.get_ames().strftime('%d-%m-%Y')
    context.finiquito_individual_action.generate_finiquito(fecha, fecha,
                                                           colaborador_data.motivo, colaborador_data.firma,
                                                           colaborador_data.observacion)
    report.write_line("Simular finiquito individual", report.Status.SUCCESS, True)


@then("validar monto de finiquito individual")
def step_impl(context):
    context.finiquito_individual_page = FiniquitoIndividualPage()
    colaborador_data = ColaboradorData()
    assert context.finiquito_individual_page.get_monto() == colaborador_data.monto_finiquito
