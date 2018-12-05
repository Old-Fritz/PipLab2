package pkg;

import javax.ejb.Local;
import javax.ejb.Remote;
import javax.ejb.Singleton;
import javax.ejb.Startup;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Singleton(mappedName = "checkData")
public class CheckData {
    private List<DataRow> rows;
    private static CheckData instance;

    public CheckData()
    {
        instance = this;
        rows = new ArrayList<DataRow>();
    }

    public void addRow(double xParam, double yParam, double rParam, boolean result, long time, Date date, double xMouse, double yMouse)
    {
        rows.add(new DataRow(xParam, yParam, rParam, result, time, date, xMouse, yMouse));
    }

    public List<DataRow> getRows() {
        return rows;
    }

    public void setRows(List<DataRow> rows) {
        this.rows = rows;
    }

    public static CheckData getInstance()
    {
        return instance;
    }
}



