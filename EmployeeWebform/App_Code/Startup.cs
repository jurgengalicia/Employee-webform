using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EmployeeWebform.Startup))]
namespace EmployeeWebform
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
