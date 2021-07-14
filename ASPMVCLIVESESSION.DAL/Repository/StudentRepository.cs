using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPMVCLIVESESSION.DAL.IRepository;
using ASPMVCLIVESESSION.MODEL;
using ASPMVCLIVESESSION.DAL.Infrastructure;
using Dapper;
using System.Data;

namespace ASPMVCLIVESESSION.DAL.Repository
{
    public class StudentRepository: IStudentRepository
    {

        private IConnectionFactory _connectionFactory;
        public StudentRepository(IConnectionFactory connectionFactory)
        {
            _connectionFactory = connectionFactory;
        }
        public async Task<IEnumerable<Student>> GetStudents()
        {
            var query = "usp_GetStudentList";
            var data = await SqlMapper.QueryAsync<Student>(_connectionFactory.GetConnection, query, commandType: CommandType.StoredProcedure);
            return data;
        }

        public async Task<int> AddStudentInfo(Student student)
        {
            var query = "usp_AddStudentInfo";
            var param = new DynamicParameters();
            param.Add("@Name", student.Name);
            param.Add("@Email", student.Email);
            param.Add("@Address", student.Address);
            param.Add("@DOB", System.DateTime.Now);
            param.Add("@CreatedBy", student.CreatedBy);
            var iRowsAffected = await SqlMapper.ExecuteAsync(_connectionFactory.GetConnection, query, param, commandType: CommandType.StoredProcedure);
            return iRowsAffected;
        }

        public async Task<Student> GetStudentInfoByIdP(int stdId)
        {
            var query = "usp_StudentInfoById";
            var param = new DynamicParameters();
            param.Add("@Id", stdId);
            var dataInfo = await SqlMapper.QueryAsync<Student>(_connectionFactory.GetConnection, query, param, commandType: CommandType.StoredProcedure);
            return dataInfo.FirstOrDefault();
        }

        public async Task<int> DeleteStudentInfoById(int id)
        {
            var query = "usp_DeleteStudentInfoById";
            var param = new DynamicParameters();
            param.Add("@Id", id);
            var iRowsDeleted= await SqlMapper.ExecuteAsync(_connectionFactory.GetConnection, query, param, commandType: CommandType.StoredProcedure);
            return iRowsDeleted;
        }
        public async  Task<int> UpdateStudentInfo(Student student)
        {
            var query = "usp_UpdateStudentInfo";
            var param = new DynamicParameters();
            param.Add("@Id", student.Id);
            param.Add("@Name", student.Name);
            param.Add("@Email", student.Email);
            param.Add("@Address", student.Address);
            param.Add("@DOB", System.DateTime.Now);
            param.Add("@CreatedBy", student.CreatedBy);
            var iRowsAffected = await SqlMapper.ExecuteAsync(_connectionFactory.GetConnection, query, param, commandType: CommandType.StoredProcedure);
            return iRowsAffected;
        }
    }
}
