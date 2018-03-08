using HumanResourcesApi.Business.Abstract;
using HumanResourcesApi.Business.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HumanResourcesApi.Business.Concrete
{
    public class EmployeeRepository : IEmployeeRepository
    {
        private HumanResourcesContext _context;
        
        public EmployeeRepository(HumanResourcesContext context)
        {
            _context = context;
        }

        public async Task Add(Employee dbItem)
        {
            await _context.Employee.AddAsync(dbItem);
            await _context.SaveChangesAsync();
        }

        public async Task<List<Employee>> GetAllAsync()
        {
            return await _context.Employee.ToListAsync();
        }

        public async Task<Employee> Find(int id)
        {
            return await _context.Employee.Where(n => n.EmployeeId == id).SingleOrDefaultAsync();
        }

        public async Task Update(Employee dbItem)
        {
            _context.Entry(dbItem).State = EntityState.Modified;

            await _context.SaveChangesAsync();
        }

        public async Task Remove(int id)
        {
            var employee = await _context.Employee.SingleOrDefaultAsync(m => m.EmployeeId == id);

            _context.Employee.Remove(employee);
            await _context.SaveChangesAsync();
        }
    }
}
