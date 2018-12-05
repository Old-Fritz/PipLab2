<%--
  Created by IntelliJ IDEA.
  User: komar
  Date: 03.12.2018
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- saved from url=(0073)https://se.ifmo.ru/~s243853/%d0%9f%d0%b8%d0%bf/%d0%9b%d0%b0%d0%b1%d0%b01/ -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>ЛР1</title>
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
        <form id = "mainForm" method="POST" action="php.php">
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
                        <label><input class="radioSel" type="radio" name="yParam" value="2.0" required>1.0</label>
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
                        <label><input class="radioSel" type="radio" name="rParam" value="1" required>1.0</label>
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
</article>
</body>
</html>