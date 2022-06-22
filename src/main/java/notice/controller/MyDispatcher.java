package notice.controller;

import java.io.IOException;
import java.security.Provider.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.controller.sustomer.NoticeDelProcController;
import notice.controller.sustomer.NoticeDetailController;
import notice.controller.sustomer.NoticeEditController;
import notice.controller.sustomer.NoticeEditProcController;
import notice.controller.sustomer.NoticeRegController;
import notice.controller.sustomer.NoticeRegProcController;

public class MyDispatcher extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("신호");
		
		String uri=request.getRequestURI();
		String conPath=request.getContextPath();
		String com=uri.substring(conPath.length());
		
		System.out.println("url : "+uri);
		System.out.println("conPath : "+conPath);
		System.out.println("com : "+com);
		
		//NoticeDetailController controller1=new NoticeDetailController();
		//NoticeEditController controller2=new NoticeEditController();
		Controller controller=null;
		
		try {
			if(com.equals("/customer/noticeDetail.do")) {
				controller=new NoticeDetailController();
			}else if(com.equals("/customer/noticeEdit.do")) {
				controller=new NoticeEditController();
			}else if(com.equals("/customer/noticeEditProc.do")) {
				controller=new NoticeEditProcController();
			}else if(com.equals("/customer/noticeReg.do")) {
				controller=new NoticeRegController();
			}else if(com.equals("/customer/noticeRegProc.do")) {
				controller=new NoticeRegProcController();
			}else if(com.equals("/customer/noticeDelProc.do")) {
				controller=new NoticeDelProcController();
			}
			controller.execute(request, response);
					
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}