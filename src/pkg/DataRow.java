package pkg;

import java.util.Date;

public class DataRow{
    double xParam;
    double yParam;
    double rParam;
    boolean result;
    long time;
    Date date;


    public DataRow(double xParam, double yParam, double rParam, boolean result, long time, Date date) {
        this.xParam = xParam;
        this.yParam = yParam;
        this.rParam = rParam;
        this.result = result;
        this.time = time;
        this.date = date;
    }

    public String toRow()
    {
        String row = "";
        row += "<tr>\n\r";
        row+= "<td>" + xParam + "</td>";
        row+= "<td>" + yParam + "</td>";
        row+= "<td>" + rParam + "</td>";
        if(result)
            row+= "<td>true</td>";
        else
            row+= "<td>false</td>";
        row+= "<td>" + time + " мкс</td>";
        row+= "<td>" + date + "</td>";
        row += "</tr>\n";

        return row;
    }

    public double getX()
    {
        return xParam;
    }

    public double getY()
    {
        return yParam;
    }

    public double getR()
    {
        return rParam;
    }
}