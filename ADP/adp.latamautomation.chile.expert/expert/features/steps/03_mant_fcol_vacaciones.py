from behave import when, then

from expert.actions.vacaciones_action import VacacionesAction
from expert.actions.vacaciones_crear_action import VacacionesCrearAction
from expert.data.utils import Utils


@when('busca colaborador para tomar días de vacaciones con código "{codigo}" rut "{rut}" estado "{estado}" nombre '
      '"{nombre}"')
def step_impl(context, codigo, rut, estado, nombre):
    context.vacaciones_action = VacacionesAction()
    context.vacaciones_action.busca_colaborador(codigo, rut, estado, nombre)


@when('elimina todos los días tomados')
def step_impl(context):
    context.vacaciones_action.elimina_todos_dias_tomados()


@when('crear una nueva solicitud de vacaciones de "{rebajas}" con "{ndias}" días y tipc "{tipc}"')
def step_impl(context, rebajas, ndias, tipc):
    context.utils = Utils()
    context.vacaciones_crear_action = VacacionesCrearAction()
    context.fecha_desde = context.utils.get_date()
    context.fecha_hasta, context.nombre_comprobante = context.vacaciones_crear_action.crear(context.fecha_desde, ndias,
                                                                                            tipc,
                                                                                            context.download_folder,
                                                                                            rebajas)


@then('validar nuevo registro de vacaciones de "{rebajas}" con "{ndias}" días y tipc "{tipc}" en tabla de dias tomados')
def step_impl(context, rebajas, ndias, tipc):
    assert context.vacaciones_action.valida(context.fecha_desde, context.fecha_hasta, ndias, tipc, rebajas)


@then('comprobar descarga comprobante de vacaciones')
def step_impl(context):
    assert context.vacaciones_crear_action.comprobar_descarga(context.download_folder, context.nombre_comprobante)
