package pkg;

import javax.ejb.Singleton;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Singleton
public class CheckData {
    private List<DataRow> rows;
    private static CheckData instance;

    public CheckData()
    {
        instance = this;
        rows = new ArrayList<DataRow>();
    }

    public void addRow(double xParam, double yParam, double rParam, boolean result, long time, Date date)
    {
        rows.add(new DataRow(xParam, yParam, rParam, result, time, date));
    }

    public List<DataRow> getRows() {
        return rows;
    }

    public static CheckData getInstance()
    {
        return instance;
    }
}



