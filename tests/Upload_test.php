<?php
require_once '/usr/share/php/PHPUnit/Autoload.php';
require_once '../configs/setup.php';

class UploadTest extends PHPUnit_Framework_TestCase {

  public function test_Test1() {
    $this -> assertFalse(true);
  }
  
  public function test_Test2() {
    $this -> assertFalse(false);
  }

}


?>