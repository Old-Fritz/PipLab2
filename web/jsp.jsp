<%@ page import="pkg.DataRow" %>
<%@ page import="javax.ejb.EJB" %>
<%@ page import="pkg.CheckData" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="checkData" type="pkg.CheckData" scope="request"/>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ЛР2</title>
    <link rel="stylesheet" type="text/css" href="files/style.css">
    <script type="text/javascript" language="text/javascript" src="files/script.js"></script>
</head>
<body>
<header>
    <table>
    <tbody>
    <tr>
        <td colspan="2"><h1>Лабораторная работа №2</h1></td>
    </tr>
    <tr>
        <td><h2>Комаров Егор Андреевич</h2></td>
        <td><h2>Чернышев Никита Евгеньевич</h2></td>
    </tr>
    <tr>
        <td><h3 class="left-header">Вариант: 18132</h3></td>
        <td><h3 class="right-header">Группа: Р3201</h3></td>
    </tr>
    </tbody>
    </table>
</header>
<article>
  <br>
    <table>
        <tbody>
        <tr>
            <td td>
                <form id = "mainForm" method="POST" action="Controller">
                    <fieldset>
                        <table>
                            <tr>
                                <td colspan="2">
                                    <legend>Параметр Y</legend>
                                </td>
                                <td>
                                    <legend>Параметр R</legend>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table  class="paramTable">
                                        <tr>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="yParam" value="-3" required>-3.0</label>
                                            </td>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="yParam" value="2.0" required>2.0</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="yParam" value="-2.0" required>-2.0</label>
                                            </td>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="yParam" value="3.0" required>3.0</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="yParam" value="-1.0" required>-1.0</label>
                                            </td>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="yParam" value="4.0" required>4.0</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="yParam" value="0.0" required>0.0</label>
                                            </td>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="yParam" value="5.0" required>5.0</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="yParam" value="1.0" required>1.0</label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table  class="paramTable">
                                        <tr>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="rParam" value="1.0"  onchange="R = 1;isRSet = true; draw();" required>1.0</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="rParam" value="2.0"  onchange="R = 2;isRSet = true; draw();" required>2.0</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="rParam" value="3.0"  onchange="R = 3;isRSet = true; draw();" required>3.0</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="rParam" value="4.0"  onchange="R = 4;isRSet = true; draw();" required>4.0</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="rParam" value="5.0"  onchange="R = 5; isRSet = true; draw();" required>5.0</label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <legend>Параметр X</legend>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <input type="text" name="xParam" placeholder="Введите число от -5 до 3" maxlength="10" oninput="return inputX(this);" onchange="return changeX(this);" required>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </form>
            </td>
            <td>
                <canvas width = 500 height = 500></canvas>
                <script>
                    canvas = document.querySelector("canvas");
                    canvas.addEventListener('mouseup', clickCanvas, false);
                </script>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <input type="submit" id="checkButton" value = "Проверить" form = "mainForm">
            </td>
        </tr>
        </tbody>
    </table>

    <h1>Результаты</h1>
    <table id = "resultTable">
        <thead>
        <tr>
            <th>Параметр X</th>
            <th>Параметр Y</th>
            <th>Параметр R</th>
            <th>Результат</th>
            <th>Время работы скрипта</th>
            <th>Время</th>
        </tr>
        </thead>
        <tbody>
        <script>pointsArray.splice(0,pointsArray.length)</script>
        <%for(DataRow row :checkData.getRows()){%>
            <%= row.toRow()%>
        <script>addPoint(<%=row.getX() + ", " + row.getY()%>); R=<%=row.getR()%></script>
        <%}%>
        <script>draw()</script>
        </tbody>
    </table>
</article>
</body>
</html>