package net.tencent.tickets.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 上传文件Servlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    HttpSession session = request.getSession();
//			try {
//				//判断上传表单是否为multipart/form-data类型
//				if(ServletFileUpload.isMultipartContent(request))
//				{
//					//1. 创建DiskFileItemFactory对象，设置缓冲区大小和临时文件目录
//					DiskFileItemFactory factory = new DiskFileItemFactory();
//					
//					//2. 创建ServletFileUpload对象，并设置上传文件的大小限制。
//					ServletFileUpload fileUpload = new ServletFileUpload(factory);
//					fileUpload.setSizeMax(1024*1024*10);//限制上传文件的大小 , 以byte为单位   10M,  1024byte = 1kb   1024kb = 1M   1024M=1G....
//					fileUpload.setHeaderEncoding("utf-8");//设置编码格式
//					
//					//3. 调用ServletFileUpload.parseRequest方法解析request对象，得到一个保存了所有上传内容的List对象。
//					List<FileItem> fileItemList = fileUpload.parseRequest(request);
//
//					/**1.获取session中登陆的用户信息*/
//					User user = (User)session.getAttribute("user");
//					System.out.println("修改前：" + user);
//					
//					//4. 遍历list，每迭代一个FileItem对象，调用其isFormField方法判断是否是上传文件
//					for (FileItem fileItem : fileItemList) {
//						//true 普通的表单元素
//						if(fileItem.isFormField())
//						{
//							String name = fileItem.getFieldName();//表单元素的name属性值
//							String value = fileItem.getString("utf-8");//表单元素的value属性值
//							
//							System.out.println(name + "  " + value);
//							
//							/**2.获取修改的参数信息*/
//							if("passengerType".equals(name))
//							{
//								user.setUserTypeID(Integer.valueOf(value));
//							}
//							else if("content".equals(name))
//							{
//								user.setContent(value);
//							}
//						}
//						//false 上传的文件表单元素<input type="file">
//						else
//						{
//							//上传文件的名称
//							String fileName = fileItem.getName();
//							System.out.println("源文件名称：" + fileName);//1.jpg
//							
//							//扩展名
//							String suffix = fileName.substring(fileName.lastIndexOf("."));
//							System.out.println("扩展名：" + suffix);//.jpg
//							
//							//新文件名称 :用户ID + 时间毫秒值  + 扩展名
//							String newFileName = user.getId() + "" +new Date().getTime() + suffix;
//							System.out.println("新文件名称：" + newFileName);//21570606348709.jpg
//							
//							//5. 调用FileItem的write()方法，写入文件   D:/apache-tomcat-7.0.73/webapps/day08_my12306/uploadFile
//							File file = new File(request.getServletContext().getRealPath("uploadFile") + "/" + newFileName);
//							fileItem.write(file);
//							
//							//6. 调用FileItem的delete()方法，删除临时文件
//							fileItem.delete();
//							
//							/**2.获取修改的参数信息*/
//							user.setImagePath("uploadFile/" + newFileName);
//						}
//						
//					}
//					System.out.println("修改后：" + user);
//					
//					/**3.调用service方法完成修改*/
//					IUserService userService = UserServiceImpl.getInstance();
//					boolean result = userService.updateUser(user);
//					
//					/**4.处理结果*/
//					if(result)
//					{
//						//重新更新session中的用户信息
//						session.setAttribute("user", user);
//						
//						//跳转回首页
//						response.sendRedirect(request.getContextPath() + "/User/Index.html");
//					}
//					//修改失败
//					else
//					{
//						PrintWriter writer = response.getWriter();
//						writer.write("修改用户信息失败！！");
//						writer.flush();
//						writer.close();
//					}
//				}
//			} catch (FileUploadException e) {
//				e.printStackTrace();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
	}
}
