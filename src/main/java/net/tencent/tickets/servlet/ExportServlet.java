package net.tencent.tickets.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;
import net.tencent.tickets.entity.Users;

/**
 * 导出用户信息Servlet
 */
@WebServlet("/ExportServlet")
public class ExportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//1.创建一个可写的xls文件
			response.setHeader("Content-disposition", "attachment; filename="
					+ new String("用户信息列表".getBytes("GB2312"), "8859_1") + ".xls");
			response.setHeader("pragma", "no-cache");
			response.setContentType("application/msexcel");
			
			ServletOutputStream os = response.getOutputStream();
			
			//2.创建一个工作簿
			WritableWorkbook workbook = Workbook.createWorkbook(os);

			//3.基于工作簿，创建一个sheet表单
			WritableSheet ws = workbook.createSheet("用户列表", 0);
			
			//4.向指定单元格填充数据
			//ws.addCell(new Label(4, 5, "单元格的值"));
			
			//大标题
			WritableFont font = new WritableFont(WritableFont.TIMES, 16,WritableFont.BOLD);//设置字体样式
			WritableCellFormat format = new WritableCellFormat(font);      //单元格格式化对象
			format.setBorder(Border.ALL, jxl.format.BorderLineStyle.THIN); //设置边框
			format.setAlignment(Alignment.CENTRE);							//文本居中显示
			
			Label cell = new Label(0, 0, "导出用户列表", format);
			ws.addCell(cell);      //将单元格添加到sheet表单
			
			ws.mergeCells(0,0,4,0);//合并单元格
			
			//小标题
			WritableCellFormat cellFormat = new WritableCellFormat();          //单元格格式化对象
			cellFormat.setBorder(Border.ALL, jxl.format.BorderLineStyle.THIN); //设置边框
			ws.addCell(new Label(0, 1, "姓名", cellFormat));
			ws.addCell(new Label(1, 1, "性别", cellFormat));
			ws.addCell(new Label(2, 1, "证件类型", cellFormat));
			ws.addCell(new Label(3, 1, "证件号码", cellFormat));
			ws.addCell(new Label(4, 1, "旅客类型", cellFormat));
			
			//导出数据列表
			List<Users> userList = (List<Users>)request.getSession().getAttribute("userList");
			for (int i = 0; i < userList.size(); i++) {
				Users user = userList.get(i);
				
				ws.addCell(new Label(0, i+2, user.getUserRealName(), cellFormat));
				ws.addCell(new Label(1, i+2, "1".equals(user.getUserSex())?"男":"女", cellFormat));
				ws.addCell(new Label(2, i+2, user.getCertType().getContent(), cellFormat));
				ws.addCell(new Label(3, i+2, user.getUserCert(), cellFormat));
				ws.addCell(new Label(4, i+2, user.getUserType().getContent(), cellFormat));
			}
			
			//5.写入xls，并关闭
			workbook.write();
			workbook.close();
			
		} catch (RowsExceededException e) {
			e.printStackTrace();
		} catch (WriteException e) {
			e.printStackTrace();
		}
	}
}
