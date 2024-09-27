using System;
using System.Linq;
using System.Web.UI;

namespace de1
{
    public partial class SearchBeverage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            decimal minPrice;
            decimal maxPrice;

            if (!decimal.TryParse(txtMinPrice.Text, out minPrice))
            {
                minPrice = 0;
            }
            if (!decimal.TryParse(txtMaxPrice.Text, out maxPrice))
            {
                maxPrice = decimal.MaxValue; 
            }

            BindBeverages(name, minPrice, maxPrice);
        }

        private void BindBeverages(string name, decimal minPrice, decimal maxPrice)
        {
            using (var context = new QLDoUongEntities2())
            {
                var beverages = context.Beverages
                    .Where(b => b.Name.Contains(name) && b.Price >= minPrice && b.Price <= maxPrice)
                    .ToList();

                if (beverages.Any())
                {
                    BeverageListView.DataSource = beverages;
                    BeverageListView.DataBind();
                    lblMessage.Text = ""; 
                }
                else
                {
                    lblMessage.Text = "No beverages found matching your criteria.";
                    BeverageListView.DataSource = null; 
                    BeverageListView.DataBind();
                }
            }
        }
    }
}
