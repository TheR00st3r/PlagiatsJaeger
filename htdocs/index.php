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
			require_once '../classes/Upload.php';
			require_once '../classes/Report.php';

			$folderUrl = deleteItem($url, 0);
			$folderLink = implode('/', $folderUrl);
			$allFolders = Folder::getFolder();
			$folder = $allFolders[$folderLink];
			$smarty -> assign('folder', $folder);

			if (Validator::validate(VAL_INTEGER, $_GET['fID'], true)) {
				switch ($_GET['action']) {
					case 'deleteFolder' :
						Folder::deleteFolder($_GET['fID']);
						break;
					case 'hash' :
						Folder::addFolderLink($_GET['fID']);
						break;
					default :
						break;
				}
			}
			
			if (Validator::validate(VAL_INTEGER, $_GET['dID'], true)) {
				switch ($_GET['action']) {
					case 'deleteDoc' :
						//Document::deleteDocument($_GET['dID']);
						break;
					case 'check' :
						Report::createReport($_GET['dID']);
						break;
					default :
						break;
				}
			}

			if (isset($_POST['fAddSubmit'])) {
				Folder::addFolder($_POST['fAddName'], $folder['fID'], LoginAccess::userID());
			} else if (isset($_POST['dAddSubmit'])) {
				Upload::fileUpload(LoginAccess::userID(), $folder['fID'], $_POST['dAddAutor'], $_FILES['dAddFile']);
			} else if (isset($_POST['dAddShortSubmit'])) {
				Upload::shortTextUpload(LoginAccess::userID(), $folder['fID'], $_POST['dAddAutor'], $_POST['dAddShortText']);
			}

			$smarty -> assign('documents', Document::getDocumentsFromFolderID($folder['fID']));
			$smarty -> assign('folders', Folder::getFolderArray($folder['fID']));
			$smarty -> assign('folderNav', Folder::getFolderArray());
			$bodyTpl = $smarty -> fetch('folder.tpl');
			break;
		
		case 'report' :
			require_once '../classes/Result.php';
			// print_array(Result::getResultsFromReportID($_GET['rID']));
			$smarty -> assign('results', Result::getResultsFromReportID($_GET['rID']));
			$bodyTpl = $smarty -> fetch('report.tpl');
			break;

		case 'admin' :
			if (LoginAccess::check(500)) {
				require_once '../classes/User.php';
				if (isset($_POST['uAddSubmit'])) {
					User::newUser($_POST['uName'], $_POST['uLastname'], $_POST['uEMailAdress'], $_POST['uPassword'], $_POST['uPermissonLevel']);
				}

				$smarty -> assign('user', User::getAllUser());
				$bodyTpl = $smarty -> fetch('admin.tpl');
				break;
			}
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