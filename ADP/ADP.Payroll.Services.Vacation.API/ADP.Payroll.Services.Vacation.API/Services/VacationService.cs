using ADP.Payroll.Services.Vacation.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADP.Payroll.Services.Vacation.API.Services
{
    public class VacationService
    {
        public List<VacationBalance> GetBalance(List<int> years)
        {
            var associateBalance = new List<VacationBalance>();
            
            foreach (int year in years) {
                associateBalance.Add(new VacationBalance() {
                    Anio = year,
                    Ganados = GetGanados(),
                    Consumidos = GetConsumidos(),
                    Saldos = GetSaldos(GetGanados(), GetConsumidos())
                });
            }

            return associateBalance;
        }

        private VacationType GetGanados()
        {
            // TODO: Buscar legales corridos y legales habiles según lógica
            // de documento. Condición final desde RVACSCONV (vacaciones por
            // convenio).

            // TODO: Buscar adic. corr. y adic. hab. desde tabla RCONVAC.

            return new VacationType() {
                Legales = GetGanadosLegales(),
                Adicionales = GetGanadosAdicionales()
            };
        }

        private VacationSubtype GetGanadosLegales()
        {
            var repo = new VacationRepository();
            var associateInfo = repo.GetAssociateInfo();

            // TODO: using current year or process date?
            var halfCurrentYear = new DateTime(DateTime.Now.Year, 6, 1);
            var dateToCalculateDays = new DateTime(DateTime.Now.Year, 8, 15);

            // Get oldest date.
            DateTime oldestDate = associateInfo.fecha_ing;

            if (!NullDates.Values.Contains(associateInfo.vac_anre))
                oldestDate = (DateTime.Compare(associateInfo.vac_anre, associateInfo.fecha_ing) < 0 ? 
                    associateInfo.vac_anre : associateInfo.fecha_ing);
            else if (!NullDates.Values.Contains(associateInfo.fecha_xtr))
                oldestDate = (DateTime.Compare(associateInfo.fecha_ing, associateInfo.fecha_xtr) < 0 ?
                    associateInfo.fecha_ing : associateInfo.fecha_xtr);

            // Get days balance.
            var totalDays = 0;

            // TODO: using current year or process date?
            if (associateInfo.fecha_ing.Year == DateTime.Now.Year)
            {
                if (DateTime.Compare(associateInfo.fecha_ing, halfCurrentYear) > 0)
                {
                    // Extracting portional days, for each month from hiring date to: PROCESS MONTH OR DECEMBER?.
                    for (int m = dateToCalculateDays.Month; m <= associateInfo.fecha_ing.Month; m++)
                        totalDays = DateTime.DaysInMonth(dateToCalculateDays.Year, m) - (IsSaturdayHoliday() ? 0 : 1);

                }
                else
                {
                    // TODO; Preguntar a Mariana.
                }
            }
            else
            {
                var totalYears = DateTime.Now.Year - associateInfo.fecha_ing.Year;



                var vacationAgreements = GetVacationAgreementsByCodConv(associateInfo.vacconadi).
                    Where(vac => vac.Tramo < totalYears && vac.Tramo > totalYears).ToList();

                //var vacationAgreement = vacationAgreements.Where(vac => vac.Tramo < totalYears && vac.Tramo > totalYears).FirstOrDefault();

                if (vacationAgreements.Count > 1)
                    throw new Exception(string.Format("Existe más de un convenio para el tramo de años del colaborador ({0}).", totalYears.ToString()));

                totalDays = vacationAgreements.First().Dias;
            }

            // TODO: determinar el tipo de dia que se esta ingresando (legales corridos o legales habiles).
            // Por ahora, todos los dias son legales corridos.
            return new VacationSubtype() {
                Corridos = totalDays };
        }

        private VacationSubtype GetGanadosAdicionales()
        {
            return new VacationRepository().GetGanadosAdicionales();
        }

        private List<VacationAgreement> GetVacationAgreementsByCodConv(int codConv)
        {
            return new VacationRepository().GetVacationAgreementsByCodConv(codConv);
        }

        private VacationType GetConsumidos()
        {
            return new VacationRepository().GetConsumidos();
        }

        private VacationType GetSaldos(VacationType ganados, VacationType consumidos)
        {
            return new VacationType() {
                Legales = new VacationSubtype {
                    Corridos = ganados.Legales.Corridos - consumidos.Legales.Corridos,
                    Habiles = ganados.Legales.Habiles - consumidos.Legales.Habiles },
                Adicionales = new VacationSubtype {
                    Corridos = ganados.Adicionales.Corridos - consumidos.Adicionales.Corridos,
                    Habiles = ganados.Adicionales.Habiles - consumidos.Adicionales.Habiles
                }
            };
        }

        public bool IsSaturdayHoliday()
        {
            return true;
        }
    }
}
