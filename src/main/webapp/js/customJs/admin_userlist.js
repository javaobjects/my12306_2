function UserAdd() {


    window.navigate("UserInfo_Add.html");

}


function selectAllNullorReserve(obj, type) {
    if (obj != null && obj != "") {
        if (document.getElementsByName(obj) != undefined && document.getElementsByName(obj).length > 0) {	//getElementsByName函数的作用按名字查找对象，返回一个数组。
            var userids = document.getElementsByName(obj);
            if (type == "全选") {
                for (var i = 0; i < userids.length; i++) {
                    if (userids[i].checked == false) {
                        userids[i].checked = true;
                    }
                }
            } else if (type == "全不选") {
                for (var i = 0; i < userids.length; i++) {
                    if (userids[i].checked == true) {
                        userids[i].checked = false;
                    }
                }
            } else if (type == "反选") {
                for (var i = 0; i < userids.length; i++) {
                    if (userids[i].checked == true) {
                        userids[i].checked = false;
                    } else {
                        userids[i].checked = true;
                    }
                }
            }
        }
    }
}