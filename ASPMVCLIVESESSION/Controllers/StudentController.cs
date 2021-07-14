using ASPMVCLIVESESSION.BAL.IServvices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASPMVCLIVESESSION.MODEL;
using System.Threading.Tasks;

namespace ASPMVCLIVESESSION.Controllers
{
    public class StudentController : Controller
    {
        private IStudentServices _studentServices;
        public StudentController(IStudentServices studentServices)
        {
            _studentServices = studentServices;
        }
        public async Task<ActionResult> Students()
        {
            IEnumerable<Student> studentList =await _studentServices.GetStudents();
            return View(studentList);
        }

        [HttpGet]
        public ActionResult AddStudentInfo()
        {
            return View();
        }
        [HttpPost]
        public async Task<ActionResult> AddStudentInfo(Student student)
        {
            int iRows = await _studentServices.AddStudentInfo(student);
            if (iRows>0)
            {
                return RedirectToAction("Students");
            }
            return RedirectToAction("AddStudentInfo");
        }

        [HttpGet]
        public async Task<ActionResult> GetStudentInfoById(int id)
        {
            Student studentInfo = await _studentServices.GetStudentInfoById(id);
            return View(studentInfo);
        }

     
        public async Task<ActionResult> DeleteStudentInfoById(int id)
        {
            int iRows = await _studentServices.DeleteStudentInfoById(id);
            if (iRows > 0)
            {
                return RedirectToAction("Students");
            }
            return RedirectToAction("Students");
        }

        public async Task<ActionResult> UpdateStudentInfoById(int id)
        {
            Student studentInfo = await _studentServices.GetStudentInfoById(id);
            return View(studentInfo);
        }

        [HttpPost]
        public async Task<ActionResult> UpdateStudentInfo(Student student)
        {
            int iRows = await _studentServices.UpdateStudentInfo(student);
            if (iRows > 0)
            {
                return RedirectToAction("Students");
            }
            return RedirectToAction("UpdateStudentInfoById", student.Id);
        }
    }
}