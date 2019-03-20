from expert.catalogs import emision_de_liquidaciones_catalog
from scriptize.components.page_element import PageObjects


class EmisionDeLiquidacionesPage(PageObjects):
    """
    La clase 'EmisionDeLiquidacionesPage' es responsable de la interacción con los componentes de la página de
    Emisión de Liquidaciones
    """

    def click_todos(self):
        """
        Permite seleccionar la opción TODOS en el campo Selección
        """
        cantidad = self.get_text(emision_de_liquidaciones_catalog.DIV_CANTIDAD_SELECCION)
        self.button.click(emision_de_liquidaciones_catalog.LINK_TODOS)
        while cantidad == self.get_text(emision_de_liquidaciones_catalog.DIV_CANTIDAD_SELECCION):
            pass

    def click_seleccion(self):
        """
        Permite seleccionar la opción SELECCION en el campo Selección
        """
        self.button.click(emision_de_liquidaciones_catalog.LINK_SELECCION)

    def click_repetir_ultima(self):
        """
        Permite seleccionar la opción REPETIR ÚLTIMA en el campo Selección
        """
        self.button.click(emision_de_liquidaciones_catalog.LINK_REPETIR_ULTIMA)

    def check_bloquea_liquid(self):
        """
        Permite seleccionar la opción ¿Bloquea liquidaciones? en el campo Opciones
        """
        self.checkbox.check(emision_de_liquidaciones_catalog.CHECKBOX_TBLOQUEA_LIQ)

    def check_borra_periodo(self):
        """
        Permite seleccionar la opción ¿Borra todo el periodo? en el campo Opciones
        """
        self.checkbox.check(emision_de_liquidaciones_catalog.CHECKBOX_TBORRATODOS)

    def check_avisa_fin_mail(self):
        """
        Permite seleccionar la opción ¿Avisa fin por e-mail? en el campo Opciones
        """
        self.checkbox.check(emision_de_liquidaciones_catalog.CHECKBOX_CHKMAIL)

    def set_fecha_pago(self, fecha_pago):
        """
        Carga información en el campo Mes de Pago
        :param fecha_pago: Fecha de pago en formato DD-MM-AAAA
        """
        self.input.fill(emision_de_liquidaciones_catalog.INPUT_TFECHA_PAG, fecha_pago)

    def set_descripcion(self, descripcion):
        """
        Carga información en el campo Descripción
        :param descripcion: Descripción de proceso Emisión de Liquidaciones
        """
        self.input.fill(emision_de_liquidaciones_catalog.INPUT_TDESCRIP, descripcion)

    def click_ejecutar(self):
        """
        Realiza acción click link Ejecutar el Proceso
        """
        self.button.click(emision_de_liquidaciones_catalog.BTN_EJECUTAR)

    def click_btn_si_ventana(self):
        """
        Realiza acción click en el botón SI de ventana "Opciones"
        """
        self.button.click(emision_de_liquidaciones_catalog.BTNAUX_VENTANA_OPCIONES)

    def click_btn_cerrar_ventana(self):
        """
        Realiza acción click en el botón 'X' en la ventana 'Preparando datos'
        """
        self.button.click(emision_de_liquidaciones_catalog.BTNCERRAR_VENTANA_PREPARANDO_DATOS)

    def get_avance_emi_liq(self):
        """
        Obtiene valor de la columna "Avance" de la grilla de procesos (Emisión de Liquidaciones)
        :return: Valor de la columna Avance
        """
        return self.input.get_text(emision_de_liquidaciones_catalog.AVANCE_EMI_LIQUID)

    def get_descripcion_emi_liq(self):
        """
        Obtiene valor de la columna "Descripción" de la grilla de procesos (Emisión de Liquidaciones)
        :return: Valor de la columna "Descripción"
        """
        return self.input.get_text(emision_de_liquidaciones_catalog.DESCRIPCION_EMI_LIQUID)

    def get_estado_emi_liq(self):
        """
        Obtiene valor de la columna "Estado" de la grilla de procesos (Emisión de Liquidaciones)
        :return: Valor de la columna "Estado"
        """
        return self.input.get_text(emision_de_liquidaciones_catalog.ESTADO_EMI_LIQUID)

    def get_duracion_emi_liq(self):
        """
        Obtiene valor de la columna "Duración" de la grilla de procesos (Emisión de Liquidaciones)
        :return: Valor de la columna "Duración"
        """
        return self.input.get_text(emision_de_liquidaciones_catalog.DURACION_EMI_LIQUID)
