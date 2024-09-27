using System;
using System.Linq;
using System.Web.UI;

namespace de1
{
    public partial class Category : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int catId;
                if (int.TryParse(Request.QueryString["CatID"], out catId))
                {
                    BindBeverages(catId);
                }
                else
                {
                    Response.Redirect("ErrorPage.aspx");
                }
            }
        }

        private void BindBeverages(int catId)
        {
            using (var context = new QLDoUongEntities2())
            {
                var beverages = context.Beverages
                    .Where(b => b.CatID == catId)
                    .ToList();

                try
                {
                    BeverageListView.DataSource = beverages;
                    BeverageListView.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }

            }
        }
        protected void BeverageDataPager_PagePropertiesChanged(object sender, EventArgs e)
        {
            int catId;
            if (int.TryParse(Request.QueryString["CatID"], out catId))
            {
                BindBeverages(catId);
            }
            else
            {
                Response.Redirect("ErrorPage.aspx");
            }
        }
    }
}
