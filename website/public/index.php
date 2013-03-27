<?php
require_once '../configs/setup.php';
$smarty = new MySmarty();

//echo $_SERVER['DOCUMENT_ROOT'];

$smarty -> assign('root', $root);

$get_array = $_GET;

$url = explode("/", $get_array['url']);
$url = deleteEmptyItems($url);
$page = implode('/', $url);

$smarty -> assign('page', $page);

if ($page == 'logout') {
	LoginAccess::logout();
}

if (isset($_POST['lSubmit'])) {
	$loginResult = LoginAccess::login($_POST['lEMailAdress'], $_POST['lPassword']);
	$smarty -> assign('message', $loginResult);
}

if (LoginAccess::check()) {

	$smarty -> assign('userinfo', LoginAccess::userInfo());
	
	require_once '../classes/Folder.php';

	switch ($url[0]) {
		case 'folder' :
			
			if(isset($_GET['delete']) and isset($_GET['fID'])) {
				Folder::deleteFolder($_GET['fID']);
			}
			
			$folderUrl = deleteItem($url, 0);
			$folderLink = implode('/', $folderUrl);
			$allFolders = Folder::getFolder();
			
			$folder = $allFolders[$folderLink];
			
			$smarty -> assign('folder', $folder);
			
			$smarty -> assign('folders', Folder::getFolderArray($folder['fID']));
			
			//print_array($folder);
			require_once '../classes/Document.php';
			$smarty -> assign('documents', Document::getDocumentsFromFolderID($folder['fID']));
			
			//print_array(Document::getDocumentsFromFolderID($folder['fID']));
			

		case '' :
			if (isset($_POST['fAddSubmit'])) {
				Folder::addFolder($_POST['fAddName'], $_POST['fAddParent'], LoginAccess::userID());
			}
			$smarty -> assign('folderNav', Folder::getFolderArray());
			$smarty -> assign('fParents', Folder::getFolderParents());
			$bodyTpl = $smarty -> fetch('pages/fileManager.tpl');
			break;

		default :
			$bodyTpl = '<h1>404</h1>';
			break;
	}
} else {
	$bodyTpl = $smarty -> fetch('pages/login.tpl');
}

$smarty -> assign('body', $bodyTpl);

$smarty -> display('layout.tpl');
?>