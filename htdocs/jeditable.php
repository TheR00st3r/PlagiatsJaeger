<?php
require_once '../configs/setup.php';
$smarty = new MySmarty();
if (LoginAccess::check()) {
	// print_array($_POST);

	$id = explode("_", $_POST['id']);
	$content = $_POST['content'];

	switch ($id[0]) {
		case 'fName' :
			require_once '../classes/Folder.php';
			if (Folder::editFolderName($id[1], $content)) {
				echo $content;
			}
			break;
		default :
			echo 'error';
			break;
	}

	// $smarty -> assign('arrayName', $_POST['arrayName']);
	// $smarty -> display('intern/ajax/singleText.tpl');
}
?>