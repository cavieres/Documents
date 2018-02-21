using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADP.Payroll.Services.Vacation.API.Models
{
    public class VacationType
    {
        public VacationSubtype Legales { get; set; }
        public VacationSubtype Adicionales { get; set; }
    }
}
