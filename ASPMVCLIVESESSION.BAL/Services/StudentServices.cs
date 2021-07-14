using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPMVCLIVESESSION.BAL.IServvices;
using ASPMVCLIVESESSION.MODEL;
using ASPMVCLIVESESSION.DAL.IRepository;

namespace ASPMVCLIVESESSION.BAL.Services
{
    public class StudentServices: IStudentServices
    {
        private IStudentRepository _studentRepository;
        public StudentServices(IStudentRepository studentRepository)
        {
            _studentRepository = studentRepository;
        }
        public async Task<IEnumerable<Student>> GetStudents()
        {
            return await _studentRepository.GetStudents();
        }

        public async Task<int> AddStudentInfo(Student student)
        {
            return await _studentRepository.AddStudentInfo(student);
        }

        public async Task<Student> GetStudentInfoById(int stdId)
        {
            return await _studentRepository.GetStudentInfoByIdP(stdId);
        }

        public async Task<int> DeleteStudentInfoById(int id)
        {
            return await _studentRepository.DeleteStudentInfoById(id);
        }

        public async Task<int> UpdateStudentInfo(Student student)
        {
            return await _studentRepository.UpdateStudentInfo(student);
        }
    }
}
