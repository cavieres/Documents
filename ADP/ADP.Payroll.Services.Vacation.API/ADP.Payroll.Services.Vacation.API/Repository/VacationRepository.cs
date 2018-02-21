using ADP.Payroll.Services.Vacation.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADP.Payroll.Services.Vacation.API
{
    public class VacationRepository
    {
        public VacationType GetConsumidos()
        {
            // TODO: Buscar desde RVACACI. Por ahora todos son tipo 1.


            return new VacationType();
        }

        public AssociateInfo GetAssociateInfo()
        {
            return new AssociateInfo();
        }

        public List<VacationAgreement> GetVacationAgreementsByCodConv(int codConv)
        {
            return new List<VacationAgreement>();
        }

        public VacationSubtype GetGanadosAdicionales()
        {
            // TODO: Get from table RCONFVAC.
            return new VacationSubtype();
        }
    }
}
