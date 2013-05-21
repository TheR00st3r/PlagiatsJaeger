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

// require_once '../classes/Folder.php';



// print_array(Folder::getSharedFolders(null));

// $db = new db();
// $db -> read("
// SELECT
// f.fID, f.fName, f.fParentID, f.fHashLink, fLinkExpireDatetime,
// (SELECT CONCAT(u.uName, ' ', u.uLastname) FROM folderpermission AS fp LEFT JOIN user AS u ON fp.uID = u.uID WHERE fp.fpPermissionLevel = 900 and fp.fID = f.fID) AS uName
// FROM
// folder AS f LEFT JOIN folderpermission AS p ON f.fID = p.fID
// WHERE
// p.fpPermissionLevel = 900 and p.uID != '$uID'
// ORDER BY
// f.fID DESC");
//
// $uID = LoginAccess::getUserID();
//
// $folders = array();
// while ($row = $db -> lines()) {
// Folder::getFolderPermissions($row['fID']);
// $row['user'] = Folder::getFolderPermissions($row['fID']);
// }
//
// function test($folders, $newFolders) {
//
// while (count($folders) > 0) {
// $aktuell = reset($folders);
//
// if (in_array($uID, $aktuell['user'])) {
// $newFolders[]
// }
//
// }
//
// // if (in_array($uID, $folder['user'])) {
// // $folders[] = $row;
// // }
// }
//
// print_array($folders);

// print_array(Folder::getFolderArray());

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