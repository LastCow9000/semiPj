package model;

public class TestVO {
	private String name;

	public TestVO(String name) {
		super();
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "TestVO [name=" + name + "]";
	}
	
}
