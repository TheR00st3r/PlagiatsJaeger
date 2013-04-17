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
	if ($folder['fID']) {
		
		//TODO: DATUM PRÜFEN fLinkExpireDatetime
		
		if (isset($_POST['dAddSubmit'])) {
			require_once '../classes/Upload.php';
			if (Upload::fileUpload($folder['fID'], $_POST['dAddAutor'], $_FILES['dAddFile'])) {
				$contentTpl = 'vielen Dank!';
			} else
				$contentTpl = 'upload Error';
		} else {
			$contentTpl = $smarty -> fetch('public.tpl');
		}
	} else
		$contentTpl = 'error';

} else if (LoginAccess::check()) {

	$smarty -> assign('isLogin', true);
	$smarty -> assign('userLevel', LoginAccess::getUserLevel());

	$smarty -> assign('userinfo', LoginAccess::getUserInfo());

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
						Folder::addFolderLink($_POST['fID'], $_POST['fLinkExpireDatetime']);
						break;
					default :
						break;
				}
			}

			if (Validator::validate(VAL_INTEGER, $_GET['dID'], true)) {
				switch ($_GET['action']) {
					case 'deleteDoc' :
						break;
					case 'check' :
						Report::createReport($_GET['dID']);
						break;
					default :
						break;
				}
			}

			$post = key($_POST['button']);
			switch ($post) {
				case 'dAddFolderLinkSubmit' :
					Folder::addFolderLink($_POST['fID'], $_POST['fLinkExpireDatetime']);
					break;
				case 'fAddSubmit' :
					Folder::addFolder($_POST['fAddName'], $folder['fID'], LoginAccess::getUserID());
					break;
				case 'dAddSubmit' :
					Document::fileUpload($folder['fID'], $_POST['dAddAutor'], $_FILES['dAddFile']);
					break;
				case 'dAddShortSubmit' :
					Upload::shortTextUpload($folder['fID'], $_POST['dAddAutor'], $_POST['dAddShortText']);
					break;
			}

			$smarty -> assign('documents', Document::getDocumentsFromFolderID($folder['fID']));
			$smarty -> assign('folders', Folder::getFolderArray($folder['fID']));
			$smarty -> assign('folderNav', Folder::getFolderArray());
			$contentTpl = $smarty -> fetch('folder.tpl');
			break;

		case 'report' :
			require_once '../classes/Result.php';
			$smarty -> assign('results', Result::getResultsFromReportID($_GET['rID']));
			$contentTpl = $smarty -> fetch('report.tpl');
			break;

		case 'settings' :
			$contentTpl = $smarty -> fetch('settings.tpl');
			break;

		case 'admin' :
			if (LoginAccess::check(500)) {
				require_once '../classes/User.php';
				if (isset($_POST['uAddSubmit'])) {
					User::newUser($_POST['uName'], $_POST['uLastname'], $_POST['uEMailAdress'], $_POST['uPassword'], $_POST['uPermissonLevel']);
				}

				$smarty -> assign('user', User::getAllUser());
				$contentTpl = $smarty -> fetch('admin.tpl');
				break;
			}
		default :
			$contentTpl = '<h2>404</h2>';
			break;
	}
} else {
	$contentTpl = $smarty -> fetch('login.tpl');
}
$smarty -> assign('content', $contentTpl);
$bodyTpl = $smarty -> fetch('layout.tpl');
$smarty -> assign('body', $bodyTpl);

$smarty -> display('_maske.tpl');
?>
