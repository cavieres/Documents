using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ADP.Payroll.Services.Vacation.API.Models
{
    public class VacationAgreement
    {
        public int CodConv { get; set; }
        public int Tramo { get; set; }
        public int Dias { get; set; }
        public int TipoDias { get; set; }
        public int TipoDiasDescr { get; set; }
        public int IniVigncia { get; set; }
        public int FinVigncia { get; set; }
    }
}
