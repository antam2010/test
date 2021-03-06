package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vo.ActionForward;
import action.Action;
import action.Ad_AddListFormAction;
import action.Ad_AddListSuccessAction;
import action.BoardListAction;
import action.BoardWriteAction;
import action.Com_caseCartAddAction;
import action.Com_caseCartListAction;
import action.Com_caseCartQtyDownAction;
import action.Com_caseCartQtyUpAction;
import action.Com_caseCartRemoveAction;
import action.Com_caseListAction;
import action.Com_caseRegistAction;
import action.Com_caseRegistFormAction;
import action.Com_caseViewAction;
import action.CpuCartAddAction;
import action.CpuCartListAction;
import action.CpuCartQtyDownAction;
import action.CpuCartQtyUpAction;
import action.CpuCartRemoveAction;
import action.CpuCartSearchAction;
import action.CpuListAction;
import action.CpuRegistAction;
import action.CpuRegistFormAction;
import action.CpuViewAction;
import action.GpuCartAddAction;
import action.GpuCartListAction;
import action.GpuCartQtyDownAction;
import action.GpuCartQtyUpAction;
import action.GpuCartRemoveAction;
import action.GpuListAction;
import action.GpuRegistAction;
import action.GpuRegistFormAction;
import action.GpuViewAction;
import action.MainboardCartAddAction;
import action.MainboardCartListAction;
import action.MainboardCartQtyDownAction;
import action.MainboardListAction;
import action.MainboardRegistAction;
import action.MainboardRegistFormAction;
import action.MainboardViewAction;

import action.RamCartAddAction;
import action.RamCartListAction;
import action.RamCartQtyDownAction;
import action.RamCartQtyUpAction;
import action.RamCartRemoveAction;
import action.RamCartSearchAction;
import action.RamListAction;
import action.RamRegistAction;
import action.RamRegistFormAction;
import action.RamViewAction;
import action.ItemsAction;
import action.MainboardCartQtyUpAction;
import action.MainboardCartRemoveAction;


@WebServlet("*.do")
public class CpuFrontController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String requestURI = request.getRequestURI(); // 프로젝트 부터인 KSCom/cpuList.do 까지
		
		
		String contextPath = request.getContextPath(); //cpuList.do 까지 가져온다
		
		
		String command = requestURI.substring(contextPath.length()); //command 변수에는 /cpuList.do
		Action action = null;
		ActionForward forward = null;
		
		//List.do
		System.out.println(command);
		if(command.equals("/cpuList.do")){
			action = new CpuListAction();
		
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/ramList.do")){
			action = new RamListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/mainboardList.do")){
			action = new MainboardListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/gpuList.do")){
			action = new GpuListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/com_caseList.do")){
			action = new Com_caseListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//View.do
		else if(command.equals("/cpuView.do")){
			action = new CpuViewAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/ramView.do")){
			action = new RamViewAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/mainboardView.do")){
			action = new MainboardViewAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/gpuView.do")){
			action = new GpuViewAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/com_caseView.do")){
			action = new Com_caseViewAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		//CartAdd.do
		else if(command.equals("/cpuCartAdd.do")){
			action = new CpuCartAddAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/ramCartAdd.do")){
			action = new RamCartAddAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/mainboardCartAdd.do")){
			action = new MainboardCartAddAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/gpuCartAdd.do")){
			action = new GpuCartAddAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/com_caseCartAdd.do")){
			action = new Com_caseCartAddAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//CartList.do
		else if(command.equals("/cpuCartList.do")){
			action = new CpuCartListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/ramCartList.do")){
			action = new RamCartListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/mainboardCartList.do")){
			action = new MainboardCartListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/gpuCartList.do")){
			action = new GpuCartListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/com_caseCartList.do")){
			action = new Com_caseCartListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//카트 가격 서치
		else if(command.equals("/cpuCartSearch.do")){
			action = new CpuCartSearchAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/ramCartSearch.do")){
			action = new RamCartSearchAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		
		//장바구니 값 지우기
		else if(command.equals("/cpuCartRemove.do")){
			action = new CpuCartRemoveAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/ramCartRemove.do")){
			action = new RamCartRemoveAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/mainboardCartRemove.do")){
			action = new MainboardCartRemoveAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/gpuCartRemove.do")){
			action = new GpuCartRemoveAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/com_caseCartRemove.do")){
			action = new Com_caseCartRemoveAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//갯수 업
		else if(command.equals("/cpuCartQtyUp.do")){
			action = new CpuCartQtyUpAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/ramCartQtyUp.do")){
			action = new RamCartQtyUpAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/mainboardCartQtyUp.do")){
			action = new MainboardCartQtyUpAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/gpuCartQtyUp.do")){
			action = new GpuCartQtyUpAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/com_caseCartQtyUp.do")){
			action = new Com_caseCartQtyUpAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//갯수 다운
		else if(command.equals("/cpuCartQtyDown.do")){
			action = new CpuCartQtyDownAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/ramCartQtyDown.do")){
			action = new RamCartQtyDownAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/mainboardCartQtyDown.do")){
			action = new MainboardCartQtyDownAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/gpuCartQtyDown.do")){
			action = new GpuCartQtyDownAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/com_caseCartQtyDown.do")){
			action = new Com_caseCartQtyDownAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//regist 등록
		else if(command.equals("/cpuRegist.do")){
			action = new CpuRegistAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/ramRegist.do")){
			action = new RamRegistAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/mainboardRegist.do")){
			action = new MainboardRegistAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/gpuRegist.do")){
			action = new GpuRegistAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/com_caseRegist.do")){
			action = new Com_caseRegistAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//등록 폼 으로이동부분 regist
		else if(command.equals("/cpuRegistForm.do")){
			action = new CpuRegistFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/ramRegistForm.do")){
			action = new RamRegistFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/mainboardRegistForm.do")){
			action = new MainboardRegistFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/gpuRegistForm.do")){
			action = new GpuRegistFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/com_caseRegistForm.do")){
			action = new Com_caseRegistFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//여기서부터 컴퓨터 컨트롤러
		else if(command.equals("/ad_AddList.do")){
			action = new Ad_AddListFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/ad_AddListSuccess.do")){
			action = new Ad_AddListSuccessAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/items.do")){
			action = new ItemsAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardList.do")){
			action = new BoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardWrite.do")){
			action = new BoardWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
	
		if(forward !=null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
				
			}
		}
		
	}
	
}
