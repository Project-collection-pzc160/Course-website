using System.Data.SqlClient;
using System.EnterpriseServices;

namespace _20200709
{
    //author:彭子晨
    //create date:2020/07/11  description:用于访问数据库、进行数据操作的封装类 
    //update date:2020/07/12  description:增加对用户表操作的函数
    //update date:2020/07/15  description:增加对基本课程表、专业课视图、通识课视图和用户课程视图操作的函数
    //update date:2020/07/16  description:增加InsertUc函数，向选课表中插入用户名、课头号
    //update date:2020/07/17  description:增加DeleteUc函数，删除选课表中的数据
    //update date:2020/07/18  description:增加QueryUc1、 QueryUc2函数，判断选课状态是否为“待审核”或“成功”和选课状态是否为“成功”
    //update date:2020/07/21  description:增加UpdateUc1、UpdateUc2、DeleteCourses、QueryCourseId函数
    //update date:2020/07/22  description:增加QueryCourses、UpdateCourses1、UpdateCourses2函数
    //update date:2020/07/23  description:修改UpdateData、UpdateState函数
    

    //author: 林玉琴
    //update date:2020/07/15 
    //description:修改了查询数据库某数据是否存在的函数 QueryData , 增加了UpdateData修改数据函数

    public class Data_access
    {
        //打开数据库连接
        public static SqlConnection GetConnection()
        {
            SqlConnection connection = new SqlConnection(
                System.Configuration.ConfigurationManager.ConnectionStrings["sqlcon"].ToString());
            connection.Open();
            return connection;
        } 


        //对用户表操作
        public static void InsertUsers(string account, string password)
        {
            using (SqlConnection connection = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand
                ("insert into users(account,password) values(@account,@password)", connection))
                {
                    cmd.Prepare();
                    cmd.Parameters.AddWithValue("@account", account);
                    cmd.Parameters.AddWithValue("@password", password); //使用参数，防止sql注入攻击
                    cmd.ExecuteNonQuery();
                }
            }
        } //插入新的用户数据

