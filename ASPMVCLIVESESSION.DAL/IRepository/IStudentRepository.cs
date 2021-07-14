using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPMVCLIVESESSION.MODEL;

namespace ASPMVCLIVESESSION.DAL.IRepository
{
    public interface IStudentRepository
    {
        Task<IEnumerable<Student>> GetStudents();
        Task<int> AddStudentInfo(Student student);
        Task<Student> GetStudentInfoByIdP(int stdId);
        Task<int> DeleteStudentInfoById(int id);
        Task<int> UpdateStudentInfo(Student student);

    }
}
