using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADP.Payroll.Services.Vacation.API.Models
{
    public class VacationBalance
    {
        public int Anio { get; set; }
        public VacationType Ganados { get; set; }
        public VacationType Consumidos { get; set; }
        public VacationType Saldos { get; set; }
    }
}
