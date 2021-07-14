using System.Data;

namespace ASPMVCLIVESESSION.DAL.Infrastructure
{
    public interface IConnectionFactory
    {
        IDbConnection GetConnection { get; }
    }
}
