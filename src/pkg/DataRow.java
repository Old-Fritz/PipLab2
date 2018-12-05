package pkg;

import java.util.Date;

public class DataRow{
    double xParam;
    double yParam;
    double rParam;
    boolean result;
    long time;
    Date date;

    double xMouse;
    double yMouse;


    public DataRow(double xParam, double yParam, double rParam, boolean result, long time, Date date, double xMouse, double yMouse) {
        this.xParam = xParam;
        this.yParam = yParam;
        this.rParam = rParam;
        this.result = result;
        this.time = time;
        this.date = date;
        this.xMouse = xMouse;
        this.yMouse = yMouse;
    }

    public String toRow()
    {
        String row = "";
        row += "<tr>\n\r";
        row+= "<td>" + xParam + "</td>";
        row+= "<td>" + yParam + "</td>";
        row+= "<td>" + rParam + "</td>";
        row+= "<td>" + xMouse + "</td>";
        row+= "<td>" + yMouse + "</td>";
        if(result)
            row+= "<td>true</td>";
        else
            row+= "<td>false</td>";
        row+= "<td>" + time + " мкс</td>";
        row+= "<td>" + date + "</td>";
        row += "</tr>\n";

        return row;
    }
}