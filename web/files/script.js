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