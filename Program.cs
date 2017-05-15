using DBUpdater.DB;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using System;

namespace DBUpdater
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }

        private static BloggingContext GeDB(string connection)
        {
            var builder = new DbContextOptionsBuilder<BloggingContext>();
            builder.UseSqlServer(connection, b => b.MigrationsAssembly("DBUpdater"));
            return new BloggingContext(builder.Options);
        }

        public class BloggingContextFactory : IDbContextFactory<BloggingContext>
        {
            public BloggingContext Create(DbContextFactoryOptions options)
            {
                //if (!System.IO.File.Exists(CONN))
                //    throw new Exception("Connection string file missing: " + CONN);
                //string connection = System.IO.File.ReadAllLines(CONN).FirstOrDefault().Trim();
                //Console.WriteLine("Connection: " + connection);
                //return GeDB(connection);
                //return GeDB(@"Server=(localdb)\mssqllocaldb;Database=DBUpdater;Integrated Security=SSPI;MultipleActiveResultSets=true");
                return GeDB(@"Server=(localdb)\mssqllocaldb;Database=DBUpdater;User Id=dbupdater-dbo;Password=afri1123$$;MultipleActiveResultSets=true");
            }
        }
    }
}