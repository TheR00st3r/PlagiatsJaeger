<?php
require_once '/usr/share/php/PHPUnit/Autoload.php';
require_once '../configs/setup.php';

class HelperTest extends PHPUnit_Framework_TestCase {
  
  
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


  /*
   * call Helper::PrintArray()
   */
  public function test_PrintArray() {
    $array = array('Gasket' => 15.29,
               'Wheel'  => 75.25,
               'Tire'   => 50.00);
    Helper::print_array($array);
    $this->assertEquals(true, true);
  }
  
  
  /*
   * call Helper::nl2p()
   */
  public function test_nl2p() {
    $text = "Das ist ein \nAbsatz";
    $returnText = Helper::nl2p($text);
    
    if ( substr_count($returnText, "\n") == 0 ) {
      $assert = true;
    }
    else {
      $assert = false;
    }
    $this->assertEquals(true, $assert);
  }
  
  
  /*
   * call Helper::urlString()
   */
  public function test_urlString() {
    $text = "äöüß .,&";
    $returnText = Helper::urlString($text);
    if ( substr_count($returnText, "ä") == 0 
          && substr_count($returnText, "ö") == 0
          && substr_count($returnText, "ü") == 0
          && substr_count($returnText, "ß") == 0
          && substr_count($returnText, " ") == 0
          && substr_count($returnText, ".") == 0
          && substr_count($returnText, ",") == 0
          && substr_count($returnText, "&") == 0)
    {
      $assert = true;
    }
    else {
      $assert = false;
    }
    $this->assertEquals(true, $assert);
  }


}


?>