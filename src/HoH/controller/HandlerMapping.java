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
		else if(command.contentEquals("getdetailmem ber")) 
			controller=new GetDetailMemberController();
		else if(command.contentEquals("updatememberForm")) 
			controller=new UpdateMemberFormController();
		else if(command.contentEquals("updatemember")) 
			controller=new UpdateMemberController();
		else if(command.contentEquals("writepostform")) 
			controller=new WritePostFormController();
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
		else if(command.contentEquals("replywrite")) 
			controller=new replyWriteController();
		else if(command.contentEquals("replydelete")) 
			controller=new replyDeleteController();
		else if(command.contentEquals("replyupdate")) 
			controller=new replyUpdateController();
		//form에서 받아온 value
		else if(command.contentEquals("findpasswordform")) 
			controller=new FindPasswordFormController();
		else if(command.contentEquals("findpasswordbyid")) 
			controller=new FindPasswordByIdController();
		else if(command.contentEquals("searchall")) 
			controller=new SearchAllController();
		else if(command.contentEquals("CheckscrapPost")) 
			controller=new CheckScrapPostController();
		else if(command.contentEquals("ScrapPost")) 
			controller=new ScrapPostController();
		else if(command.contentEquals("myScrapList")) 
			controller=new MyScrapListController();
		else if(command.contentEquals("deleteScrapPost")) 
			controller=new DeleteScrapPostController();
		else if(command.contentEquals("follwerAdd")) 
			controller=new follwerAddController();
		else if(command.contentEquals("follwerCheck")) 
			controller=new follwerCheckController();
		else if(command.contentEquals("follwerDel")) 
			controller=new follwerDeleteController();
		else if(command.contentEquals("likeCount")) 
			controller=new LikeCountController();
		else if(command.contentEquals("likeCancel")) 
			controller=new LikeCancelController();
		else if(command.contentEquals("ageSearch")) 
			controller=new AgeSearchController();
		else if(command.contentEquals("myFollowList")) 
			controller=new MyFollowListController();
		return controller;
	}
}
