using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace EFGetStarted.AspNetCore.NewDb.Models
{
    public class Blog
    {
        public int BlogId { get; set; }
        public string Link { get; set; } // Renamed migration 2

        public List<Post> Posts { get; set; }
    }

    public class Post
    {
        public int PostId { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string Author { get; set; } // Added migration 2

        public int BlogId { get; set; }
        public Blog Blog { get; set; }
    }

    public class Rating // Added migration 2
    {
        public int PostId { get; set; }
        public Post Post { get; set; }
        public int Score { get; set; }
    }
}