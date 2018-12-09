function inputX(input){
    input.value = input.value.replace(/[^-0-9\.]/g,'');

    while(true)
    {
        let ind1 = input.value.indexOf(".");
        if(ind1>=0)
        {
            let ind2 = input.value.indexOf(".", ind1+1);
            if(ind2>0 || ind1==0)
                input.value = input.value.substr(0,ind1) + input.value.substr(ind1+1,input.value.length-1-ind1);
            else
                break;
        }
        else
            break;
    }

    while(true)
    {
        ind1 = input.value.indexOf("-");
        if(ind1==0)
        {
            let ind2 = input.value.indexOf("-", ind1+1);
            if(ind2>0)
                input.value = input.value.substr(0,ind2) + input.value.substr(ind2+1,input.value.length-1-ind2);
            else
                break;
        }
        else if(ind1>0)
            input.value = input.value.substr(0,ind1) + input.value.substr(ind1+1,input.value.length-1-ind1);
        else
            break;
    }
}
function changeX(input){
    let strLength = input.value.length;
    let lastSym = input.value.charAt(strLength-1);
    if(lastSym=='.' || lastSym=='-')
        input.value = input.value.substr(0, strLength-1);
    if(input.value.length == 0)
        return;

    let number = parseFloat(input.value);
    if(number<=-5)
        input.value = "";
    else if(number>=3)
        input.value = "";
    else
        input.value = number;
}

var pointsArray = [];
var R = 1;
var isRSet = false;

function addPoint(x, y)
{
    pointsArray.push({xPoint:x,yPoint:y});
}

function draw()
{
    let canvas = document.querySelector("canvas");
    canvas.width = 600;
    canvas.height = 600;
    drawBackground(canvas);
    drawFigure(canvas, R);
    drawPoints(canvas);
    drawAxises(canvas);
}

function drawPoints(canvas)
{
    for(let i = 0; i<pointsArray.length;i++)
        drawPoint(canvas,pointsArray[i].xPoint,pointsArray[i].yPoint);
}

function drawBackground(canvas) {
    let context = canvas.getContext("2d");
    context.fillStyle = "white";
    context.fillRect(0, 0, canvas.width, canvas.height);
}

function drawPoint(canvas,x,y)
{
    let context = canvas.getContext("2d");
    context.fillStyle = "red";

    x+=6;
    y=6-y;
    let rPixels = canvas.width/12;

    context.closePath();
    context.fillRect(rPixels*x-3,rPixels*y-3, 6, 6);
}

function drawFigure(canvas, r) {
    let context = canvas.getContext("2d");
    context.fillStyle = "blue";

    let rPixels = canvas.width/12;

    context.fillRect(canvas.width/2, (6-r)*rPixels,rPixels*r,rPixels*r);
    context.arc(canvas.width/2,canvas.height/2,r*rPixels/2,0,Math.PI/2);
    context.lineTo(canvas.width/2,canvas.height/2);
    context.fill();
    context.moveTo(canvas.width/2,canvas.height/2);
    context.lineTo(canvas.width/2-rPixels*r, canvas.height/2);
    context.lineTo(canvas.width/2, canvas.height/2+rPixels*r);
    context.fill();
}

function drawAxises(canvas)
{
    let context = canvas.getContext("2d");
    let fontSize = canvas.width/30;

    context.fillStyle = "black";
    context.fillRect(canvas.width/2-1,0,2,canvas.height);
    context.fillRect(0,canvas.height/2-1,canvas.width,2);

    // X axis
    for(let i = -5;i<6;i++)
    {
        context.font = fontSize+"px serif";
        context.fillRect((i+6)*(canvas.width/12)-1,canvas.height/2-3,2,6);
        context.fillText(i,(i+6)*(canvas.width/12),canvas.height/2+fontSize);
    }
    context.fillText("X",canvas.width-fontSize,canvas.height/2-fontSize);

    // Y axis
    for(let i = -5;i<6;i++)
    {
        context.font = fontSize+"px serif";
        context.fillRect(canvas.width/2-3, (i+6)*(canvas.height/12)-1,6,2);
        if(i!=0)
            context.fillText(-i,canvas.width/2-fontSize,(i+6)*(canvas.height/12));
    }
    context.fillText("Y",canvas.width/2+fontSize,fontSize);
}

function clickCanvas(event) {
    if(!isRSet)
    {
        alert("Невозможно определить точку! Укажите R!");
        return;
    }

    let canvas = document.querySelector("canvas");
    var rect = canvas.getBoundingClientRect();

    let x;
    let y;

    x = event.clientX;
    y = event.clientY;

    x -= rect.left;
    y -= rect.top;

    x = x*12/canvas.width-6;
    y= 6-y*12/canvas.height;
    sendPost(x,y,R);
}

function sendPost(x,y,r) {
    let xhr = new XMLHttpRequest();

    let body = "xParam=" +encodeURIComponent(x) +
        "&yParam=" +encodeURIComponent(y) +
        "&rParam=" +encodeURIComponent(r);

    xhr.open("POST","Controller", true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onload = function() {
        document.documentElement.innerHTML=xhr.responseText;
    };
    xhr.send(body);
}