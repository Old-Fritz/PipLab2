package pkg;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class ControllerServlet  extends HttpServlet {

    @EJB
    CheckData checkData;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            double xParam = Double.parseDouble(req.getParameter("xParam"));
            double yParam = Double.parseDouble(req.getParameter("yParam"));
            double rParam = Double.parseDouble(req.getParameter("rParam"));
        }catch (Exception e){
            req.setAttribute("checkData", checkData);
            req.getRequestDispatcher("jsp.jsp").forward(req,resp);
            return;
        }
        req.getRequestDispatcher("AreaCheck").forward(req,resp);
    }
}
