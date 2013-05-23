<?php
require_once '/usr/share/php/PHPUnit/Autoload.php';
require_once '../configs/setup.php';
require_once '../classes/Setting.php';

class SettingTest extends PHPUnit_Framework_TestCase {
  
  
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
   * create an Object of Setting class
   */
  public function test_CreateObject() {
    $settingObject = null;
    $settingObject = new Setting();
    
    if ($settingObject != null) {
      $assert = true;
    }
    else {
      $assert = false;
    }
    
    $this->assertEquals(true, $assert);
  }
  
  
  /*
   * try to get Settings
   * if we get some, it's right
   */
  public function test_CheckSettings() {
    $settingObject = null;
    $settingObject = new Setting();
    
    if ($settingObject != null) {
      $return = $settingObject->getAllSettings();
      if ( count($return) > 0 ) {
        $assert = true;
      }
      else {
        $assert = false;
      }
    }
    else {
      $assert = false;
    }
    
    $this->assertEquals(true, $assert);
  }
  
  
  /*
   * try to get Searchengines
   * if we get some, it's right
   */
  public function test_CheckSearchengines() {
    $settingObject = null;
    $settingObject = new Setting();
    
    if ($settingObject != null) {
      $return = $settingObject->getAllSearchengines();
      if ( count($return) > 0 ) {
        $assert = true;
      }
      else {
        $assert = false;
      }
    }
    else {
      $assert = false;
    }
    
    $this->assertEquals(true, $assert);
  }
  

}


?>