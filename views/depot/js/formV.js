// function FormVerifyPhone(){
//     phone=document.getElementById("phone").value
//     err=document.getElementById("errPhone")
//     if (phone==""){
//         err.innerText="手机号码不能为空！"
//     }else {
//         if (!(/^1((34[0-8])|(8\d{2})|(([35][0-35-9]|4[579]|66|7[35678]|9[1389])\d{1}))\d{7}$/.test(phone))){
//             err.innerText="请正确填写手机号码！"
//         }else {
//             err.innerText="成功"
//         }
//     }
// }

function FormMiniVerify(n) {
    m=document.getElementById(n).value
    err=document.getElementById("err"+"_"+n)
    var v=""
    var s=""

    switch (n) {
        case "phone":{
            v=/^1((34[0-8])|(8\d{2})|(([35][0-35-9]|4[579]|66|7[35678]|9[1389])\d{1}))\d{7}$/
            s="手机号码"
            break
        }
        case "email":{
            v=/^([\w\.\_]{2,10})@(\w{1,}).([a-z]{2,4})$/
            s="邮箱"
            break
        }
        case "number":{
            v=/^(\d{17})([0-9]|X)$/
            s="身份证号码"
            break
        }
        case "password":{
            v=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/ //6~18字母数字
            s="密码"
            break
        }
        case "name":{
            v=/^[a-zA-Z0-9_-]{4,16}$/ //4到16位（字母，数字，下划线，减号）
            s="用户名"
            break
        }
        case "sellerName":{
            v=/^[\u2E80-\uFE4F]+$/ //4到16位（字母，数字，下划线，减号）
            s="用户名"
            break
        }

    }
    if (m!=""){
        if (!(v.test(m))){
            err.setAttribute("class","layui-icon layui-icon-close")
            err.style.color= "#FF5722";
            return false;
        }else {
            err.setAttribute("class","layui-icon layui-icon-ok")
            err.style.color= "#009688";
            return true;
        }
    }else {
        err.setAttribute("class","layui-icon layui-icon-close")
        err.style.color= "#FF5722";
        return false;
    }
}
