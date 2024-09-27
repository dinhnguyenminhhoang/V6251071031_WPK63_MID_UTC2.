using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace de1
{
    public partial class ManageBeverage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBeverages();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (var context = new QLDoUongEntities2())
            {
                var beverage = new Beverage
                {
                    Name = txtName.Text,
                    Description = txtDescription.Text,
                    ImageFilePath = txtImage.Text,
                    Price = decimal.Parse(txtPrice.Text),
                    NumsLike = int.Parse(txtLikes.Text)
                };

                context.Beverages.Add(beverage);
                context.SaveChanges();
            }

            BindBeverages();
            ClearForm();
        }

        private void BindBeverages()
        {
            using (var context = new QLDoUongEntities2())
            {
                BeverageGridView.DataSource = context.Beverages.ToList();
                BeverageGridView.DataBind();
            }
        }

        private void ClearForm()
        {
            txtName.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtImage.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtLikes.Text = string.Empty;
        }

        protected void BeverageGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int beverageId = Convert.ToInt32(BeverageGridView.DataKeys[index].Value);

                using (var context = new QLDoUongEntities2())
                {
                    var beverage = context.Beverages.Find(beverageId);
                    context.Beverages.Remove(beverage);
                    context.SaveChanges();
                }

                BindBeverages();
            }
            else if (e.CommandName == "Edit")
            {
            }
        }
    }
}
