from scriptize.components.keys import Keys
from scriptize.components.page_element import PageObjects

from expert.catalogs import buscar_colaborador_catalog


class BuscarColaboradorPage(PageObjects):
    """
    La clase 'BuscarColaboradorPage' es reponsable de la interacción con los componentes de la búsqueda de colaboradores
    """

    def esta_presente_codigo(self):
        """
        Verifica si el campo codigo esta presente
        :return: True si esta presente False sino
        """
        return self.is_element_present(buscar_colaborador_catalog.I_CODIGO, 60)

    def esta_presente_pane_busca_colaborador(self):
        """
        Verifica si el pane Busca Colaborador esta presente
        :return: True si esta presente False sino
        """
        return self.is_element_present(buscar_colaborador_catalog.PANE_BUSCA_COLABORADOR) and self. \
            is_element_present(buscar_colaborador_catalog.TABLA_BUSCA_COLABORADORES)

    def set_codigo(self, value):
        """
        Llena el campo código en el formulario
        :param value: codigo
        """
        self.input.fill(buscar_colaborador_catalog.I_CODIGO, value)

    def click_on_body(self):
        """
        Click en el body
        """
        self.button.click(("css selector", "body"))

    def esta_presente_rut(self):
        """
        Verifica si el campo rut esta presente
        :return: Retorna TRUE o FALSE
        """
        return self.is_element_present(buscar_colaborador_catalog.I_RUT, 60)

    def set_rut(self, value):
        """
        Llena el campo rut en el formulario
        :param value: rut
        """
        self.input.fill(buscar_colaborador_catalog.I_RUT, value)

    def esta_presente_estado(self):
        """
        Verifica si el campo estado esta presente
        :return: Retorna TRUE o FALSE
        """
        return self.is_element_present(buscar_colaborador_catalog.I_ESTADO, 60)

    def set_estado(self, value):
        """
        Llena el campo estado en el formulario
        :param value: estado
        """
        self.input.fill(buscar_colaborador_catalog.I_ESTADO, value)

    def set_nombre(self, value):
        """
        Llena el campo nombre en el formulario
        :param value: nombre
        """
        self.input.fill(buscar_colaborador_catalog.I_NOMBRE, value)

    def esta_presente_nombre(self):
        """
        Verifica si el campo nombre esta presente
        :return: Retorna TRUE o FALSE
        """
        return self.is_element_present(buscar_colaborador_catalog.I_NOMBRE, 60)

    def get_colaborador(self):
        """
        (Clic) Selecciona al empleado del resultado luego que se ha realizado la búsqueda
        """
        self.button.click(buscar_colaborador_catalog.I_SELECCIONAR)

    @staticmethod
    def pulse_la_tecla_tab():
        """
        Presiona TAB desde elemento CODIGO
        """
        Keys.press_tab(buscar_colaborador_catalog.I_CODIGO)

    def click_buscar(self):
        """
        Click en el botón Buscar
        """
        self.button.click(buscar_colaborador_catalog.BTN_BUSCAR)

    def click_filter_nombre(self):
        """
        Click en el link Filter Nombre (Buscador de Colaboradores)
        """
        self.button.click(buscar_colaborador_catalog.LINK_FILTER_NOMBRE)

    def click_primera_pagina(self):
        """
        Click en el botón Primera Página
        """
        self.button.click(buscar_colaborador_catalog.BUTTON_PRIMERA_PAGINA)

    def click_pagina_anterior(self):
        """
        Click en el botón Página Anterior
        """
        self.button.click(buscar_colaborador_catalog.BUTTON_PAGINA_ANTERIOR)

    def click_pagina_siguiente(self):
        """
        Click en el botón Página Siguiente
        """
        self.button.click(buscar_colaborador_catalog.BUTTON_PAGINA_SIGUIENTE)

    def click_ultima_pagina(self):
        """
        Click en el botón Ultima Página
        """
        self.button.click(buscar_colaborador_catalog.BUTTON_ULTIMA_PAGINA)

    def get_todos_colaboradores(self):
        """
        Busca todos colaborados de la página
        :return: una lista con todas las TRs de WebElements
        """
        return self.table.get_table_lines(buscar_colaborador_catalog.TABLA_BUSCA_COLABORADORES, True)

    def selecciona_registro(self, linea):
        """
        Selecciona registro en el form 'Buscador un colaborador'
        :param linea: linea
        """
        self.table.click_element_inside_column(linea, 0, buscar_colaborador_catalog.INPUT)

    def get_codigo(self, linea):
        """
        Busca codigo de acuerdo con la linea de la tabla
        :param linea: WebElement linea del elemento TD
        :return: codigo
        """
        return self.table.get_column_text(linea, 1)

    def get_rut(self, linea):
        """
        Busca rut de acuerdo con la linea de la tabla
        :param linea: WebElement linea del elemento TD
        :return: rut
        """
        return self.table.get_column_text(linea, 2)

    def get_estado(self, linea):
        """
        Busca estado de acuerdo con la linea de la tabla
        :param linea: WebElement linea del elemento TD
        :return: estado
        """
        return self.table.get_column_text(linea, 3)

    def get_nombre(self, linea):
        """
        Busca nombre de acuerdo con la linea de la tabla
        :param linea: WebElement linea del elemento TD
        :return: nombre
        """
        return self.table.get_column_text(linea, 4)

    def esta_presente_boton_volver(self):
        """
        Verifica si el botón Volver esta presente
        :return: Retorna TRUE o FALSE
        """
        return self.is_element_present(buscar_colaborador_catalog.BUTTON_VOLVER, 60)
