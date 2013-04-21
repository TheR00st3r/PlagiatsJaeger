package info.plagiatsjaeger.test;

import java.io.File;

import info.plagiatsjaeger.Control;

public class TestControl
{

	/**
	 * @param args
	 */
	public static void main(String[] args)
	{
		Control control = new Control();
		control.startPlagiatsSearch(System.getProperty("user.home") + File.separator + "orgText.txt", 0);

	}

}
