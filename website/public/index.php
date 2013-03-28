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

if ($page == 'public') {
	require_once '../classes/Folder.php';
	$folder = Folder::getFolderFromHash($_GET['id']);
	$bodyTpl = '<h1>öffentlicher Upload</h1>Hash=' . $_GET['id'] . ', FolderID=' . $folder['fID'] . ', FolderName=' . $folder['fName'];
} else if (LoginAccess::check()) {
	
	$smarty -> assign('isLogin', true);
	$smarty -> assign('userLevel', LoginAccess::userLevel());

	$smarty -> assign('userinfo', LoginAccess::userInfo());

	switch ($url[0]) {
		case '' :
		case 'folder' :
			require_once '../classes/Document.php';
			require_once '../classes/Folder.php';

			if (isset($_POST['fAddSubmit'])) {
				Folder::addFolder($_POST['fAddName'], $folder['fID'], LoginAccess::userID());
			}

			if (isset($_GET['delete']) and isset($_GET['fID'])) {
				Folder::deleteFolder($_GET['fID']);
			}

			if (isset($_GET['link']) and isset($_GET['fID'])) {
				Folder::addFolderLink($_GET['fID']);
			}

			$folderUrl = deleteItem($url, 0);
			$folderLink = implode('/', $folderUrl);
			$allFolders = Folder::getFolder();
			$folder = $allFolders[$folderLink];
			$smarty -> assign('allFolders', $allFolders);
			$smarty -> assign('folder', $folder);
			
			if (isset($_POST['dAddSubmit'])) {
				require_once '../classes/Upload.php';
				//$uID, $fID, $dAuthor, $file
				Upload::fileUpload(LoginAccess::userID(), $folder['fID'], $_POST['dAddAutor'], $_FILES['dAddFile']);
			}

			$smarty -> assign('documents', Document::getDocumentsFromFolderID($folder['fID']));
			$smarty -> assign('folders', Folder::getFolderArray($folder['fID']));
			$smarty -> assign('folderNav', Folder::getFolderArray());
			$bodyTpl = $smarty -> fetch('fileManager.tpl');
			break;

		case 'admin' :
			if(LoginAccess::check(500)) {
				$bodyTpl = $smarty -> fetch('admin.tpl');
				break;
			}
		case 'schnelltest' :
				$bodyTpl = $smarty -> fetch('schnelltest.tpl');
				break;
		default :
			$bodyTpl = '<h2>404</h2>';
			break;
	}
} else {
	$bodyTpl = $smarty -> fetch('login.tpl');
}

$smarty -> assign('body', $bodyTpl);

$smarty -> display('layout.tpl');
?>