from behave import when, then

from expert.actions.buscar_colaborador_action import BuscarColaboradorAction
from expert.actions.ficha_colaborador_action import FichaColaboradorAction
from expert.actions.ingreso_masivo_campos_action import IngresoMasivoCampoAction
from expert.actions.menu_action import MenuAction
from expert.data.utils import Utils
from scriptize.report import report


@when('ir a ingreso masivo de campos tipo "{tipo}" para modificar "{campo}" en "{dato}"')
def step_impl(context, tipo, campo, dato):
    report.write_line("Ir a ingreso masivo de campos tipo [{}] para modificar [{}] en [{}].".format(tipo, campo, dato))
    context.ingreso_masivo_campos_action = IngresoMasivoCampoAction()
    context.ingreso_masivo_campos_action.ingresar(dato, campo, tipo)


@when('modificar "{campo}" en "{tipo}"')
def step_impl(context, campo, tipo):
    report.write_line("Modificar [{}] en [{}].".format(campo, tipo))
    context.utils = Utils()
    context.nuevo_numero_telefono = "+562 " + str(context.utils.random_digits(8))
    context.lista_con_datos_de_colaborador = context.ingreso_masivo_campos_action.modificar(tipo, context.
                                                                                            nuevo_numero_telefono)


@then('validar "{tipo}" dato "{campo}" en la Ficha del Colaborador')
def step_impl(context, tipo, campo):
    report.write_line("Validar [{}] dato [{}] en la Ficha del Colaborador.".format(tipo, campo))
    context.ficha_colaborador_action = FichaColaboradorAction()
    context.buscar_colaborador_action = BuscarColaboradorAction()
    context.menu_action = MenuAction()
    context.nombre_del_colaborador = context.lista_con_datos_de_colaborador[0]
    context.numero_fono_antes_cambiar = context.lista_con_datos_de_colaborador[1]
    context.menu_action.click_ficha_colaborador()
    context.buscar_colaborador_action.acceso_nombre_con_buscar(context.nombre_del_colaborador)
    context.ficha_colaborador_action.click_inf_personal()
    assert context.ingreso_masivo_campos_action.validar(context.nuevo_numero_telefono,
                                                        context.numero_fono_antes_cambiar) is True
