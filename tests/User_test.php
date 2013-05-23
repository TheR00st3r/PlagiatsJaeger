<?php
require_once '/usr/share/php/PHPUnit/Autoload.php';
require_once '../configs/setup.php';

require_once '../classes/User.php';


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
   * create an object of User class
   */
  public function test_createObject() {
    $userObject = null;
    $userObject = new User();
    
    if ($userObject != null) {
      $assert = true;
    }
    else {
      $assert = false;
    }
    
    $this->assertEquals(true, $assert);
  }


  /*
   * check if getAllUsers returns at least one value
   */
  public function test_getAllUsersTest() {
    $userObject = null;
    $userObject = new User();
    
    if ($userObject != null) {
      $return = $userObject->getAllUsers();
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
   * get all users and take the id from the first [0] to get it again by getUser()
   * check if the name is the same
   */
  public function test_getUser() {
    $userObject = null;
    $userObject = new User();
    
    if ($userObject != null) {
      $return = $userObject->getAllUsers();
      if ( count($return) > 0 ) {
        $returnUser = $userObject->getUser($return[0]['uID']);  
        
        if ( $return[0]['uName'] == $returnUser['uName'] ) {
          $assert = true;  
        }
        else {
          $assert = false;
        }
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