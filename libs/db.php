<?php
/*
 * mySQL Datenbanken Funktionen
 *
 * LICENSE:
 * (c) FRUIT of ART - Timo Schneider - 22.01.2013 - v 1.5
 *
 * FUNCTIONS:
 * auslesen, neuer Eintag, updaten, loeschen, Eintraege zaehlen, isData, error_out
 *
 * FEATURE:
 * - Wenn Array uebermittelt wird, wird dieses in eine speicherbare Repraesentation umgewandelt (serialize)
 *
 * CHANGELOG:
 * 
 * v1.5	new Function: deleteWithWhereArray()
 * 		new Function: linesAsArray()
 * 
 */

class db {

	private $host = null;
	private $user = null;
	private $pass = null;
	private $database = null;
	private $debug = false;

	private $connection = NULL;
	private $result = NULL;
	private $counter = NULL;

	//CONNECT (CONSTRUCTOR)
	public function __construct($logData = null) {

		if ($logData == null)
			global $logData;

		//Datenbankdaten explizit übergeben
		$this -> host = $logData['host'];
		$this -> user = $logData['user'];
		$this -> pass = $logData['pass'];
		$this -> database = $logData['database'];
		$this -> debug = $logData['debug'];

		$connect = mysql_connect($this -> host, $this -> user, $this -> pass, TRUE);
		if (!$connect) {
			$this -> error_out();
			return false;
		}
		$this -> connection = $connect;
		$connect = mysql_select_db($this -> database, $connect);
		if (!$connect) {
			$this -> error_out();
			return false;
		}

		return $this -> connection;
	}

	//SELECT
	public function read($sql) {

		$this -> isConnect();

		$result = mysql_query($sql, $this -> connection);
		if (!$result) {
			$this -> error_out(0, $sql);
			return false;
		}
		$this -> result = $result;
		return $result;
		$this -> counter = NULL;
	}
	
	public function linesAsArray() {
		$array = array();
		while ($row = $this -> lines()) {
			$array[]=$row;
		}
		return $array;
	}

	public function lines() {
		return mysql_fetch_assoc($this -> result);
	}

	public function line($line) {
		$row = mysql_fetch_assoc($this -> result);
		return $row[$line];
	}

	//INSERT
	public function insert($table, $array) {

		$this -> isConnect();

		$sql = "INSERT INTO `$table` (";
		$first = true;
		foreach ($array as $name => $content) {
			if ($first == false)
				$sql .= ", ";
			else
				$first = false;
			$sql .= $name;
		}
		$sql .= ") VALUES (";
		$first = true;
		foreach ($array as $name => $content) {
			if ($first == false)
				$sql .= ", ";
			else
				$first = false;
			if (is_array($content))
				$content = serialize($content);
			$sql .= "'" . $content . "'";
		}
		$sql .= ")";

		$result = mysql_query($sql, $this -> connection);
		if (!$result) {
			$this -> error_out(0, $sql);
			return false;
		}
		$this -> result = $result;
		return '<div class="save">new entry into DB ' . $table . '</div>';
	}

	//UPDATE
	public function update($table, $array, $row, $value) {

		$this -> isConnect();

		$sql = "UPDATE `$table` SET ";

		$first = true;
		foreach ($array as $name => $content) {
			if ($first == false)
				$sql .= ", ";
			else
				$first = false;
			if (is_array($content))
				$content = serialize($content);
			$sql .= "`$name` = '$content'";
		}

		$sql .= " WHERE `$row`='$value' LIMIT 1";

		$result = mysql_query($sql, $this -> connection);
		if (!$result) {
			$this -> error_out(0, $sql);
			return false;
		}
		$this -> result = $result;
		return '<div class="save">"' . $row . '" = "' . $value . '" from DB "' . $table . '" updated</div>';
	}

