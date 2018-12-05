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
import java.util.Date;

@WebServlet(name = "AreaCheck", urlPatterns = {"/AreaCheck"})
public class AreaCheckServlet extends HttpServlet {
    @EJB
    CheckData checkData;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        long time = System.currentTimeMillis();
        double xParam = Double.parseDouble(req.getParameter("xParam"));
        double yParam = Double.parseDouble(req.getParameter("yParam"));
        double rParam = Double.parseDouble(req.getParameter("rParam"));

        double xMouse, yMouse;
        String xMouseStr = req.getParameter("xMouse");
        if(xMouseStr == null)
            xMouse = -1;
        else
            xMouse = Double.parseDouble(xMouseStr);

        String yMouseStr = req.getParameter("yMouse");
        if(yMouseStr == null)
            yMouse = -1;
        else
            yMouse = Double.parseDouble(yMouseStr);


        boolean result = checkArea(xParam, yParam, rParam);

        time = System.currentTimeMillis() - time;

        checkData.addRow(xParam,yParam,rParam,result,time,new Date(),xMouse,yMouse);

        req.getRequestDispatcher("index.jsp").forward(req,resp);
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
}
