from expert.catalogs import login_catalog
from scriptize.components.page_element import PageObjects


class LoginPage(PageObjects):
    """
    La clase 'LoginPage' es responsable por la interacción con los componentes de la página de login_action.
    """

    def click_desplegar_cuenta(self):
        """
        click en el link para desplegar los datos de conexión
        """
        self.button.click(login_catalog.INPUT_MUESTRA_CUENTA)

    def select_cuenta(self, cuenta):
        """
        Llena el campo cuenta en la página de login_action
        :param cuenta: cuenta
        """
        self.select.select_by_value(login_catalog.SELECT_CUENTA, cuenta)

    def wait_fields_load(self):
        """
        Esperar la carga de los elementos necesarios para el login
        """
        self.wait_for_element_visible(login_catalog.INPUT_CUENTA)
        self.wait_for_element_visible(login_catalog.INPUT_JUEGO_DATOS)
        self.wait_for_element_visible(login_catalog.INPUT_DOMAIN)
        self.wait_for_element_visible(login_catalog.INPUT_USUARIO)
        self.wait_for_element_visible(login_catalog.INPUT_CLAVE)
        self.wait_for_element_visible(login_catalog.BUTTON_INGRESAR)

    def set_cuenta(self, cuenta):
        """
        Llena el campo nombre en la página de login_action
        :param cuenta: nombre de la cuenta
        """
        self.input.fill(login_catalog.INPUT_CUENTA, cuenta)

    def set_jdd(self, jdd):
        """
        Llena el campo Juego de Datos en la página de login_action
        :param jdd: nombre del juego de datos
        """
        self.input.fill(login_catalog.INPUT_JUEGO_DATOS, jdd)

    def set_dominio(self, dominio):
        """
        Llena el campo dominio en la página de login_action
        :param dominio: base de dominio
        """
        self.input.fill(login_catalog.INPUT_DOMAIN, dominio)

    def set_usuario(self, usuario):
        """
        Llena el campo usuario en la página de login_action
        :param usuario: usuario
        """
        self.input.fill(login_catalog.INPUT_USUARIO, usuario)

    def set_password(self, password):
        """
        Llena el campo password en la página de login_action
        :param password: password
        """
        self.input.fill(login_catalog.INPUT_CLAVE, password)

    def click_login(self):
        """
        Click en login_action para validar las credenciales ingresadas
        """
        self.button.click(login_catalog.BUTTON_INGRESAR)
