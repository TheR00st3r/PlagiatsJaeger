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


  public function test_IsString() {
    $assert = Validator::validate(VAL_STRING, 'abCdeFghiJKLMNOPQ()...', true);
    $this->assertEquals(true, $assert);
  }
  
  
  public function test_IsEmail() {
    $assert = Validator::validate(VAL_EMAIL, 'max@mustermann.de', true);
    $this->assertEquals(true, $assert);
  }
  
  
  public function test_IsInteger() {
    $assert = Validator::validate(VAL_INTEGER, '10', true);
    $this->assertEquals(true, $assert);
  }
  
  
  public function test_IsNotInteger() {
    $assert = Validator::validate(VAL_INTEGER, 'Hallo, ich bin kein Integer! :-P', true);
    $this->assertEquals(false, $assert);
  }
  
  
  public function test_IsNotEmpty() {
    $assert = Validator::validate(VAL_STRING, '', true);
    $this->assertEquals(false, $assert);
  }

}
?>