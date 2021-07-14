using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPMVCLIVESESSION.MODEL;
namespace ASPMVCLIVESESSION.BAL.IServvices
{
    public interface IStudentServices
    {
        Task<IEnumerable<Student>> GetStudents();
        Task<int> AddStudentInfo(Student student);
        Task<Student> GetStudentInfoById(int stdId);
        Task<int> DeleteStudentInfoById(int id);
        Task<int> UpdateStudentInfo(Student student);
    }
}
