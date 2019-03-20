from expert.pages.formulario_indices_page import FormularioIndicesPage


class FormularioIndicesAction:
    """"
    La clase FormularioIndicesAction agrupa funcionalidades del formulario de creación de índices.
    """

    def __init__(self):
        self.formulario_indices_page = FormularioIndicesPage()

    def transforma_periodo_a_ames(self):
        """
        Toma la fecha del periodo desde el formulario de índices y la transforma al formato AMES (año mes)
        :return: Fecha del periodo en formato AMES (año mes)
        """
        PeriodoText = self.formulario_indices_page.get_periodo()
        PeriodoAmes = PeriodoText[6:10] + "-" + PeriodoText[3:5]
        return PeriodoAmes

    def llena_indices_sin_decimales(self):
        """
        Llena los valores de los índices que no tienen decimales. Tomando el valor por defecto
        y le suma una cantidad para que los índices no sean iguales a los del mes anterior.
        """
        UtmAnteriorText = self.formulario_indices_page.get_utm().replace(".", "")
        UtmNuevaInt = int(UtmAnteriorText) + int(250)
        self.formulario_indices_page.set_utm(UtmNuevaInt)

        SueldoAnteriorText = self.formulario_indices_page.get_sueldo_minimo().replace(".", "")
        SueldoNuevoInt = int(SueldoAnteriorText) + int(5000)
        self.formulario_indices_page.set_SueldoMinimo(SueldoNuevoInt)

    def llena_indices_con_decimales(self):
        """
        Llena los valores de los índices que sí tienen decimales. Tomando el valor por defecto
        y le suma una cantidad para que los índices no sean iguales a los del mes anterior.
        """
        UfAnteriorText1 = self.formulario_indices_page.get_uf().replace(".", "")
        UfAnteriorText2 = UfAnteriorText1.replace(",", ".")
        UfNuevaFloat1 = float(UfAnteriorText2) + float(3.53)
        UfNuevaFloat2 = str(UfNuevaFloat1).replace(".", ",")
        self.formulario_indices_page.set_uf(UfNuevaFloat2)

        TopeAfpAnteriorText1 = self.formulario_indices_page.get_topeafp().replace(".", "")
        TopeAfpAnteriorText2 = TopeAfpAnteriorText1.replace(",", ".")
        TopeAfpNuevaFloat1 = float(TopeAfpAnteriorText2) + float(0.23)
        TopeAfpNuevaFloat2 = str(TopeAfpNuevaFloat1).replace(".", ",")
        self.formulario_indices_page.set_topeafp(TopeAfpNuevaFloat2)

        TopeSecAnteriorText1 = self.formulario_indices_page.get_topesec().replace(".", "")
        TopeSecAnteriorText2 = TopeSecAnteriorText1.replace(",", ".")
        TopeSecNuevaFloat1 = float(TopeSecAnteriorText2) + float(0.25)
        TopeSecNuevaFloat2 = str(TopeSecNuevaFloat1).replace(".", ",")
        self.formulario_indices_page.set_topesec(TopeSecNuevaFloat2)

        VariacionIpcAnteriorText1 = self.formulario_indices_page.get_variacion_ipc().replace(".", "")
        VariacionIpcAnteriorText2 = VariacionIpcAnteriorText1.replace(",", ".")
        VariacionIpcNuevaFloat1 = float(VariacionIpcAnteriorText2) + float(0.33)
        VariacionIpcNuevaFloat2 = str(VariacionIpcNuevaFloat1).replace(".", ",")
        self.formulario_indices_page.set_variacion_ipc(VariacionIpcNuevaFloat2)

        FactorIpcAnteriorText1 = self.formulario_indices_page.get_factor_actualizacion_ipc().replace(".", "")
        FactorIpcAnteriorText2 = FactorIpcAnteriorText1.replace(",", ".")
        FactorIpcNuevaFloat1 = float(FactorIpcAnteriorText2) + float(2)
        FactorIpcNuevaFloat2 = str(FactorIpcNuevaFloat1).replace(".", ",")
        self.formulario_indices_page.set_factor_actualizacion_ipc(FactorIpcNuevaFloat2)
