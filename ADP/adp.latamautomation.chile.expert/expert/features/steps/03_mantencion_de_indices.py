from behave import when, then

from expert.actions.formulario_indices_action import FormularioIndicesAction
from expert.actions.menu_action import MenuAction
from expert.pages.formulario_indices_page import FormularioIndicesPage
from expert.pages.mantencion_indices_page import MantencionIndicesPage
from scriptize.report import report


@when("ir a la mantencion de indices")
def step_impl(context):
    context.menu_action = MenuAction()
    context.menu_action.click_mantencion_indices()


@when("crear nuevo indice")
def step_impl(context):
    context.mantencion_indices_page = MantencionIndicesPage()
    context.mantencion_indices_page.click_boton_crear()
    report.write_line("Formulario de creacion de indices", report.Status.SUCCESS, True)


@when("ingresar valores de indices y grabar los registros")
def step_impl(context):
    context.mantencion_indices_page = MantencionIndicesPage()
    context.formulario_indices_page = FormularioIndicesPage()
    context.formulario_indices_action = FormularioIndicesAction()

    context.formulario_indices_action.llena_indices_sin_decimales()
    context.formulario_indices_action.llena_indices_con_decimales()

    context.PeriodoForm = context.formulario_indices_action.transforma_periodo_a_ames()
    context.UtmForm = context.formulario_indices_page.get_utm()
    context.UfForm = context.formulario_indices_page.get_uf()
    context.TopeAfpForm = context.formulario_indices_page.get_topeafp()
    context.TopeSecForm = context.formulario_indices_page.get_topesec()
    context.VariacionIpcForm = context.formulario_indices_page.get_variacion_ipc()
    context.FactorActualizacionForm = context.formulario_indices_page.get_factor_actualizacion_ipc()
    context.SueldoMinimoForm = context.formulario_indices_page.get_sueldo_minimo()
    report.write_line("Formulario con nuevos valores", report.Status.SUCCESS, True)

    context.formulario_indices_page.click_boton_ok()

    report.write_line("Creación de nuevos indices en la pantalla de mantencion", report.Status.SUCCESS, True)


@then("validar cada indice del formulario en la pantalla de mantencion")
def step_impl(context):
    context.formulario_indices_page = FormularioIndicesPage()
    context.mantencion_indices_page = MantencionIndicesPage()

    assert context.PeriodoForm == context.mantencion_indices_page.get_Periodo()
    assert context.UtmForm == context.mantencion_indices_page.get_UTM()
    assert context.UfForm == context.mantencion_indices_page.get_UF()
    assert context.TopeAfpForm == context.mantencion_indices_page.get_TopeAfp()
    assert context.TopeSecForm == context.mantencion_indices_page.get_TopeSec()
    assert context.VariacionIpcForm == context.mantencion_indices_page.get_VariacionIpc()
    assert context.FactorActualizacionForm == context.mantencion_indices_page.get_FactorActualizacionIpc()
    assert context.SueldoMinimoForm == context.mantencion_indices_page.get_SueldoMinimo()
