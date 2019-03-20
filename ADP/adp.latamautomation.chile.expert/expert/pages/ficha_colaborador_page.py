from scriptize.components.page_element import PageObjects

from expert.catalogs import ficha_colaborador_catalog


class FichaColaboradorPage(PageObjects):
    """
    La clase 'FichaColaboradorPage' es responsable de la interacción con los componentes de la Ficha del Colaborador.
    """

    def get_titulo_pagina(self):
        """
        Obtener el título de la página
        """
        return self.input.get_text(ficha_colaborador_catalog.TITULO)

    def click_legales(self):
        """
        Navegación a ficha_colaborador_action izquierdo Legales en la Ficha del Colaborador
        """
        self.button.click(ficha_colaborador_catalog.S04_LEGALES)

    def click_finiquitos(self):
        """
        Click en Finiquitos bajo ficha_colaborador_action Legales
        """
        self.button.click(ficha_colaborador_catalog.S0402_FINIQUITOS)

    def click_liquidaciones(self):
        """
        Click en menu_action lateral izquierdo Liquidaciones
        """
        self.button.click(ficha_colaborador_catalog.S03_LIQUIDACIONES)

    def click_liquidacion_prueba(self):
        """
        Click en ficha_colaborador_action Liquidación de Prueba bajo Liquidaciones ficha_colaborador_action
        """
        self.button.click(ficha_colaborador_catalog.S0303_DE_PRUEBA)

    def click_buscar(self):
        """
        Click en botón buscar empleador
        """
        self.button.click(ficha_colaborador_catalog.M00_BUSCAR)

    def click_ausentismo(self):
        """
        Presiona pestaña AUSENTISMO
        """
        self.is_element_present(ficha_colaborador_catalog.S02_AUSENTISMO, 60)
        self.button.click(ficha_colaborador_catalog.S02_AUSENTISMO)

    def click_licencias_permisos(self):
        """
        Presiona link Licencias/Permisos
        """
        self.button.click(ficha_colaborador_catalog.S0201_LICENCIAS)

    def click_vacaciones(self):
        """
        Presiona menu Vacaciones
        """
        self.is_element_present(ficha_colaborador_catalog.S0202_VACACIONES, 60)
        self.button.click(ficha_colaborador_catalog.S0202_VACACIONES)

    def click_liquidaciones_historicas(self):
        """
        Abre submenu Liquidaciones Historicas bajo menu Liquidaciones
        """
        self.button.click(ficha_colaborador_catalog.S0301_HISTORICAS)

    def click_inf_personal(self):
        """
        Abre submenu Información Personal
        """
        self.button.click(ficha_colaborador_catalog.M03_INF_PERSONAL)

    def click_cerrar_desde_inf_personal(self):
        """
        Cierra ventana Datos Personales
        """
        self.button.click(ficha_colaborador_catalog.E03_EXIT_INF_PERSONAL)

    def obtener_telefono_inf_personal(self):
        """
        Obtiene el valor del campo Teléfono
        :return: Teléfono
        """
        return self.input.get_text(ficha_colaborador_catalog.FONO_FIJO)

    def set_campo_nombre_buscar(self, nombre_colaborador):
        """
        Llena el campo Nombre en el Buscador de Colaboradores
        :param nombre_colaborador: Corresponde al nombre del colaborador
        """
        self.input.fill(ficha_colaborador_catalog.CAMPO_NOMBRE_BUSCAR, nombre_colaborador)

    def set_campo_codigo_buscar(self, codigo_colaborador):
        """
        Llena el campo Código en el Buscador de Colaboradores
        :param codigo_colaborador: Corresponde al código del colaborador
        """
        self.input.fill(ficha_colaborador_catalog.CAMPO_CODIGO_BUSCAR, codigo_colaborador)

    def click_primer_colaborador_buscar(self):
        """
        Selecciona el primer colaborador de la grilla en el buscador de colaboradores
        """
        self.button.click(ficha_colaborador_catalog.PRIMER_REGISTRO_COLABORADOR)

    def click_mapa_de_items(self):
        """
        Presiona link Mapa de Items
        """
        self.button.click(ficha_colaborador_catalog.S0302_ITEMS)

    def get_celular_inf_personal(self):
        """
        Obtiene el valor del campo Celular desde la Ficha del Colaborador/Inf. Personal
        :return: Celular
        """
        return self.input.get_text(ficha_colaborador_catalog.CELULAR_INF_PERSONAL)

    def get_rut_inf_personal(self):
        """
        Obtiene valor del campo RUT desde Inf. Personal
        :return: RUT del Colaborador
        """
        return self.input.get_text(ficha_colaborador_catalog.V03_RUT)

    def campo_rut_esta_cargado_inf_personal(self):
        """
        Retorna True o False dependiendo si elemento esta cargado
        :return: True o False
        """
        return self.is_element_present(ficha_colaborador_catalog.V03_RUT, 60)

    def campo_telefono_esta_cargado_inf_personal(self):
        """
        Retorna True o False dependiendo si elemento esta cargado
        :return: True o False
        """
        return self.is_element_present(ficha_colaborador_catalog.FONO_FIJO, 60)

    def boton_actualizar_esta_cargado_inf_personal(self):
        """
        Retorna True o False dependiendo si elemento esta cargado
        :return: True o False
        """
        return self.is_element_present(ficha_colaborador_catalog.BOTON_ACTUALIZAR_INF_PERSONAL)