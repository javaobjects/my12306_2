
document.querySelector("#btn_uploadFile").onclick = () =>
{
    //txt_uploadFile
    let txt_uploadFile = document.querySelector("#txt_uploadFile").value;
    if(txt_uploadFile){
        //表单提交，上传照片，告诉我是成功还是失败，最好回显照片
        //1.获取表单元素
        let form = document.querySelector("#edit_form");
        //2.修改表单的属性：支持进行二进制数据的提交
        form.encoding = "multipart/form-data";
        //3.指定处理上传图片请求的servlet
        form.action = "UploadPhotoServlet";
        //4.表单提交
        form.submit();
        //以下代码将表单属性还原
        //需要修改表单的enctype属性，js中的代码如下：
        form.encoding = "application/x-www-form-urlencoded";
        form.action = "UpdateUserServlet";
    }else{
        document.querySelector("#tip_text").innerText = "请先选择文件!";
    }
}
document.querySelector("#txt_uploadFile").onclick = () => {
    document.querySelector("#tip_text").innerText = "";
}