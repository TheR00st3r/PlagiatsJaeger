<?php
require_once '../configs/setup.php';
$smarty = new MySmarty();

//echo $_SERVER['DOCUMENT_ROOT'];

$smarty -> assign('root', $root);
$smarty -> assign('mySQL', $logData['host']);
$smarty -> assign('version', '1.5.2');

$get_array = $_GET;

$url = explode("/", $get_array['url']);
$url = deleteEmptyItems($url);
$page = implode('/', $url);

$smarty -> assign('page', $page);

// Lgout
if ($page == 'logout') {
	LoginAccess::logout();
}

//Login check
if (isset($_POST['lSubmit'])) {
	$loginResult = LoginAccess::login($_POST['lEMailAdress'], $_POST['lPassword']);
	$smarty -> assign('message', $loginResult);
}

// Public student Upload
if ($page == 'public') {
	require_once '../classes/Folder.php';
	$folder = Folder::getFolderFromHash($_GET['id']);
	if ($folder['fID']) {

		if ($folder['fLinkExpireDatetime'] > date("Y-m-d H:i:s")) {

			if (isset($_POST['dAddSubmit'])) {
				require_once '../classes/Upload.php';
				if (Upload::fileUpload($folder['fID'], $_POST['dAddAutor'], $_FILES['dAddFile'])) {
					$contentTpl = 'vielen Dank!';
				} else
					$contentTpl = 'upload Error';
			} else {
				$contentTpl = $smarty -> fetch('public.tpl');
			}
		} else {
			$contentTpl = 'Link ist abgelaufen....';
		}
	} else
		$contentTpl = 'error';

//Is loggedin
} else if (LoginAccess::check()) {

	$smarty -> assign('isLogin', true);
	$smarty -> assign('userLevel', LoginAccess::getUserLevel());

	$smarty -> assign('userinfo', LoginAccess::getUserInfo());

	switch ($url[0]) {
		case '' :
		case 'shared' :
		case 'folder' :
			// Folder Overview

			switch ($url[0]) {
				case 'shared':
					$fpLevel = 700;
					break;
				default:
					$fpLevel = 900;
					break;
			}
			$smarty -> assign('fpLevel', $fpLevel);

			// require_once '../classes/Document.php';
			require_once '../classes/Folder.php';
			require_once '../classes/Upload.php';
			require_once '../classes/Report.php';
			require_once '../classes/User.php';
			require_once '../classes/Setting.php';

			// get users
			$users = User::getAllUser();
			$smarty -> assign('users', $users);

			// get settings
			$settings = Setting::getAllSettings();
			$smarty -> assign('settings', $settings);

			// get selected folder
			$folderUrl = deleteItem($url, 0);
			$folderLink = implode('/', $folderUrl);
			$allFolders = Folder::getFolders($fpLevel, null);
			$folder = $allFolders[$folderLink];

			$smarty -> assign('folder', $folder);

			if (Validator::validate(VAL_INTEGER, $_GET['fID'], true)) {
				switch ($_GET['action']) {
					case 'deleteFolder' :
						Folder::deleteFolder($_GET['fID']);
				}
			}

			// POST FUNCTIONS
			$post = key($_POST['button']);
			switch ($post) {
				case 'dAddFolderLinkSubmit' :
					Folder::addFolderLink($_POST['fID'], $_POST['fLinkExpireDatetime']);
					break;
				case 'fAddSubmit' :
					Folder::addFolder($_POST['fAddName'], $folder['fID'], LoginAccess::getUserID());
					break;
				case 'dAddSubmit' :
					$uploadCheck = Document::fileUpload($folder['fID'], $_POST['dAddAutor'], $_FILES['dAddFile']);
					$messages = $uploadCheck['messages'];
					break;
				case 'dAddShortSubmit' :
					Upload::shortTextUpload($folder['fID'], $_POST['dAddAutor'], $_POST['dAddShortText']);
					break;
				case 'dAddFolderShareSubmit' :
					$saveCheck = Folder::saveMultibleFolderPermissions(700, $_POST['fID'], $_POST['uIDs']);
					$messages = $saveCheck['messages'];
					break;
				case 'rAdd' :
					$reportCheck = Report::createReport($_POST['dID'], $_POST['slID'], $_POST['rThreshold'], $_POST['rCheckWWW']);
					$messages = $reportCheck['messages'];
					break;
			}

			$smarty -> assign('messages', $messages);

			//get documents from selected folder
			$smarty -> assign('documents', Document::getDocumentsFromFolderID($folder['fID']));
			// get all sub folders from selected folder
			$smarty -> assign('folders', Folder::getFolderArray($fpLevel, $folder['fID']));
			//get all folders for navigation overview
			$smarty -> assign('folderNav', Folder::getFolderArray(900, null));
			//get all shared folders from user
			$smarty -> assign('sharedFolders', Folder::getFolderArray(700, null));
			// $smarty -> assign('sharedFolders', Folder::getSharedFolders(LoginAccess::getUserID()));

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

				// POST FUNCTIONS
				$post = key($_POST['button']);
				switch ($post) {
					case 'uAddSubmit' :
						$return = User::newUser($_POST['uName'], $_POST['uLastname'], $_POST['uEMailAdress'], $_POST['uPassword'], $_POST['uPermissonLevel']);
						break;
					case 'uActivate' :
						$return = User::activateUser($_POST['uID'], $_POST['uPermissonLevel']);
						break;
					case 'uDelete' :
						$return = User::deleteUser($_POST['uID']);
						break;
				}

				$smarty -> assign('messages', $return['messages']);

				$smarty -> assign('user', User::getAllUser());
				$contentTpl = $smarty -> fetch('admin.tpl');
				break;
			}
		default :
			$contentTpl = '<h2>404</h2>';
			break;
	}
