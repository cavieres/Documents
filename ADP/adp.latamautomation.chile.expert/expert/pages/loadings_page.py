from expert.catalogs import loadings_catalog
from scriptize.components.page_element import PageObjects


class LoadingsPage(PageObjects):
    """
    La clase 'LoadingsPage' es reponsable de la interacción con los componentes de loading.
    """

    def wait_spinner_disappear(self):
        """
        Espera el spinner desaparecer.
        """
        self.wait_for_element_disappear(loadings_catalog.LOADING_SPINNER)
        self.wait_for_element_disappear(loadings_catalog.LOADING)
