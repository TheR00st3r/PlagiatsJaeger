<?php
require_once '/usr/share/php5/PEAR/PHPUnit/Autoload.php';
require_once 'classes/DB.php';

class DBTest extends PHPUnit_Framework_TestCase {
  protected $logData;

  /*
   * called before every test-function call
   * set up test environment
   */
  protected function setUp() {
    // setup configuration
    $this->logData = array('host'     => 'localhost', 
                           'user'     => 'root',
                           'pass'     => 'root',
                           'database' => 'testDB',
                           'debug'    => true
                          );
  
    // create database
    $sql = 'CREATE DATABASE '.$this->logData['database'];
    mysql_connect($this->logData['host'], $this->logData['user'], $this->logData['pass'])
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
    $sql_befehl = 'DROP DATABASE '.$this->logData['database'];
    mysql_connect($this->logData['host'], $this->logData['user'], $this->logData['pass'])
      or die(mysql_error()); 
    mysql_query($sql) 
      or die(mysql_error());
    mysql_close();
    
    unset($this->logData);
  }
  
  /*
   * connect to DB
   * assert if failed
   */
  public function test_connectToLocalhost() {
    $db = new DB($this->logData);
    $this -> assertFalse($db);
  }

}


?>