// NOT loggedin
} else {
	switch ($url[0]) {
		case 'registrate' :
			$post = key($_POST['button']);
			switch ($post) {
				case 'uRegistrate' :
					require_once '../classes/User.php';
					$return = User::registrateUser($_POST['uName'], $_POST['uLastname'], $_POST['uEMailAdress'], $_POST['uPassword'], $_POST['uPassword2'], $_POST['cID']);
					$smarty -> assign('messages', $return['messages']);
					break;
			}
			$contentTpl = $smarty -> fetch('registrate.tpl');
			break;

		case 'reset-password' :
			require_once '../classes/User.php';
			$uIDCheck = User::checkRestoreKey($_GET['key']);

			if ($uIDCheck['state']) {
				$userCheck = User::getUser($uIDCheck['uID']);
				$smarty -> assign('user', $userCheck['user']);

				if ($userCheck['state']) {
					if ($_POST['uPasswordReset']) {
						$pwCheck = User::setUserPassword($_POST['uPassword1'], $_POST['uPassword2'], $uIDCheck['uID']);
						if ($pwCheck['state']) {
							$state = true;
						}
						$messages = $pwCheck['messages'];
					}
				} else
					$messages = $userCheck['messages'];

				$contentTpl = $smarty -> fetch('reset-password.tpl');

			} else
				$messages = $uIDCheck['messages'];

			$smarty -> assign('messages', $messages);
			break;

		case 'forgot-password' :
			if ($_POST['getIdFromEmail']) {
				require_once '../classes/User.php';
				$check = User::setRestoreKey($_POST['password_email']);
				$smarty -> assign('messages', $check['messages']);
			} else
				$contentTpl = $smarty -> fetch('forgot-password.tpl');
			break;

		default :
			$contentTpl = $smarty -> fetch('login.tpl');
			break;
	}
}
$smarty -> assign('content', $contentTpl);
$bodyTpl = $smarty -> fetch('layout.tpl');
$smarty -> assign('body', $bodyTpl);

$smarty -> display('_maske.tpl');
?>
