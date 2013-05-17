<?php
require_once '/usr/share/php/PHPUnit/Autoload.php';
require_once '../configs/setup.php';

class DocumentTest extends PHPUnit_Framework_TestCase {
  
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

  public function test_Test1() {
    echo "test_Test1()";
    $this -> assertFalse(true);
  }
  
  public function test_Test2() {
    echo "test_Test2()";
    $this -> assertFalse(false);
  }

}


?>