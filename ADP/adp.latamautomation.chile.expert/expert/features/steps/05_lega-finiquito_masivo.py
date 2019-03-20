from datetime import datetime

from behave import when, then

from expert.actions.finiquito_masivo_action import FiniquitoMasivoAction
from expert.actions.listado_procesos_action import ListadoProcesosAction
from expert.actions.menu_action import MenuAction
from expert.pages.finiquito_masivo_page import FiniquitoMasivoPage
from scriptize.report import report


@when("ir a finiquitos masivos")
def step_impl(context):
    context.menu_action = MenuAction()
    context.menu_action.click_finiquitos_masivos()
    report.write_line("Ir a finiquitos", report.Status.SUCCESS, True)


@when("seleccionar todos los empleados")
def step_impl(context):
    context.finiquito_masivo_page = FiniquitoMasivoPage()
    context.finiquito_masivo_page.click_todos()
    report.write_line("Seleccionar todos los empleados", report.Status.SUCCESS, True)


@when("ingresar fecha finiquito")
def step_impl(context):
    context.finiquito_masivo_action = FiniquitoMasivoAction()
    context.finiquito_masivo_action.ingresar_fecha_finiquito()
    report.write_line("Ingresa Fecha de Finiquito", report.Status.SUCCESS, True)


@when("seleccionar mes ultimo sueldo")
def step_impl(context):
    context.finiquito_masivo_action.ingresar_mes_ultimo_sueldo()
    report.write_line("Ingresa Mes Último Sueldo", report.Status.SUCCESS, True)


@when("seleccionar texto de finiquitos")
def step_impl(context):
    context.finiquito_masivo_page.set_texto_finiquito(0)
    report.write_line("Selecciona Texto de Finiquitos", report.Status.SUCCESS, True)


@when("seleccionar periodo a considerar")
def step_impl(context):
    context.finiquito_masivo_page.set_periodo_a_considerar(0)
    report.write_line("Selecciona el Periodo a Considerar", report.Status.SUCCESS, True)


@when("ingresar descripcion")
def step_impl(context):
    context.fecha_finiquito = datetime.today().strftime("%d-%m-%y - %H:%M:%S")
    context.finiquito_masivo_action.ingresar_descripcion(context.fecha_finiquito)
    report.write_line("Ingresa Descripción del proceso", report.Status.SUCCESS, True)


@when("seleccionar feriado proporcional")
def step_impl(context):
    context.finiquito_masivo_page.check_feriado_proporcional()
    report.write_line("Selecciona Feriado Proporcional", report.Status.SUCCESS, True)


@when("ejecutar finiquitos")
def step_impl(context):
    context.finiquito_masivo_page.click_ejecutar_proceso()
    report.write_line("Se ejecutan los finiquitos", report.Status.SUCCESS, True)


@then("validar generacion de finiquitos")
def step_impl(context):
    listado_procesos_action = ListadoProcesosAction()
    estado_proceso = listado_procesos_action.validar_proceso(context.fecha_finiquito)
    assert estado_proceso == "Listo"
    report.write_line("Se valida la generacion de finiquitos masivos", report.Status.SUCCESS, True)
