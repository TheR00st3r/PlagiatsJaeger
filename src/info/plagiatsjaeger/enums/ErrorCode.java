package info.plagiatsjaeger.enums;

public enum ErrorCode
{
	Created(100),
	Started(200),
	Succesful(300),
	Error(400);
	
	private final int value;
	
	ErrorCode(int value)
	{
		this.value = value;
	}
	
	public int value()
	{
		return value;
	}
	
}
