package test.info.plagiatsjaeger;

import static org.junit.Assert.*;
import info.plagiatsjaeger.Control;

import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;


public class ControlTest
{
	private static final Logger		_logger					= Logger.getLogger(ControlTest.class.getName());

	@Before
	public void setUp() throws Exception
	{
		_logger.info("Start ControlTest");
	}

	@Test
	public void testStartPlagiatsSearchInt()
	{
		assertEquals(0, 0);
	}

	@Test
	public void testStartPlagiatsSearchStringInt()
	{
		assertEquals(0, 0);
	}

}