        public static string UpdateData(string a,string b)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["sqlcon"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("update users set password=@password where email=@email", conn);
                cmd.Parameters.AddWithValue("password", a);
                cmd.Parameters.AddWithValue("@email", b);
                cmd.ExecuteNonQuery();
                return "1";
            }
            catch
            {
                return "2";
            }
            finally
            {
                conn.Close();
            }
        }//修改数据表中某数据

        public static string UpdateState(string a, string b)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["sqlcon"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("update uc set state='" + a + "' where courseid='" + b + "'", conn);
                cmd.ExecuteNonQuery();
                return "1";
            }
            catch
            {
                return "2";
            }
            finally
            {
                conn.Close();
            }
        }//修改数据表中某数据

        public static string QueryData(string a,string b)
        {
            //a = b;
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["sqlcon"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select count(*) from users where " + b + "=@"+b, conn);//查询邮箱是否已存在
                cmd.Parameters.AddWithValue("@"+b, a);
                cmd.Parameters["@"+b].Value = a;
                int count = (int)cmd.ExecuteScalar();
                if (count > 0)
                {
                    return "1";
                }
                else
                {
                    return "2";//不存在
                }
            }
            catch
            {
                return "3";//异常
            }
            finally
            {
                conn.Close();
            }
        } //查询某数据是否存在，a表示要查询的数据，b表示表中所在列的名字

        public static bool QueryPassword(string account, string password)
        {
            using (SqlConnection connection = GetConnection())
            {
                string stm = "select * from users where account=@account";
                using (SqlCommand cmd = new SqlCommand(stm, connection))
                {
                    cmd.Parameters.AddWithValue("@account", account);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.GetString(1).Equals(password))
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            }
        } //查询用户密码是否输入正确


        //对课程表操作
        public static bool QueryCourses(string id)
        {
            using (SqlConnection connection = GetConnection())
            {
                string stm = "select * from bcourses where id=@id";
                using (SqlCommand cmd = new SqlCommand(stm, connection))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            }
        }//查询课程信息是否存在

        public static void InsertCourses1(string id, string cname, double credit, string tname,
          string academy, string major, int grade, string schoolyear, int schoolterm, string type,string school)
        {
            using (SqlConnection connection = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand
                ("insert into bcourses(id,cname,credit,tname,academy,major,grade,schoolyear,schoolterm,type,school)" +
                " values(@id,@cname,@credit,@tname,@academy,@major,@grade,@schoolyear,@schoolterm,@type,@school)", connection))
                {
                    cmd.Prepare();
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@cname", cname);
                    cmd.Parameters.AddWithValue("@credit", credit);
                    cmd.Parameters.AddWithValue("@tname", tname);
                    cmd.Parameters.AddWithValue("@schoolyear", schoolyear);
                    cmd.Parameters.AddWithValue("@schoolterm", schoolterm);
                    cmd.Parameters.AddWithValue("@academy", academy);
                    cmd.Parameters.AddWithValue("@major", major);
                    cmd.Parameters.AddWithValue("@type", type);
                    cmd.Parameters.AddWithValue("@grade", grade);
                    cmd.Parameters.AddWithValue("@school", school);
                    cmd.ExecuteNonQuery();
                }
            }
        } //插入专业课课程信息

        public static void InsertCourses2(string id, string cname, double credit, string tname,
         string academy, string schoolyear, int schoolterm, string type,string school)
        {
            using (SqlConnection connection = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand
                ("insert into bcourses(id,cname,credit,tname,academy,schoolyear,schoolterm,type,school)" +
                " values(@id,@cname,@credit,@tname,@academy,@schoolyear,@schoolterm,@type,@school)", connection))
                {
                    cmd.Prepare();
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@cname", cname);
                    cmd.Parameters.AddWithValue("@credit", credit);
                    cmd.Parameters.AddWithValue("@tname", tname);
                    cmd.Parameters.AddWithValue("@schoolyear", schoolyear);
                    cmd.Parameters.AddWithValue("@schoolterm", schoolterm);
                    cmd.Parameters.AddWithValue("@academy", academy);
                    cmd.Parameters.AddWithValue("@type", type);
                    cmd.Parameters.AddWithValue("@school", school);
                    cmd.ExecuteNonQuery();
                }
            }
        } //插入通识课课程信息

        public static void UpdateCourses1(string id, string cname, double credit, string tname,
          string academy, string major, int grade, string schoolyear, int schoolterm,string school)
        {
            using (SqlConnection connection = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand
                ("update bcourses set cname=@cname,credit=@credit,tname=@tname,academy=@academy,major=@major," +
                "grade=@grade,schoolyear=@schoolyear,schoolterm=@schoolterm,school=@school where id=@id", connection))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@cname", cname);
                    cmd.Parameters.AddWithValue("@credit", credit);
                    cmd.Parameters.AddWithValue("@tname", tname);
                    cmd.Parameters.AddWithValue("@schoolyear", schoolyear);
                    cmd.Parameters.AddWithValue("@schoolterm", schoolterm);
                    cmd.Parameters.AddWithValue("@academy", academy);
                    cmd.Parameters.AddWithValue("@major", major);
                    cmd.Parameters.AddWithValue("@grade", grade);
                    cmd.Parameters.AddWithValue("@school", school);
                    cmd.ExecuteNonQuery();
                }
            }
        }//修改专业课课程信息

        public static void UpdateCourses2(string id, string cname, double credit, string tname,
          string academy, string schoolyear, int schoolterm,string school)
        {
            using (SqlConnection connection = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand
                ("update bcourses set cname=@cname,credit=@credit,tname=@tname,academy=@academy," +
                "schoolyear=@schoolyear,schoolterm=@schoolterm,school=@school where id=@id", connection))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@cname", cname);
                    cmd.Parameters.AddWithValue("@credit", credit);
                    cmd.Parameters.AddWithValue("@tname", tname);
                    cmd.Parameters.AddWithValue("@schoolyear", schoolyear);
                    cmd.Parameters.AddWithValue("@schoolterm", schoolterm);
                    cmd.Parameters.AddWithValue("@academy", academy);
                    cmd.Parameters.AddWithValue("@school", school);
                    cmd.ExecuteNonQuery();
                }
            }
        }//修改通识课课程信息

        public static void DeleteCourses(string id)
        {
            using (SqlConnection connection = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand
                ("delete from bcourses where id=@id", connection))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                }
            }
        }//根据课头号删除课程信息

        public static SqlDataReader QueryCourseId(string id)
        {
            SqlConnection connection = GetConnection();
            string stm = "select * from bcourses where id=@id";
            using (SqlCommand cmd = new SqlCommand(stm, connection))
            {
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader reader = cmd.ExecuteReader();
                return reader;
            }
        }//根据课头号查询课程信息


        //对专业课视图操作
        public static SqlDataReader QueryPcourseMajor(string academy,string major,int grade)
        {
            using (SqlConnection connection = GetConnection())
            {
                string stm = "select * from pcourses where academy=@academy and major=@major and grade=@grade";
                using (SqlCommand cmd = new SqlCommand(stm, connection))
                {
                    cmd.Parameters.AddWithValue("@academy", academy);
                    cmd.Parameters.AddWithValue("@major", major);
                    cmd.Parameters.AddWithValue("@grade", grade);
                    SqlDataReader reader = cmd.ExecuteReader();
                    return reader;
                }
            }
        }//按院系、专业、年级查询专业课课程信息

        public static SqlDataReader QueryPcourseCame(int grade, string cname)
        {
            using (SqlConnection connection = GetConnection())
            {
                string stm = "select * from pcourses where cname=@cname and grade=@grade";
                using (SqlCommand cmd = new SqlCommand(stm, connection))
                {
                    cmd.Parameters.AddWithValue("@cname", cname);
                    cmd.Parameters.AddWithValue("@grade", grade);
                    SqlDataReader reader = cmd.ExecuteReader();
                    return reader;
                }
            }
        }//按年级、课程名查询专业课课程信息


        //对通识课视图操作
        public static SqlDataReader QueryGcourseCname(string cname)
        {
               SqlConnection connection = GetConnection();
                string stm = "select * from gcourses where cname like '%' + @cname + '%'";
                using (SqlCommand cmd = new SqlCommand(stm, connection))
                {
                    cmd.Parameters.AddWithValue("@cname", cname);
                    SqlDataReader reader = cmd.ExecuteReader();
                    return reader;
                }
            
        }//按课程名模糊查询通用课课程信息

        public static SqlDataReader QueryGcourseTname(string tname)
        {
            using (SqlConnection connection = GetConnection())
            {
                string stm = "select * from gcourses where tname=@tname";
                using (SqlCommand cmd = new SqlCommand(stm, connection))
                {
                    cmd.Parameters.AddWithValue("@tname", tname);
                    SqlDataReader reader = cmd.ExecuteReader();
                    return reader;
                }
            }
        }//按教师名查询通用课课程信息


        //对已选课程视图操作
        public static SqlDataReader QueryUcourseDate(string schoolyear, int schoolterm)
        {
            using (SqlConnection connection = GetConnection())
            {
                string stm = "select * from ucourses where schoolyear=@schoolyear and schoolterm=@schoolterm";
                using (SqlCommand cmd = new SqlCommand(stm, connection))
                {
                    cmd.Parameters.AddWithValue("@schoolyear", schoolyear);
                    cmd.Parameters.AddWithValue("@schoolterm", schoolterm);
                    SqlDataReader reader = cmd.ExecuteReader();
                    return reader;
                }
            }
        }//按学年、学期查询已选课程


        //对选课表操作
        public static void InsertUc(string account,string id,string state)
        {
            using (SqlConnection connection = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand
                ("insert into uc(account,courseid,state) values(@account,@courseid,@state)", connection))
                {
                    cmd.Prepare();
                    cmd.Parameters.AddWithValue("@account", account);
                    cmd.Parameters.AddWithValue("@courseid", id);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.ExecuteNonQuery();
                }
            }
        }//向选课表中插入用户名、课头号、选课状态

        public static void DeleteUc(string account, string id,string state)
        {
            using (SqlConnection connection = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand
                ("delete from uc where account=@account and courseid=@courseid and state=@state", connection))
                {
                    cmd.Parameters.AddWithValue("@account", account);
                    cmd.Parameters.AddWithValue("@courseid", id);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.ExecuteNonQuery();
                }
            }
        }//删除选课表中的数据

        public static bool QueryUc1(string account,string id)
        {
            using (SqlConnection connection = GetConnection())
            {
                string stm = "select * from uc where account=@account and courseid=@courseid and (state=@state1 or state=@state2)";
                using (SqlCommand cmd = new SqlCommand(stm, connection))
                {
                    cmd.Parameters.AddWithValue("@account", account);
                    cmd.Parameters.AddWithValue("@courseid", id);
                    cmd.Parameters.AddWithValue("@state1","待审核" );
                    cmd.Parameters.AddWithValue("@state2", "成功");
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        return reader.HasRows;
                    }
                }
            }
        }//选课状态是否为“待审核”或“成功”

        public static bool QueryUc2(string account, string id)
        {
            using (SqlConnection connection = GetConnection())
            {
                string stm = "select * from uc where account=@account and courseid=@courseid and state=@state";
                using (SqlCommand cmd = new SqlCommand(stm, connection))
                {
                    cmd.Parameters.AddWithValue("@account", account);
                    cmd.Parameters.AddWithValue("@courseid", id);
                    cmd.Parameters.AddWithValue("@state", "成功");
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        return reader.HasRows;
                    }
                }
            }
        }//选课状态是否为“成功”

        public static void UpdateUc1(string account, string id,string state)
        {
            using (SqlConnection connection = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand
                ("update uc set state='成功' where account=@account and courseid=@courseid and state=@state", connection))
                {
                    cmd.Parameters.AddWithValue("@account", account);
                    cmd.Parameters.AddWithValue("@courseid", id);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.ExecuteNonQuery();
                }
            }
        }//将选课状态修改为成功

        public static void UpdateUc2(string account, string id, string state)
        {
            using (SqlConnection connection = GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand
                ("update uc set state='失败' where account=@account and courseid=@courseid and state=@state", connection))
                {
                    cmd.Parameters.AddWithValue("@account", account);
                    cmd.Parameters.AddWithValue("@courseid", id);
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.ExecuteNonQuery();
                }
            }
        }//将选课状态修改为失败
    }
}