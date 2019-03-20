from expert.pages.login_page import LoginPage
from scriptize.report import report


class LoginAction:
    """
    La clase LoginAction es reponsable de agrupar funcionalidades de la página de login_action.
    """

    def __init__(self):
        self.login_page = LoginPage()

    def registro_y_login(self, cuenta, compania, dominio, usuario, password):
        """
        Llenado de credenciales para loguearse en el sistema
        :param cuenta: Cuenta
        :param compania: Juego de Datos
        :param dominio: Base de Dominio
        :param usuario: Usuario
        :param password: Password
        """
        self.login_page.click_desplegar_cuenta()
        self.login_page.wait_fields_load()
        self.login_page.set_cuenta(cuenta)
        self.login_page.set_jdd(compania)
        self.login_page.set_dominio(dominio)
        self.login_page.set_usuario(usuario)
        self.login_page.set_password(password)
        report.write_line("Llenando los datos de login", report.Status.SUCCESS, True)
        self.login_page.click_login()
