package pkg;

import pkg.CheckData;

import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.ejb.Startup;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;
import java.util.Date;

@WebServlet(name = "AreaCheck", urlPatterns = {"/AreaCheck"})
public class AreaCheckServlet extends HttpServlet {
    @EJB
    CheckData checkData;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long time = System.currentTimeMillis();
        double xParam = Double.parseDouble(req.getParameter("xParam"));
        double yParam = Double.parseDouble(req.getParameter("yParam"));
        double rParam = Double.parseDouble(req.getParameter("rParam"));


        boolean result = checkArea(xParam, yParam, rParam);

        time = System.currentTimeMillis() - time;

        checkData.addRow(xParam,yParam,rParam,result,time,new Date());

        resp.setCharacterEncoding("UTF-8");
        Writer writer = resp.getWriter();
        writeFirstPart(writer);
        for(DataRow row :checkData.getRows()){
            writer.write(row.toRow());
            writer.write("<script>addPoint("+row.getX() + ", " + row.getY()+"; R="+row.getR()+"</script>");
        }
        writeLastPart(writer);
    }

    private boolean checkArea(double x, double y, double r)
    {
        if(x<=r && x>=0 && y>=0 && y<=r)
            return true;
        if(x<=0 && y<=0 && x+y>=-r)
            return true;
        if(x>=0 && y<=0 && x*x+y*y<=r*r/4)
            return true;
        return false;
    }
    protected void writeFirstPart(Writer writer) throws  IOException
    {
        writer.write("<!DOCTYPE html>\n" +
                "<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
                "    <title>ЛР2</title>\n" +
                "    <link rel=\"stylesheet\" type=\"text/css\" href=\"files/style.css\">\n" +
                "    <script type=\"text/javascript\" language=\"text/javascript\" src=\"files/script.js\"></script>\n" +
                "</head>" +
                "<body>" +
                "<h1>Результаты</h1>\n" +
                "    <button onclick=\"window.location='Controller'\">Назад</button>\n" +
                "    <table id = \"resultTable\">\n" +
                "        <thead>\n" +
                "        <tr>\n" +
                "            <th>Параметр X</th>\n" +
                "            <th>Параметр Y</th>\n" +
                "            <th>Параметр R</th>\n" +
                "            <th>Результат</th>\n" +
                "            <th>Время работы скрипта</th>\n" +
                "            <th>Время</th>\n" +
                "        </tr>\n" +
                "        </thead>\n" +
                "        <tbody>\n" +
                "        <script>pointsArray.splice(0,pointsArray.length)</script>");
    }
    protected void writeLastPart(Writer writer) throws IOException
    {
        writer.write(
                "        </tbody>\n" +
                "    </table>\n" +
                "</article>\n" +
                "</body>\n" +
                "</html>");
    }
}
