from expert.pages.buscar_colaborador_page import BuscarColaboradorPage
from expert.pages.ficha_colaborador_page import FichaColaboradorPage
from expert.pages.loadings_page import LoadingsPage
from scriptize.report import report


class BuscarColaboradorAction:
    """"
    La clase BuscarColaboradorAction agrupa funcionalidades de la página de búsqueda de colaboradores
    """

    def __init__(self):
        self.buscar_colaborador_page = BuscarColaboradorPage()
        self.ficha_colaborador_page = FichaColaboradorPage()
        self.loadings_page = LoadingsPage()
        self.lineas_tabla = None

    def pagina_esta_cargarda(self):
        """
        Valida si pagina está cargada
        :return: True si está cargada False sino
        """
        report.write_line("Valida si pagina está cargada.")
        return self.buscar_colaborador_page.esta_presente_codigo() and self.buscar_colaborador_page. \
            esta_presente_rut() and self.buscar_colaborador_page.esta_presente_estado() and self. \
                   buscar_colaborador_page.esta_presente_nombre() and self.buscar_colaborador_page. \
                   esta_presente_pane_busca_colaborador()

    def busca(self, codigo, rut, estado, nombre):
        """
        Acceso colaborador
        :param codigo:  código
        :param rut: rut
        :param estado: estado
        :param nombre: nombre
        :return: True si acceso y False si no
        """
        report.write_line("Acessando colaborador con los siguientes datos: CÓDIGO [{}], RUT [{}], ESTADO [{}] y "
                          "NOMBRE [{}].".format(codigo, rut, estado, nombre))
        hay_colaborador = False
        self.ficha_colaborador_page.click_buscar()
        self.pagina_esta_cargarda()
        self.buscar_colaborador_page.set_codigo(codigo)
        self.buscar_colaborador_page.pulse_la_tecla_tab()
        self.loadings_page.wait_spinner_disappear()
        self.buscar_colaborador_page.set_rut(rut)
        self.buscar_colaborador_page.pulse_la_tecla_tab()
        self.loadings_page.wait_spinner_disappear()
        self.buscar_colaborador_page.set_estado(estado)
        self.buscar_colaborador_page.pulse_la_tecla_tab()
        self.loadings_page.wait_spinner_disappear()
        self.buscar_colaborador_page.set_nombre(nombre)
        self.buscar_colaborador_page.pulse_la_tecla_tab()
        self.loadings_page.wait_spinner_disappear()
        self.lineas_tabla = self.buscar_colaborador_page.get_todos_colaboradores()
        for i in range(0, len(self.lineas_tabla)):
            tabla = self.buscar_colaborador_page.get_todos_colaboradores()
            linea = tabla[i]
            if codigo == self.buscar_colaborador_page.get_codigo(linea) and rut == self. \
                    buscar_colaborador_page.get_rut(linea) and estado == self.buscar_colaborador_page.get_estado(linea) \
                    and nombre == self.buscar_colaborador_page.get_nombre(linea):
                self.buscar_colaborador_page.selecciona_registro(linea)
                self.loadings_page.wait_spinner_disappear()
                self.buscar_colaborador_page.wait_for_load_page()
                hay_colaborador = True

        if hay_colaborador:
            report.write_line("Colaborador con los siguientes datos: CÓDIGO [{}], RUT [{}], ESTADO [{}] y "
                              "NOMBRE [{}] fue encontrado en la busca.".format(codigo, rut, estado, nombre))
        else:
            report.write_line("Colaborador con los siguientes datos: CÓDIGO [{}], RUT [{}], ESTADO [{}] y "
                              "NOMBRE [{}] no fue encontrado en la busca.".format(codigo, rut, estado, nombre),
                              report.Status.DANGER)
        return hay_colaborador

    def acceso_codigo(self, codigo):
        """
        Acesso codigo
        :param codigo: codigo
        :return: True si acceso y False si no
        """
        report.write_line("Acessando codigo [{}].".format(codigo))
        self.pagina_esta_cargarda()
        self.buscar_colaborador_page.set_codigo(codigo)
        self.buscar_colaborador_page.pulse_la_tecla_tab()
        self.loadings_page.wait_spinner_disappear()
        self.lineas_tabla = self.buscar_colaborador_page.get_todos_colaboradores()
        for i in range(0, len(self.lineas_tabla)):
            tabla = self.buscar_colaborador_page.get_todos_colaboradores()
            linea = tabla[i]
            if codigo == self.buscar_colaborador_page.get_codigo(linea):
                self.buscar_colaborador_page.selecciona_registro(linea)
                self.loadings_page.wait_spinner_disappear()
                self.buscar_colaborador_page.wait_for_load_page()
                return True

    def acceso_rut(self, rut):
        """
        Acesso rut
        :param rut: rut
        :return: True si acceso y False si no
        """
        report.write_line("Acessando rut [{}].".format(rut))
        self.pagina_esta_cargarda()
        self.buscar_colaborador_page.set_rut(rut)
        self.buscar_colaborador_page.pulse_la_tecla_tab()
        self.loadings_page.wait_spinner_disappear()
        self.lineas_tabla = self.buscar_colaborador_page.get_todos_colaboradores()
        for i in range(0, len(self.lineas_tabla)):
            tabla = self.buscar_colaborador_page.get_todos_colaboradores()
            linea = tabla[i]
            if rut == self.buscar_colaborador_page.get_rut(linea):
                self.buscar_colaborador_page.selecciona_registro(linea)
                self.loadings_page.wait_spinner_disappear()
                self.buscar_colaborador_page.wait_for_load_page()
                while self.buscar_colaborador_page.esta_presente_pane_busca_colaborador() is False:
                    return True

    def acceso_estado(self, estado):
        """
        Acesso estado
        :param estado: estado
        :return: True si acceso y False si no
        """
        report.write_line("Acessando estado [{}].".format(estado))
        try:
            self.pagina_esta_cargarda()
            self.buscar_colaborador_page.set_estado(estado)
            self.buscar_colaborador_page.pulse_la_tecla_tab()
            self.loadings_page.wait_spinner_disappear()
            self.lineas_tabla = self.buscar_colaborador_page.get_todos_colaboradores()
            for i in range(0, len(self.lineas_tabla)):
                tabla = self.buscar_colaborador_page.get_todos_colaboradores()
                linea = tabla[i]
                if estado == self.buscar_colaborador_page.get_estado(linea):
                    self.buscar_colaborador_page.selecciona_registro(linea)
                    self.loadings_page.wait_spinner_disappear()
                    self.buscar_colaborador_page.wait_for_load_page()
                    return True
        except Exception as e:
            report.write_line("Identificado error en la pagina de Busca Colaborador llenando el estado [{}]. "
                              "Error [{}]".format(estado, str(e)), report.Status.WARNING, True)
            self.acceso_estado(estado)

    def acceso_nombre(self, nombre):
        """
        Acesso nombre
        :param nombre: nombre
        :return: True si acceso y False si no
        """
        report.write_line("Acessando nombre [{}].".format(nombre))
        self.pagina_esta_cargarda()
        self.buscar_colaborador_page.set_nombre(nombre)
        self.buscar_colaborador_page.pulse_la_tecla_tab()
        self.loadings_page.wait_spinner_disappear()
        self.lineas_tabla = self.buscar_colaborador_page.get_todos_colaboradores()
        for i in range(0, len(self.lineas_tabla)):
            tabla = self.buscar_colaborador_page.get_todos_colaboradores()
            linea = tabla[i]
            if nombre == self.buscar_colaborador_page.get_nombre(linea):
                self.buscar_colaborador_page.selecciona_registro(linea)
                self.loadings_page.wait_spinner_disappear()
                self.buscar_colaborador_page.wait_for_load_page()
                return True

    def get_colaborador_por_codigo(self, codigo, estado):
        """
        Busca a un empleado por su código y estado.
        :param codigo: codigo del colaborador
        :param estado: estado del colaborador
        """
        report.write_line("Busca a un empleado por su código y estado.")
        self.buscar_colaborador_page.set_codigo(codigo)
        self.buscar_colaborador_page.click_on_body()
        self.loadings_page.wait_spinner_disappear()
        self.buscar_colaborador_page.set_estado(estado)
        self.buscar_colaborador_page.click_on_body()
        self.loadings_page.wait_spinner_disappear()
        self.buscar_colaborador_page.get_colaborador()
        self.loadings_page.wait_spinner_disappear()

    def get_colaborador_activo(self):
        """
        Selecciona un colaborador activo
        """
        report.write_line("Selecciona un colaborador activo.")
        self.buscar_colaborador_page.set_estado('A')
        self.loadings_page.wait_spinner_disappear()
        self.buscar_colaborador_page.pulse_la_tecla_tab()
        self.loadings_page.wait_spinner_disappear()
        self.buscar_colaborador_page.get_colaborador()

    def get_colaborador_nombre(self, nombre_colaborador):
        """
        Obtener Colaborador por nombre
        :param nombre_colaborador: Nombre del Colaborador
        """
        report.write_line("Obtener Colaborador por nombre.")
        self.buscar_colaborador_page.set_nombre(nombre_colaborador)
        self.buscar_colaborador_page.pulse_la_tecla_tab()
        self.loadings_page.wait_spinner_disappear()
        self.buscar_colaborador_page.get_colaborador()
        self.loadings_page.wait_spinner_disappear()

    def click_filter_nombre(self):
        """
        Click en el filter nombre
        """
        report.write_line("Click en el filter nombre.")
        self.buscar_colaborador_page.click_filter_nombre()
        self.loadings_page.wait_spinner_disappear()

    def acceso_rut_con_buscar(self, rut):
        """
        Hace clic en botón Buscar y se accede a Rut
        :param rut: rut del colaborador
        """
        report.write_line("Hace clic en botón Buscar y se accede a Rut.")
        self.buscar_colaborador_page.click_buscar()
        self.acceso_rut(rut)

    def acceso_nombre_con_buscar(self, nombre):
        """
        Hace clic en botón Buscar y se accede por Nombre
        :param nombre: Nombre del colaborador
        """
        report.write_line("Hace clic en botón Buscar y se accede por Nombre.")
        self.buscar_colaborador_page.click_buscar()
        self.esta_cargada_ventana_buscar_ficha_colaborador()
        self.acceso_nombre(nombre)

    def esta_cargada_ventana_buscar_ficha_colaborador(self):
        """
        Revisa si la ventana esta cargada
        :return: True o False si esta o no cargada la ventana Buscar
        """
        report.write_line("Revisa si la ventana Buscar Ficha Colaborador esta cargada.")
        return self.buscar_colaborador_page.esta_presente_codigo() and self.buscar_colaborador_page. \
            esta_presente_nombre() and self.buscar_colaborador_page.esta_presente_boton_volver()
