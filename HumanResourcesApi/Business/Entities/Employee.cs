using System;
using System.Collections.Generic;

namespace HumanResourcesApi.Business.Entities
{
    public partial class Employee
    {
        public int EmployeeId { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string BirthPlace { get; set; }
        public DateTime BirthDate { get; set; }
        public string Gender { get; set; }
        public string Status { get; set; }
        public short? Children { get; set; }
        public string HomeAddress { get; set; }
        public string City { get; set; }
        public string Province { get; set; }
        public string PostalCode { get; set; }
        public string HomePhone { get; set; }
        public string CellPhone { get; set; }
        public string Email { get; set; }
        public DateTime JoinDate { get; set; }
        public string BankName { get; set; }
        public string AccountNumberName { get; set; }
        public string AccountNumber { get; set; }
        public string IdentityCard { get; set; }
        public string Npwp { get; set; }
        public string FamilyCard { get; set; }
        public bool Active { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }

        public EmergencyContact EmergencyContact { get; set; }
    }
}
