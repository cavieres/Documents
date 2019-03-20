from behave import when, then

from expert.actions.ficha_colaborador_action import FichaColaboradorAction
from expert.actions.liquidaciones_historicas_action import LiquidacionesHistoricasAction


@when("ir a liquidaciones historicas")
def step_impl(context):
    context.ficha_colaborador_action = FichaColaboradorAction()
    context.ficha_colaborador_action.navega_liquidaciones_historicas()


@then("total haberes es identico con detalle haberes")
def step_impl(context):
    context.liquidaciones_historicas_action = LiquidacionesHistoricasAction()
    assert context.liquidaciones_historicas_action.valida_total_haberes()


@then("total descuentos es identico con detalle descuentos")
def step_impl(context):
    context.liquidaciones_historicas_action = LiquidacionesHistoricasAction()
    assert context.liquidaciones_historicas_action.valida_total_descuentos()


@then("reporte liquidaciones historicas creado correctamente")
def step_impl(context):
    context.liquidaciones_historicas_action = LiquidacionesHistoricasAction()
    assert context.liquidaciones_historicas_action.valida_reporte(context.download_folder)
