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
    // setup configuration
    /*$this->logData = array('host'     => 'localhost', 
                           'user'     => 'root',
                           'pass'     => 'root',
                           'database' => 'testDB',
                           'debug'    => true
                          );*/
    global $logData;
  
    // create database
    $sql = "CREATE DATABASE ".$database;
    mysql_connect($logData['host'], $logData['user'], $logData['pass'])
      or die(mysql_error()); 
      
    mysql_query($sql) 
      or die(mysql_error());
      
    mysql_close();
    
  }
  
  /*
   * called after every test-function call
   * clean up test environment
   */
  protected function tearDown() {
    $sql_befehl = "DROP DATABASE ".$database;
    mysql_connect($logData['host'], $logData['user'], $logData['pass'])
      or die(mysql_error()); 
      
    mysql_query($sql) 
      or die(mysql_error());
      
    mysql_close();
  }
  
  /*
   * connect to DB
   * assert if failed
   */
  public function test_connectToLocalhost() {
    $db = new DB($logData);
    $this -> assertFalse($db);
  }

}


?>