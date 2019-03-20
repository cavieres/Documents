from behave import when, then

from expert.actions.libro_remuneraciones_action import LibroRemuneracionesAction
from expert.actions.menu_action import MenuAction


@when('abriendo menu "Informes > Legales > Libro de Remuneraciones"')
def step_impl(context):
    context.menu_action = MenuAction()
    context.menu_action.click_libro_remuneraciones()


@when('generando reporte de libro de remuneraciones con selección "{seleccion}" opción "{opcion}" formato "{formato}"')
def step_impl(context, seleccion, opcion, formato):
    context.libro_remuneraciones_action = LibroRemuneracionesAction()
    context.libro_remuneraciones_action.genera_reporte(seleccion, opcion, formato)


@then('validando reporte de libro de remuneraciones con formato "{formato}"')
def step_impl(context, formato):
    context.libro_remuneraciones_action = LibroRemuneracionesAction()
    report_validated = context.libro_remuneraciones_action.valida_reporte(context.download_folder, formato)
    assert report_validated is True
