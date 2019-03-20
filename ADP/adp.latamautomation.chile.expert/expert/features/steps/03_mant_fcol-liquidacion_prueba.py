from behave import when, then

from expert.data.datos_colaborador import ColaboradorData
from expert.actions.buscar_colaborador_action import BuscarColaboradorAction
from expert.actions.ficha_colaborador_action import FichaColaboradorAction
from expert.actions.menu_action import MenuAction
from expert.pages.ficha_colaborador_page import FichaColaboradorPage
from expert.pages.liquidacion_prueba_page import LiquidacionPruebaPage


@when("ir a la ficha del colaborador")
def step_impl(context):
    context.menu_action = MenuAction()
    context.menu_action.click_ficha_colaborador()


@when("click en buscar")
def step_impl(context):
    context.ficha_colaborador_page = FichaColaboradorPage()
    context.ficha_colaborador_page.click_buscar()


@when("seleccionar colaborador")
def step_impl(context):
    colaborador_data = ColaboradorData()
    context.buscar_colaborador_action = BuscarColaboradorAction()
    context.buscar_colaborador_action.get_colaborador_por_codigo(colaborador_data.employee1, colaborador_data.estado1)


@when("ir a liquidacion de prueba")
def step_impl(context):
    context.ficha_colaborador_action = FichaColaboradorAction()
    context.ficha_colaborador_action.navega_liquidacion_prueba()


@then("validar monto a pagar")
def step_impl(context):
    context.liquidacion_prueba_page = LiquidacionPruebaPage()
    colaborador_data = ColaboradorData()
    assert context.liquidacion_prueba_page.get_monto() == colaborador_data.monto
