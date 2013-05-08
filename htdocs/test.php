<?

require_once '../configs/setup.php';
	// ini_set("display_errors", 1);
	// error_reporting(1);
// echo 'test';

// $allowedExtensions = array('.pdf', '.doc', '.docx', '.txt', '.html');
// 
// $file["name"] = "asdjfhga.asfd.asdf.test.";
// 
// $pos = strripos($file["name"], '.');
// $extension = strtolower(substr($file["name"], $pos));
// 
// // echo $extension;
// 
// if (in_array($extension, $allowedExtensions)) {
	// echo $extension;
// }
  
require_once '../classes/Folder.php';

print_array(Folder::getFolderArray());

// echo str_word_count(File::readFile('test.txt'));

// print_array(str_word_count(File::readFile('test.txt'), 1, 'äüöÄÜÖß'));
// $words = (str_word_count(File::readFile('test.txt'), 1, 'äüöÄÜÖß'));
// 
// echo count($words);
// 
// for ($i=0; $i<count($words); $i++) {
	// echo $words[$i];
// }
// 
// foreach ($words as $word) {
	// echo $word;
// }
echo 'ende';
?>