from behave import when, then
from scriptize.report import report

from expert.actions.menu_action import MenuAction
from expert.actions.resumen_del_proceso_action import ResumenDelProcesoAction
from expert.pages.resumen_del_proceso_page import ResumenDelProcesoPage


@when("ir a resumen del proceso")
def step_impl(context):
    context.menu_action = MenuAction()
    context.menu_action.click_resumen_del_proceso()


@when("ejecutar resumen del proceso")
def step_impl(context):
    context.resumen_del_proceso_action = ResumenDelProcesoAction()
    context.resumen_del_proceso_action.generate_resumen_proceso()


@then("validar página resumen del proceso")
def step_impl(context):
    context.resumen_del_proceso_page = ResumenDelProcesoPage()
    try:
        assert (context.resumen_del_proceso_page.is_archivo_pdf(context.download_folder))
        report.write_line("Descarga liquidación en PDF correcta", report.Status.SUCCESS, True)
    except AssertionError:
        report.write_line("Error - Resumen del Proceso", report.Status.DANGER, True)
