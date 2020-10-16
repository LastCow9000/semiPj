package HoH.controller;

public class HandlerMapping {
	//Singleton 적용
	private static HandlerMapping instance=new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getInstance() {
		return instance;
	}
	public Controller create(String command) {
		Controller controller=null;
		if(command.contentEquals("home")) 
			controller=new HomeController();
		else if(command.contentEquals("login")) 
			controller=new LoginController();
		else if(command.contentEquals("logout")) 
			controller=new LogoutController();
		else if(command.contentEquals("registerForm")) 
			controller=new registerFormController();
		else if(command.contentEquals("register")) 
			controller=new RegisterController();
		else if(command.contentEquals("getdetailmember")) 
			controller=new GetDetailMemberController();
		else if(command.contentEquals("updatememberForm")) 
			controller=new UpdateMemberFormController();
		else if(command.contentEquals("updatemember")) 
			controller=new UpdateMemberController();
		else if(command.contentEquals("writepost")) 
			controller=new WritePostController();
		else if(command.contentEquals("deletepost")) 
			controller=new DeletePostController();
		else if(command.contentEquals("detailpost")) 
			controller=new DetailPostController();
		else if(command.contentEquals("updatepost")) 
			controller=new UpdatePostController();
		else if(command.contentEquals("updateform")) 
			controller=new UpdateFormController();
		else if(command.contentEquals("agelist")) 
			controller=new getPostListByAgeController();
		else if(command.contentEquals("idCheckResult")) 
			controller=new IdCheckResultController();
		else if(command.contentEquals("nickCheckedResult")) 
			controller=new NickCheckResultController();
		
		return controller;
	}
}
