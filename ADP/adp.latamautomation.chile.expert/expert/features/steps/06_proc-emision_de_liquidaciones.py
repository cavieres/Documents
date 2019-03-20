from datetime import datetime

from behave import when, then

from expert.actions.emision_de_liquidaciones_action import EmisionDeLiquidacionesAction
from expert.actions.menu_action import MenuAction
from expert.data.datos_emision_liquidaciones import EmisionDeLiquidacionesData


@when("ir a emision de liquidaciones")
def step_impl(context):
    context.menu_action = MenuAction()
    context.menu_action.click_emision_de_liquidaciones()


@when("ejecutar proceso emision de liquidaciones")
def step_impl(context):
    context.emision_de_liquidaciones_action = EmisionDeLiquidacionesAction()
    context.emision_de_liquidaciones_data = EmisionDeLiquidacionesData()
    context.descripcion = datetime.today().strftime("%d-%m-%y - %H:%M:%S")
    context.emision_de_liquidaciones_action.run_emision_de_liquidaciones(context.emision_de_liquidaciones_data.
                                                                         fecha_de_pago, context.descripcion)


@then("validar la emision de liquidaciones")
def step_impl(context):
    assert context.emision_de_liquidaciones_action.valida(context.descripcion, context.
                                                          emision_de_liquidaciones_data.avance,
                                                          context.emision_de_liquidaciones_data.estado) is True
