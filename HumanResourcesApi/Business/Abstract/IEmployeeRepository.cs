using HumanResourcesApi.Business.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HumanResourcesApi.Business.Abstract
{
    public interface IEmployeeRepository
    {
        Task Add(Employee dbItem);
        Task<List<Employee>> GetAllAsync();
        Task<Employee> Find(int id);
        Task Update(Employee dbItem);
        Task Remove(int id);
    }
}
