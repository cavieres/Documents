import shutil

from behave import when, then

from expert.actions.solicitudes_action import SolicitudesAction
from expert.pages.solicitudes_page import SolicitudesPage
from scriptize.report import report


@when("ir a liquidaciones")
def step_impl(context):
    context.solicitudes_action = SolicitudesAction()
    context.solicitudes_action.go_liquidaciones()


@when("bajar archivo pdf")
def step_impl(context):
    context.solicitudes_action.download_PDF()
    report.write_line("Bajar liquidación en PDF", report.Status.SUCCESS, True)


@then("validar descarga liquidacion")
def step_impl(context):
    context.solicitudes_page = SolicitudesPage()
    try:
        report.write_line("Validar la descarga liquidación en PDF", report.Status.SUCCESS, True)
        assert (context.solicitudes_page.is_archivo_pdf(context.download_folder))
        report.write_line("Descarga liquidación en PDF correcta", report.Status.SUCCESS, True)
    except AssertionError:
        report.write_line("Error!!!", report.Status.DANGER, True)
    finally:
        shutil.rmtree(context.download_folder)
