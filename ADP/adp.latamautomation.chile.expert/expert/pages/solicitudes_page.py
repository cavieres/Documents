from expert.catalogs import solicitudes_catalog
from scriptize.components.page_element import PageObjects
from scriptize.utils.file import File


class SolicitudesPage(PageObjects):
    """
    La clase 'SolicitudesPage' es responsable de la interacción con los componentes de la página de
    auto-consulta
    """

    def is_pagina_principal(self):
        """
        Comprueba si está en la página principal de solicitudes
        :return: si está en la página (True o False)
        """
        return self.wait_for_element_present(solicitudes_catalog.INPUT_INSTITUCION)

    def fill_institucion(self, valor):
        """
        Escribe en el campo Institución a la que se presentará el certificado
        :param valor: Institución a la que se presentará el certificado
        """
        self.input.fill(solicitudes_catalog.INPUT_INSTITUCION, valor)

    def get_mes_proceso(self):
        """
        Retorna mes de proceso
        :return: Mes de Proceso
        """
        return self.input.get_text(solicitudes_catalog.MES_PROCESO)

    def click_liquidaciones(self):
        """
        Permite seleccionar link Liquidaciones
        """
        self.button.click(solicitudes_catalog.LINK_LIQUIDACIONES)

    def get_tabla_liquidaciones(self):
        """
        Obtiene y retorna la tabla Liquidaciones
        :return: Tabla de Liquidaciones
        """
        return self.get_element(solicitudes_catalog.TABLA_LIQUIDACIONES)

    def get_lineas_tabla(self):
        """
        Obtiene y retorna los registros TR (FILAS)
        :return: Registros TR
        """
        table = self.get_tabla_liquidaciones()
        return self.get_elements(solicitudes_catalog.TR_GENERIC, context=table)

    def click_pdf(self, linea):
        """
        Click en icono PDF
        :param linea: Registro TR
        """
        columna_pdf = self.get_elements(solicitudes_catalog.TD_GENERIC, context=linea)[0]
        input_pdf = self.get_element(solicitudes_catalog.INPUT_GENERIC, context=columna_pdf)
        input_pdf.click()

    def is_archivo_pdf(self, path):
        """
        Revisa si archivo se descargo en la carpeta correspondiente
        :return: Valor booleano (True o False)
        """
        return File.exists(path + "ReciboSimpCL.pdf")

    def click_solicitudes(self):
        """
        Acción click en link Solicitudes
        """
        self.button.click(solicitudes_catalog.LINK_SOLICITUDES)

    def click_solicitar_feriados(self):
        """
        Acción click en link Solicitar Feriados
        """
        self.button.click(solicitudes_catalog.LINK_SOLICITAR_FERIADOS)

    def click_link_revisar_solicitudes(self):
        """
        Acción click en link Revisar Solicitudes
        """
        self.button.click(solicitudes_catalog.LINK_REVISAR_SOLICITUDES)

    def set_fecha_desde(self, tdate):
        """
        Escribe en el campo Fecha Desde
        :param tdate: Valor para el campo Desde
        """
        self.input.fill(solicitudes_catalog.CAMPO_FECHA_DESDE, tdate)

    def set_cantidad_dias(self, tcant_dias):
        """
        Escribe en el campo Cant. Días Solicitados
        :param tcant_dias: Valor para el campo Cant. días solicitados
        """
        self.input.fill(solicitudes_catalog.CAMPO_CANTIDAD_DIAS, tcant_dias)

    def set_motivo(self, tmotivo):
        """
        Escribe en el campo Motivo
        :param tmotivo: Valor para el campo Motivo
        """
        self.input.fill(solicitudes_catalog.CAMPO_MOTIVO, tmotivo)

    def click_enviar_solicitud(self):
        """
        Acción click en link Enviar Solicitud
        """
        self.button.click(solicitudes_catalog.BOTON_ENVIAR_SOLICITUD)

    def click_revisar_solicitudes(self):
        """
        Acción click en link Revisar Solicitudes
        """
        self.button.click(solicitudes_catalog.LINK_REVISAR_SOLICITUDES)

    def click_cerrar_mensaje_validacion(self):
        """
        Acción click en boton cerrar mensaje de validacion
        """
        self.button.click(solicitudes_catalog.BOTON_CERRAR_MENSAJE_VALIDACION)

    def click_eliminar_de_revisar_solicitudes(self):
        """
        Acción click en botón Eliminar
        """
        self.button.click(solicitudes_catalog.BOTON_ELIMINAR_SOLICITUDES_OBSOLETAS)

    def set_fecha_tope_eliminacion(self, tfecha_tope):
        """
        Escribe en el campo Fecha tope de eliminación
        :param tfecha_tope: Recibe fecha actual
        """
        self.input.fill(solicitudes_catalog.FECHA_TOPE_VENTANA_ELIMINAR_SOLICITUDES_OBSOLETAS, tfecha_tope)

    def clear_fecha_tope_eliminacion(self):
        """
        Limpia campo Fecha tope de eliminación
        """
        self.input.fill(solicitudes_catalog.FECHA_TOPE_VENTANA_ELIMINAR_SOLICITUDES_OBSOLETAS, "")

    def click_ok_eliminar_solicitudes(self):
        """
        Acción click en botón Ok para elimina solicitudes
        """
        self.button.click(solicitudes_catalog.BOTON_OK_VENTANA_ELIMINAR_SOLICITUDES_OBSOLETAS)

    def click_volver_al_eliminar_solicitudes(self):
        """
        Acción click en botón Volver desde elimina solicitudes
        """
        self.button.click(solicitudes_catalog.BOTON_VOLVER_SOLICITUDES_OBSOLETAS)

    def click_volver_solicitar_vacaciones(self):
        """
        Acción click en link Volver
        """
        self.button.click(solicitudes_catalog.BOTON_VOLVER_SOLICITUD_FERIADO)

    def get_columna_codigo(self):
        """
        Retorna valor de la columna Código
        :return: Columna código
        """
        return self.input.get_text(solicitudes_catalog.COLUMNA_CODIGO_USUARIO)

    def get_columna_fecha(self):
        """
        Retorna valor de la columna Fecha
        :return: Columna fecha
        """
        return self.input.get_text(solicitudes_catalog.COLUMNA_FECHA)

    def get_columna_estado(self):
        """
        Retorna valor de la columna Estado
        :return: Columna estado
        """
        return self.input.get_text(solicitudes_catalog.COLUMNA_ESTADO)

    def get_columna_detalle(self):
        """
        Retorna valor de la columna Detalle
        :return: Columna detalle
        """
        return self.input.get_text(solicitudes_catalog.COLUMNA_DETALLE)

    def get_columna_tipo(self):
        """
        Retorna valor de la columna Tipo
        :return: Columna tipo
        """
        return self.input.get_text(solicitudes_catalog.COLUMNA_TIPO)

    def click_aceptar_alerta(self):
        """
        Cierra la ventana generada por javascript, al enviar una solicitud de feriados.
        """
        self.alert.accept_alert()
