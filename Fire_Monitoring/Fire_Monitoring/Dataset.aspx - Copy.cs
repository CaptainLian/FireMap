using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Tweetinvi;
using Tweetinvi.Parameters;

namespace Fire_Monitoring
{
    public partial class Dataset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Auth.SetUserCredentials("Y7d5SPf2MlkHMkGbOWt7kPAyv", "RHFP3uVRSBDSnc7HqZs8qPhU2L6ZYKpd0FFYNgYDOYxgxTfAKJ", "858280990313263104-EZPA93QrwsoIOk9teT9NzgPcE3fTeTU", "K8Zi85UJBZMUfI06BMQVkYZNZ9lnVDYm9IyOInNLwsIxf");
            // Publish the Tweet "Hello World" on your Timeline
            Tweet.PublishTweet("#FireActive!");
        }

        public class CoordinatesDTO 
        {
            public double Latitude { get; set; }
            public double Longitude { get; set; }

            public CoordinatesDTO() { }

            /// <summary>
            /// Create coordinates with its longitude and latitude
            /// </summary>
            public CoordinatesDTO(double longitude, double latitude)
            {
                Longitude = longitude;
                Latitude = latitude;
            }

            [JsonProperty("coordinates")]
            private List<double> _coordinatesSetter
            {
                set
                {
                    if (value != null)
                    {
                        Longitude = value[0];
                        Latitude = value[1];
                    }
                }
            }
        }

        protected void btnSearch_Click1(object sender, EventArgs e)
        {
            var searchParameter = new SearchTweetsParameters("#FireActive");
            {
                //cmd.Parameters.AddWithValue("@end", end.AddDays(1).AddSeconds(-1));
                //Until = 

            }
            var tweets = Search.SearchTweets(searchParameter);

            viewtweets.DataSource = tweets;
            viewtweets.DataBind();
           
            //foreach (var item in tweets.ToList())
            //{
            //    if (true)
            //    {
            //        Array.ForEach(item.GetType().GetProperties(), p => d.Columns.Add(new DataColumn(p.Name)));

            //    }
            //    var newe = d.NewRow();
            //    Array.ForEach(item.GetType().GetProperties(), p => newe[p.Name] = p.GetValue(item, null));
            //    d.Rows.Add(newe);
            //}
        }


    }
}