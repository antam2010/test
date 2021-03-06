package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.MemberDeleteService;
import vo.ActionForward_member;

public class MemberDeleteAction implements Action_member{
	public ActionForward_member execute(HttpServletRequest request,HttpServletResponse response) 
			throws Exception{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");

		ActionForward_member forward = null;
		if(id==null){
			forward = new ActionForward_member();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.me");
		}else if(!id.equals("admin")){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('관리자로 로그인하시오');");
			out.println("location.href='./memberLogin.me';");
			out.println("</script>");
		}
		else{
			String deleteId=request.getParameter("id");
			MemberDeleteService memberDeleteService = new MemberDeleteService();
			boolean deleteResult=memberDeleteService.deleteMember(deleteId);

			if(deleteResult){
				forward = new ActionForward_member();
				forward.setRedirect(true);
				forward.setPath("./memberListAction.me");
			}
			else{
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('삭제에 실패하였다');");
				out.println("location.href='./memberLogin.me';");
				out.println("</script>");
			}
		}
		return forward;
	}
}