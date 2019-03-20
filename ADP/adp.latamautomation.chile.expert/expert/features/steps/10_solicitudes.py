from datetime import datetime

from behave import given, when, then

from expert.data.utils import Utils
from expert.actions.login_action import LoginAction
from expert.actions.solicitudes_action import SolicitudesAction


@given("acceder a cuenta autoconsulta con credenciales validas para solicitudes")
def step_impl(context):
    context.login_action = LoginAction()
    context.solicitudes_action = SolicitudesAction()
    context.cuenta = context.env.clientes.clauto56.cuenta
    context.datos = context.env.clientes.clauto56.datos
    context.dominio = context.env.clientes.clauto56.dominio
    context.usu_autoconsulta = context.env.usuarios.autoconsulta.us505005007.usuario
    context.clave_autoconsulta = context.env.usuarios.autoconsulta.us505005007.clave
    context.login_action.registro_y_login(context.cuenta, context.datos, context.dominio, context.usu_autoconsulta,
                                          context.clave_autoconsulta)


@when("eliminar todas solicitudes fecha de hoy")
def step_impl(context):
    context.fecha_hoy = datetime.today().strftime("%d-%m-%Y")
    context.solicitudes_action.elimina(context.fecha_hoy)


@when("enviar feriados")
def step_impl(context):
    context.fecha_feriados = Utils.get_date(context, "-", 1)
    context.dia = datetime.today().strftime("%A").upper()
    context.solicitudes_action.envia_feriados(context.fecha_feriados, "1", "VACACIONES",
                                              context.dia)


@then("validar feriados")
def step_impl(context):
    assert context.solicitudes_action.valida("Vacaciones", context.usu_autoconsulta, context.fecha_hoy,
                                             "En Proceso")
