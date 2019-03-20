from expert.pages.finiquito_individual_page import FiniquitoIndividualPage


class FiniquitoIndividualAction:
    """"
    La clase FichaColaboradorAction agrupa funcionalidades de la página de finiquito individual.
    """

    def __init__(self):
        self.finiquito_individual_page = FiniquitoIndividualPage()

    def generate_finiquito(self, fechadoc, fecharet, motivo, firma, observacion):
        """
        Llena la fecha de retiro, hace click en Feriado Proporcional y calcula el finiquito individual.
        :param fechadoc: fecha de documento.
        :param fecharet: fecha de retiro.
        :param motivo: motivo de retiro
        :param firma: firmante
        :param observacion: observaciones
        """
        self.finiquito_individual_page.set_fecha_documento(fechadoc)
        self.finiquito_individual_page.set_fecha_retiro(fecharet)
        self.finiquito_individual_page.set_motivo(motivo)
        self.finiquito_individual_page.set_firma(firma)
        self.finiquito_individual_page.set_observacion(observacion)
        self.finiquito_individual_page.check_feriado_proporcional()
        self.finiquito_individual_page.click_ok()
