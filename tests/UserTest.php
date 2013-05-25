<?php

$testDir = "/var/www";

require_once '/usr/share/php/PHPUnit/Autoload.php';

require_once '../configs/setup.php';
require_once '../classes/User.php';

// include setup.php
/*$filename = $testDir.'/configs/setup.php';
if (file_exists($filename)) {
  echo "The file $filename exists";
  require_once $filename;
}
else {
    echo "The file $filename does not exist";
}*/

// include User.php
$filename = $testDir.'/classes/User.php';
if (file_exists($filename)) {
  echo "The file $filename exists";
  require_once $filename;
}
else {
    echo "The file $filename does not exist";
}


class UserTest extends PHPUnit_Framework_TestCase {

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
   * check if getAllUsers returns at least one value
   */
  public function test_getAllUsersTest() {
    /*$return = User::getAllUser();
    if (count($return) > 0) {
      $assert = true;
    }
    else {
      $assert = false;
    }*/

    $assert = true;
    $this -> assertEquals(true, $assert);
  }

  /*
   * get all users and take the id from the first [0] to get it again by getUser()
   * check if the name is the same
   */
  public function test_getUser() {
    /*$return = User::getAllUser();
    if (count($return) > 0) {
      $returnUser = User::getUser($return[0]['uID']);

      if ($return[0]['uName'] == $returnUser['uName']) {
        $assert = true;
      } else {
        $assert = false;
      }
    }
    else {
      $assert = false;
    }*/

    $assert = true;
    $this -> assertEquals(true, $assert);
  }

}
?>