	//PRUEFEN
	public function isData($table, $row, $value) {

		$this -> isConnect();

		$sql = "SELECT `$row` FROM `$table` WHERE `$row`='$value'";
		$test = mysql_query($sql, $this -> connection) or die('invalid UPDATE query: ' . mysql_error());
		if (mysql_num_rows($test) >= 1)
			return true;
		else
			return false;
	}

	//DELETE NEW
	public function deleteWithWhereArray($table, $array, $limit = 1) {

		$this -> isConnect();

		$sql = "DELETE FROM `$table` WHERE ";
		
		$first = true;
		foreach ($array as $name => $content) {
			if ($first == false)
				$sql .= " and ";
			else
				$first = false;
			
			$sql .= "`$name` = '$content'";
		}

		$sql .= " LIMIT $limit";

		$result = mysql_query($sql, $this -> connection);
		if (!$result) {
			$this -> error_out(0, $sql);
			return false;
		}
		$this -> result = $result;
		return '<div class="save">"' . $row . '" = "' . $value . '" from DB "' . $table . '" deleted</div>';
	}

	//DELETE
	public function delete($table, $row, $value, $limit = 1) {

		$this -> isConnect();

		$sql = "DELETE FROM `$table` WHERE $row=$value LIMIT $limit";

		$result = mysql_query($sql, $this -> connection);
		if (!$result) {
			$this -> error_out(0, $sql);
			return false;
		}
		$this -> result = $result;
		return '<div class="save">"' . $row . '" = "' . $value . '" from DB "' . $table . '" deleted</div>';
	}

	//LAST INSERT ID
	public function lastInsertId() {

		$this -> isConnect();

		$result = mysql_insert_id($this -> connection);
		if (!$result) {
			$this -> error_out(0, 'mysql_insert_id()');
			return false;
		}
		$this -> result = $result;
		return $result;
	}

	public function disconnect() {
		if (is_resource($this -> connection))
			mysql_close($this -> connection);
	}

	public function valueCount() {
		if ($this -> counter == NULL && is_resource($this -> result)) {
			$this -> counter = mysql_num_rows($this -> result);
		}
		return $this -> counter;
	}

	function isConnect() {
		if (!$this -> connection) {
			$this -> error_out("Nicht verbunden.");
			return false;
		}
	}

	function error_out($text = NULL, $sql = NULL) {
		if ($this -> debug == true) {

			if (!mysql_errno())
				return;
			if ($text != NULL) {
				echo('
				<table>
					<tr>
						<td colspan="2"><font face="Verdana" size="2"><b>Datenbankfehler</b>:</font></td>
					</tr>
					<tr>
						<td valign="top"><font face="Verdana" size="2">SQL-Fehler-Mitteilung:</font></td>
						<td><font face="Verdana" size="2">' . $text . '</font></td>
					</tr>
				</table>
				');
				exit();
			} else {
				echo('
				<table>
				<tr>
					<td colspan="2"><font face="Verdana" size="2"><b>Datenbankfehler</b>:</font></td>
				</tr>
				<tr>
					<td width="170" valign="top"><font face="Verdana" size="2">SQL-Fehler-Mitteilung:</font></td>
					<td><font face="Verdana" size="2">' . mysql_error() . '</font></td>
				</tr>
				<tr>
					<td valign="top"><font face="Verdana" size="2">SQL-Fehler-Nummer:</font></td>
					<td><font face="Verdana" size="2">' . mysql_errno() . '</font></td>
				</tr>
				<tr>
					<td valign="top"><font face="Verdana" size="2">SQL-Statement:</font></td>
					<td><font face="Verdana" size="2">' . $sql . '</font></td>
				</tr>
				</table>
				');
				exit();
			}
		} else {
			echo '<br /><br /><b>Datenbankfehler</b>: Bitte wenden Sie sich an den Administrator: <a href="mailto:info@kleiner-als.de">info@kleiner-als.de</a><br />';
			exit();
		}
	}

}
?>