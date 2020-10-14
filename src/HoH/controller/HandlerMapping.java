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
		if(command.contentEquals(""))
			controller=new XXController();
		return controller;
	}
}
