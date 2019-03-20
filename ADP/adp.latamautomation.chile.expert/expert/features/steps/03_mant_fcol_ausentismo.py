import time

from behave import when, then
from expert.data.utils import Utils
from expert.data.datos_ausentismo import Ausentismo
from expert.actions.ausentismos_action import AusentismosAction
from expert.actions.ausentismos_crear_action import AusentismosCrearAction
from expert.actions.buscar_colaborador_action import BuscarColaboradorAction
from expert.actions.ficha_colaborador_action import FichaColaboradorAction
from expert.pages.ausentismos_page import AusentismosPage
from expert.pages.ficha_colaborador_page import FichaColaboradorPage
from scriptize.report import report


@when("seleccionar colaborador activo")
def step_impl(context):
    context.ficha_colaborador_page = FichaColaboradorPage()
    context.ficha_colaborador_page.click_buscar()
    context.buscar_colaborador_action = BuscarColaboradorAction()
    context.buscar_colaborador_action.acceso_estado("A")


@when('crear ausentismo con el tipo "{tipo}" para colaborador activo')
def step_impl(context, tipo):
    context.ficha_colaborador_action = FichaColaboradorAction()
    context.ficha_colaborador_action.navega_ausentismo()
    context.ausentismos_page = AusentismosPage()
    utils = Utils()
    time.sleep(1)
    fecha_licencia = context.ausentismos_page.get_fecha_licencia()
    if fecha_licencia != "":
        ausentismo_action = AusentismosAction()
        context.new_date = ausentismo_action.anadir_dias(fecha_licencia, context.ausentismos_page.get_dias())
    else:
        context.new_date = utils.get_date()
    context.ausentismos_page.click_crear()
    context.ausentismos_crear_action = AusentismosCrearAction()
    context.number1 = str(utils.random_digits(9))
    ausentismo_data = Ausentismo()
    context.ausentismos_crear_action.set_datos_del_ausentismo(context.number1, tipo, context.new_date,
                                                              ausentismo_data.cant_dias, ausentismo_data.me_dia,
                                                              ausentismo_data.causa, ausentismo_data.detalle,
                                                              ausentismo_data.afe_remu, ausentismo_data.es_con)
    plus = 0
    while context.ausentismos_crear_action.click_ok_and_check():
        plus += 73
        context.number1 = str(utils.random_digits(9))
        context.ausentismos_crear_action.set_datos_del_ausentismo(context.number1, tipo,
                                                                  utils.plus_days(context.new_date, plus),
                                                                  ausentismo_data.cant_dias, ausentismo_data.me_dia,
                                                                  ausentismo_data.causa, ausentismo_data.detalle,
                                                                  ausentismo_data.afe_remu, ausentismo_data.es_con)


@then("validar creacion de ausentismo")
def step_impl(context):
    time.sleep(1)
    try:
        ausentismo_action = AusentismosAction()
        assert ausentismo_action.check_ausentismo_creado(context.number1)
        report.write_line("Creación de ausentismo Exitosa", report.Status.SUCCESS, True)
    except AssertionError:
        report.write_line("Creación de ausentismo Fallida", report.Status.WARNING, False)
