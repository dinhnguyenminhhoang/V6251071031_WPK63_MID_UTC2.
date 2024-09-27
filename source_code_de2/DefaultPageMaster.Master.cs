using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace de1
{
    public partial class DefaultPageMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBeverageCategories();
            }
        }

        private void BindBeverageCategories()
        {
            using (var context = new QLDoUongEntities2())
            {
                var categories = context.Categories.Select(c => new
                {
                    CatID = c.CatID,
                    CatName = c.CatName,
                    BeverageCount = context.Beverages.Count(b => b.CatID == c.CatID) // Đếm số lượng đồ uống trong từng danh mục
                }).ToList();

                dlBeverageCategories.DataSource = categories;
                dlBeverageCategories.DataBind();
            }
        }
    }
}
