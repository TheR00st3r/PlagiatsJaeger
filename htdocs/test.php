<?

// echo 'test';

$allowedExtensions = array('.pdf', '.doc', '.docx', '.txt', '.html');

$file["name"] = "asdjfhga.asfd.asdf.test.";

$pos = strripos($file["name"], '.');
$extension = strtolower(substr($file["name"], $pos));

// echo $extension;

if (in_array($extension, $allowedExtensions)) {
	echo $extension;
}
?>