from expert.catalogs import finiquito_individual_catalog
from scriptize.components.page_element import PageObjects


class FiniquitoIndividualPage(PageObjects):
    """
    La clase 'FiniquitoIndividualPage' es responsable de la interacción con los componentes de la página de
    Finiquitos Individuales
    """

    def set_fecha_documento(self, value):
        """
        Llena el campo Fecha del documento en la página de finiquito individual
        :param value: Fecha del documento
        """
        self.input.fill(finiquito_individual_catalog.INPUT_FECHA_DOC, value)

    def set_fecha_retiro(self, fecharet):
        """
        Llena el campo Fecha de retiro en la página de finiquito individual
        :param fecharet: Fecha de retiro
        """
        self.input.fill(finiquito_individual_catalog.INPUT_FECHA_RET, fecharet)

    def set_motivo(self, motivo):
        """
        Llena el motivo de retiro en el Finiquito
        :param motivo: motivo
        """
        self.input.fill(finiquito_individual_catalog.INPUT_MOTI_RET, motivo)

    def set_firma(self, firma):
        """
        Llena el firmante del finiquito
        :param firma: firmante
        """
        self.input.fill(finiquito_individual_catalog.INPUT_FIRMA, firma)
        self.link.click(finiquito_individual_catalog.LABEL_FIRMA)

    def set_observacion(self, observacion):
        """
        Llena el campo observaciones
        :param observacion: observaciones
        """
        self.input.fill(finiquito_individual_catalog.INPUT_OBSERVACIONES, observacion)
        self.link.click(finiquito_individual_catalog.LABEL_OBSERVACIONES)

    def check_feriado_proporcional(self):
        """
        Click en Checkbox feriado proporcional
        """
        self.checkbox.check(finiquito_individual_catalog.CHECKBOX_FERIADO_PROP)

    def click_label(self):
        """
        Click en el label Observaciones
        """
        self.button.click(finiquito_individual_catalog.LABEL_OBSERVACIONES)

    def click_ok(self):
        """
        Click en el botón Ok para calcular el finiquito individual
        """
        self.button.click(finiquito_individual_catalog.BUTTON_OK)

    def get_monto(self):
        """
        Retorna el monto a pagar del finiquito
        :return: monto
        """
        return self.input.get_text(finiquito_individual_catalog.INPUT_TOTAL)
