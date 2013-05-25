<?php
require_once '/usr/share/php/PHPUnit/Autoload.php';
require_once '../configs/setup.php';

class LoginAccessTest extends PHPUnit_Framework_TestCase {
  
  
  /*
   * called before every test-function call
   * set up test environment
   */
  protected function setUp() {
    echo "setUp()";
  }
  
  
  /*
   * called after every test-function call
   * clean up test environment
   */
  protected function tearDown() {
    echo "tearDown()";
  }


  public function test_Login() {
    $checkLogin = LoginAccess::login("nichtRegistriert@test.de", "falsch");
    $this->assertEquals(false, $checkLogin['state']);
  }
  

}


?>