<?php
require_once '/usr/share/php/PHPUnit/Autoload.php';
require_once '../configs/setup.php';

class DBTest extends PHPUnit_Framework_TestCase {
  protected $database ="testDB";
  
  

  /*
   * called before every test-function call
   * set up test environment
   */
  protected function setUp() {
    echo "setUp()";    

    /*
    global $logData;
  
    // create database
    $sql = "CREATE DATABASE ".$this->database;
    mysql_connect($logData['host'], $logData['user'], $logData['pass'])
      or die(mysql_error()); 
    
    echo $sql." wird ausgefuehrt...";
    mysql_query($sql) 
      or die(mysql_error());
      
    mysql_close();*/    
  }
  
  /*
   * called after every test-function call
   * clean up test environment
   */
  protected function tearDown() {
    echo "tearDown()";
    
    /*
    $sql_befehl = "DROP DATABASE ".$this->database;
    mysql_connect($logData['host'], $logData['user'], $logData['pass'])
      or die(mysql_error()); 
    
    echo $sql." wird ausgefuehrt...";
    mysql_query($sql) 
      or die(mysql_error());
      
    mysql_close();
    */
  }
  
  /*
   * connect to DB
   * assert if failed
   */
  public function test_connectToLocalhost() {
    echo "test_connectToLocalhost()";
    
    $db = new DB($logData);
    if ($db != false)
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