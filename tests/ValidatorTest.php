<?php
require_once '/usr/share/php/PHPUnit/Autoload.php';
require_once '../configs/setup.php';

class ValidatorTest extends PHPUnit_Framework_TestCase {
  
  /*
   * called before every test-function call
   * set up test environment
   */
  protected function setUp() {
    echo 'setUp()';
  }
  
  
  /*
   * called after every test-function call
   * clean up test environment
   */
  protected function tearDown() {
    echo 'tearDown()';
  }


  /*
   * check if 'abCdeFghiJKLMNOPQ()...' identified as String
   */
  public function test_isString() {
    $assert = Validator::validate(VAL_STRING, 'abCdeFghiJKLMNOPQ()...', true);
    $this->assertEquals(true, $assert);
  }
  
  
  /*
   * check if 'max@mustermann.de' is identified as an Email
   */
  public function test_isEmail() {
    $assert = Validator::validate(VAL_EMAIL, 'max@mustermann.de', true);
    $this->assertEquals(true, $assert);
  }
  
  
  /*
   * check if '10' is identified as an Integer
   */
  public function test_isInteger() {
    $assert = Validator::validate(VAL_INTEGER, '10', true);
    $this->assertEquals(true, $assert);
  }
  
  
  /*
   * check if 'Hallo, ich bin kein Integer! :-P' is identified as NO Integer
   */
  public function test_isNotInteger() {
    $assert = Validator::validate(VAL_INTEGER, 'Hallo, ich bin kein Integer! :-P', true);
    $this->assertEquals(false, $assert);
  }
  
  
  /*
   * check if emptyString is identified as null
   */
  public function test_isNotEmpty() {
    $assert = Validator::validate(VAL_STRING, '', true);
    $this->assertEquals(false, $assert);
  }

}
?>