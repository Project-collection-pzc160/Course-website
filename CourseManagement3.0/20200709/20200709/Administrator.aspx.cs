using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//author:林玉琴；
//create date:20200717
//update date:20200717
//description:管理员界面，可以修改选课状态（同意、拒绝），可以对课程信息进行多条件的筛选查询
//update date:2020/07/23  description：添加了到发布、删除、修改、和退出登录页面的跳转，进行了页面的美化

//author:彭子晨
//update date:2020/07/21  description:修改代码，实现管理员审核选课申请界面
//update date:2020/7/25   description:插入课程logo
namespace _20200709
{
    //author:彭子晨
    //update date:2020/07/21  description:管理员审核选课申请界面
    public partial class Administrator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSourceID = "SqlDataSource1";
            }
        }

        public void IsButtonEnabled()
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                string state = GridView1.Rows[i].Cells[3].Text;
                if (state != "待审核")
                {
                    LinkButton linkbutton1 = (LinkButton)GridView1.Rows[i].FindControl("LinkButton1");
                    LinkButton linkbutton2 = (LinkButton)GridView1.Rows[i].FindControl("LinkButton2");
                    linkbutton1.Enabled = false;
                    linkbutton2.Enabled = false;
                }
            }
        }//遍历gridview1中的选课申请，若是选课状态为失败或成功，则同意和拒绝按钮不可用

        protected void Button1_Click(object sender, EventArgs e)
        {
            string id = TextBox1.Text;
            string account = TextBox2.Text;
            if (id == "")
            {
                if (account == "")
                {
                    GridView1.DataSourceID = "";
                    GridView1.DataSourceID = "SqlDataSource1";
                }
                else
                {
                    GridView1.DataSourceID = "";
                    GridView1.DataSourceID = "SqlDataSource3";
                }
            }
            else
            {
                if(account == "")
                {
                    GridView1.DataSourceID = "";
                    GridView1.DataSourceID = "SqlDataSource2";
                }
                else
                {
                    GridView1.DataSourceID = "";
                    GridView1.DataSourceID = "SqlDataSource4";
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int row = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
            string id = GridView1.Rows[row].Cells[0].Text;
            string account = GridView1.Rows[row].Cells[2].Text;
            string state = "待审核";
            Data_access.UpdateUc1(account, id, state);

            string datasourceid = GridView1.DataSourceID;
            GridView1.DataSourceID = "";
            GridView1.DataSourceID = datasourceid;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            int row = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
            string id = GridView1.Rows[row].Cells[0].Text;
            string account = GridView1.Rows[row].Cells[2].Text;
            string state = "待审核";
            Data_access.UpdateUc2(account, id, state);

            string datasourceid = GridView1.DataSourceID;
            GridView1.DataSourceID = "";
            GridView1.DataSourceID = datasourceid;
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            IsButtonEnabled();
        }



        protected void Button2_Click1(object sender, EventArgs e)
        {
            Server.Transfer("Login.aspx");
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            Server.Transfer("AddCourse.aspx");
        }

        protected void Button4_Click1(object sender, EventArgs e)
        {
            Server.Transfer("DeleteCourse.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Server.Transfer("UpdateCourse.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Server.Transfer("Administrator.aspx");
        }
    }
}