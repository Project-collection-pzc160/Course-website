using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _20200709
{

    //author:彭子晨
    //create date:2020/07/16   description:已选课程界面，可以进行查询已选课程信息
    //update date:2020/07/17   description:增加撤课功能
    //update date:2020/7/25   description:插入课程logo

    //author:林玉琴
    //update date:2020/07/23  description：修改了到专业课选课、通识课选课、已选课程页面的跳转，进行了页面的美化

    public partial class selected_courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["account"] = "lyq";
            if (!IsPostBack)
            {
                GridView1.DataSourceID = "SqlDataSource2";               
            }
            Label1.Text = Session["account"].ToString();
        }

        //按学年、学期查询
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList3.SelectedValue == "全部")
            {
                GridView1.DataSourceID = "";
                GridView1.DataSourceID = "SqlDataSource2";
            }
            else
            {
                GridView1.DataSourceID = "";
                GridView1.DataSourceID = "SqlDataSource3";
            }
            
        }

        //对已选课程进行撤课
        protected void Button1_Click2(object sender, EventArgs e)
        {
            //Session["account"] = "lyq";
            string account = Session["account"].ToString();
            int row = ((GridViewRow)((Button)sender).NamingContainer).RowIndex;
            string id = GridView1.Rows[row].Cells[0].Text;
            string state = "成功";
            Data_access.DeleteUc(account,id,state);
            if (GridView1.DataSourceID == "SqlDataSource2")
            {
                GridView1.DataSourceID = "";
                GridView1.DataSourceID = "SqlDataSource2";
            }
            else
            {
                GridView1.DataSourceID = "";
                GridView1.DataSourceID = "SqlDataSource3";
            }
        }


        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Server.Transfer("GeneralCourse.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Server.Transfer("ProfessionalCourse.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Server.Transfer("UserCourse.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("Login.aspx");
        }
    }
}