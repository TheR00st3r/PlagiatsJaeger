package test.info.plagiatsjaeger;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;


@RunWith(Suite.class)
@SuiteClasses({ ControlTest.class, FileParserTest.class, MyComparerTest.class, SourceLoaderTest.class, WordProcessingTest.class })
public class AllTests
{

}
