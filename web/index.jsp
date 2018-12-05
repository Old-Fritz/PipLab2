<%@ page import="pkg.DataRow" %>
<%@ page import="javax.ejb.EJB" %>
<%@ page import="pkg.CheckData" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ЛР2</title>
    <link rel="stylesheet" type="text/css" href="./files/style.css">
    <script type="text/javascript" language="text/javascript" src="./files/script.js"></script>
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
            <td colspan="2" td>
                <form id = "mainForm" method="POST" action="AreaCheck">
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
                                                <label><input class="radioSel" type="radio" name="rParam" value="1.0" required>1.0</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="rParam" value="2.0" required>2.0</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="rParam" value="3.0" required>3.0</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="rParam" value="4.0" required>4.0</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label><input class="radioSel" type="radio" name="rParam" value="5.0" required>5.0</label>
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
                <img id="areasImage" src="./files/areas.png" title="График области" alt="Не удалось загрузить график">
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
            <th>Координата клика X</th>
            <th>Координата клика Y</th>
            <th>Результат</th>
            <th>Время работы скрипта</th>
            <th>Время</th>
        </tr>
        </thead>
        <tbody>
        <%for(DataRow row :CheckData.getInstance().getRows()){%>
            <%= row.toRow()%>
        <%}%>
        </tbody>
    </table>
</article>
</body>
</html>