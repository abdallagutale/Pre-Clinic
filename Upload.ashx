<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.Web;

public class Upload : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.Files.Count > 0)
        {
            System.Random randomInt = new System.Random((int)System.DateTime.Now.Ticks);
            int start = 1000;
            int size = 9999;
            string OTPCODE = randomInt.Next(start, size).ToString();
            
            HttpFileCollection files = context.Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFile file = context.Request.Files[i];
                string path = context.Server.MapPath("~/Files/Main/" + OTPCODE + file.FileName);
                file.SaveAs(path);
                var FileName = file.FileName;
                context.Response.Write("Files/Main/" + OTPCODE + FileName);
            }
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}