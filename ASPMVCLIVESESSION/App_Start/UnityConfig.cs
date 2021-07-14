using ASPMVCLIVESESSION.BAL.IServvices;
using ASPMVCLIVESESSION.BAL.Services;
using ASPMVCLIVESESSION.DAL.Infrastructure;
using ASPMVCLIVESESSION.DAL.IRepository;
using ASPMVCLIVESESSION.DAL.Repository;
using System.Web.Mvc;
using Unity;
using Unity.Mvc5;

namespace ASPMVCLIVESESSION
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer();
            container.RegisterType<IConnectionFactory, ConnectionFactory>();
            container.RegisterType<IStudentRepository, StudentRepository>();
            container.RegisterType<IStudentServices, StudentServices>();
            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }
    }
}