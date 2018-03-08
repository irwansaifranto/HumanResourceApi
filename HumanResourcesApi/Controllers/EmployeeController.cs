
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HumanResourcesApi.Business.Abstract;
using HumanResourcesApi.Business.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HumanResourcesApi.Controllers
{
    [Produces("application/json")]
    [Route("api/Employee")]
    public class EmployeeController : Controller
    {
        private readonly IEmployeeRepository RepoEmployee;
        public EmployeeController(IEmployeeRepository repoEmployee)
        {
            RepoEmployee = repoEmployee;
        }

        // GET: api/Employee
        [HttpGet]
        public async Task<IEnumerable<Employee>> Get()
        {
            return await RepoEmployee.GetAllAsync();
        }

        // GET: api/Employee/5
        [HttpGet("{id}", Name = "Get")]
        public async Task<Employee> Get(int id)
        {
            return await RepoEmployee.Find(id);
        }
        
        // POST: api/Employee
        [HttpPost]
        public async Task<IActionResult> Post([FromBody]Employee model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    await RepoEmployee.Add(model);
                } catch (Exception e)
                {
                    return new ContentResult
                    {
                        Content = e.Message.ToString(),
                        StatusCode = 500
                    };
                }
            } else
            {
                return BadRequest(ModelState);
            }

            return new ContentResult
            {
                Content = "Data Saved",
                StatusCode = 200
            };
        }
        
        // PUT: api/Employee/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put([FromRoute]int id, [FromBody]Employee model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    await RepoEmployee.Update(model);
                } catch (Exception e)
                {
                    return new ContentResult
                    {
                        Content = e.Message.ToString(),
                        StatusCode = 500
                    };
                }
            }

            return new ContentResult
            {
                Content = "Data Updated",
                StatusCode = 200
            };
        }
        
        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            Employee employee = await RepoEmployee.Find(id);
            if (employee != null)
            {
                await RepoEmployee.Remove(id);
            } else
            {
                return new ContentResult
                {
                    Content = "Data Fail to Delete !!",
                    StatusCode = 500
                };
            }

            return new ContentResult
            {
                Content = "Success Delete Data",
                StatusCode = 200
            };
        }
    }
}
