using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
public class Registerations : System.Web.Services.WebService
{
    public Registerations()
    {
        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    /* Specialist Operation */
    [WebMethod]
    public List<Response> SpecOperation(string specID, string specName, string status, string userID, string op)
    {
        List<Response> result = new List<Response>();
        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SpecOperation", connection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@specID", SqlDbType.VarChar, 50).Value = specID;
                cmd.Parameters.Add("@specName", SqlDbType.VarChar, 100).Value = specName;
                cmd.Parameters.Add("@status", SqlDbType.VarChar, 100).Value = status;
                cmd.Parameters.Add("@userID", SqlDbType.VarChar, 100).Value = userID;
                cmd.Parameters.Add("@op", SqlDbType.VarChar, 100).Value = op;
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    result.Add(new Response()
                    {
                        Msg = Convert.ToString(dr["Msg"]),
                    });
                }
            }
        }
        catch (Exception e)
        {
           // MessageBox.Show("Operation Error and " + e.ToString());
        }
        return result;
    }

    /* Get All Specialist */
    [WebMethod]
    public List<Specialist> getAllSpec()
    {
        List<Specialist> Result = new List<Specialist>();
        try
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                {
                    SqlCommand Cmd = new SqlCommand("getAllSpec", conn);
                    Cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader dr = Cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        Result.Add(new Specialist
                        {
                            SQN = Convert.ToInt32(dr["Sqn"]),
                            specID = dr["specID"].ToString(),
                            specName = dr["specName"].ToString(),
                            status = dr["status"].ToString(),
                            actionDate = dr["actionDate"].ToString(),

                        });
                    }
                }
            }
        }
        catch (Exception ex)
        {
           // MessageBox.Show("Connection Wrong" + ex.Message);
        }
        return Result;
    }

}
