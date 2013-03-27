<?php
/*
 * mySQL Datenbanken Funktionen
 *
 * LICENSE:
 * (c) FRUIT of ART - Timo Schneider - 08.02.2013 - v 1.6
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
 * v1.51	INSERT IGNORE
 * 			new Function: ifExist als Erweiterung von isData
 * v1.52	new Function: insertUpdate
 * v1.6		only return messages (true or false)
 *
 */

class DB {

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
		while ($row = mysql_fetch_assoc($this -> result)) {
			$array[] = stripslashes_deep($row);
		}
		return $array;
	}

	public function lines() {

		$return = mysql_fetch_assoc($this -> result);
		$return = stripslashes_deep($return);

		return $return;
		//$this -> linesAsArray(); mysql_fetch_assoc($this -> result);
	}

	public function line($line) {
		$row = mysql_fetch_assoc($this -> result);
		return $row[$line];
	}

	//INSERT UPDATE
	public function insertUpdate($table, $array, $idArray, $ignore = false) {

		$array['change_date'] = Helper::timenow();
		if (is_array($idArray) and count($idArray) > 0 and $this -> ifExist($table, $idArray)) {
			return $this -> update($table, $array, $idArray);
		} else {
			$array['create_date'] = Helper::timenow();
			return $this -> insert($table, $array, $ignore);
		}
	}

	//INSERT
	public function insert($table, $array, $ignore = false) {

		$this -> isConnect();

		$ignoreClause = ($ignore) ? 'IGNORE' : '';

		$sql = "INSERT $ignoreClause INTO `$table` (";
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
			if (is_array($content)) {
				//array_walk_recursive($content, 'myFunc');
				$content = serialize($content);
			} else {
				$content = stringSave($content);
			}
			$sql .= "'" . $content . "'";
		}
		$sql .= ")";

		$result = mysql_query($sql, $this -> connection);
		if (!$result) {
			$this -> error_out(0, $sql);
			return false;
		}
		$this -> result = $result;
		return true;
	}

	//UPDATE
	public function update($table, $array, $idArray) {

		$this -> isConnect();

		$sql = "UPDATE `$table` SET ";

		$first = true;
		foreach ($array as $name => $content) {
			if ($first == false)
				$sql .= ", ";
			else
				$first = false;
			if (is_array($content)) {
				//array_walk_recursive($content, 'myFunc');
				$content = serialize($content);
			} else {
				$content = stringSave($content);
			}

			$sql .= "`$name` = '$content'";
		}

		$sql .= " WHERE ";

		$first = true;
		foreach ($idArray as $name => $content) {
			if ($first == false)
				$sql .= " and ";
			else
				$first = false;

			$sql .= "`$name` = '$content'";
		}

		$sql .= " LIMIT 1";

		$result = mysql_query($sql, $this -> connection);
		if (!$result) {
			$this -> error_out(0, $sql);
			return false;
		}
		$this -> result = $result;
		return true;
	}

	//PRUEFEN
	public function ifExist($table, $array) {

		$this -> isConnect();
		// TODO: Prüfen ob Array überhaupt befüllt
		$sql = "SELECT * FROM `$table` WHERE ";

		$first = true;
		foreach ($array as $key => $value) {
			if ($first == false)
				$sql .= " and ";
			$first = false;

			$sql .= "`$key` = '$value'";
		}

		$test = mysql_query($sql, $this -> connection) or die('invalid UPDATE query: ' . mysql_error());
		if (mysql_num_rows($test) >= 1)
			return true;
		else
			return false;
	}

	/**
	 * Prüfen ob schon existiert (old)
	 * @deprecated
	 */
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
		return true;
	}

	/**
	 * DELETE (old)
	 * @deprecated
	 */
	public function delete($table, $row, $value, $limit = 1) {

		$this -> isConnect();

		$sql = "DELETE FROM `$table` WHERE $row=$value LIMIT $limit";

		$result = mysql_query($sql, $this -> connection);
		if (!$result) {
			$this -> error_out(0, $sql);
			return false;
		}
		$this -> result = $result;
		return true;
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

function stringSave($string) {
	$string = htmlspecialchars($string, ENT_QUOTES, 'UTF-8', false);
	$string = mysql_real_escape_string($string);
	return $string;
}

function stripslashes_deep($value) {
	$value = is_array($value) ? array_map('stripslashes_deep', $value) : stripslashes($value);
	return $value;
}
?>