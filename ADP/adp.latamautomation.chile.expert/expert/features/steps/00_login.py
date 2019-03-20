from behave import given, when, then

from expert.actions.login_action import LoginAction


@given("el usuario esta en la pagina de login")
def step_impl(context):
    context.setup.go(url=context.url)


@when("hacer login con credenciales validas")
def step_impl(context):
    context.login_action = LoginAction()
    context.login_action.registro_y_login(context.cuenta, context.datos, context.dominio, context.usu_admin,
                                          context.clave_admin)


@when("hacer login con credenciales validas de autoconsulta")
def step_impl(context):
    context.login_action = LoginAction()
    context.login_action.registro_y_login(context.cuenta, context.datos, context.dominio, context.usu_autoconsulta,
                                          context.clave_autoconsulta)


@then("el usuario debe ser redirigido al home page")
def step_impl(context):
    assert context.setup.driver.title == "ADP"
