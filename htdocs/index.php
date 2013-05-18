<?php
require_once '../configs/setup.php';
$smarty = new MySmarty();

require_once '../classes/User.php';

//echo $_SERVER['DOCUMENT_ROOT'];

$smarty -> assign('root', $root);
$smarty -> assign('mySQL', $logData['host']);
$smarty -> assign('version', '1.5');

$get_array = $_GET;
$post = key($_POST['button']);

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
				if (Validator::validate(VAL_STRING, $_POST['dAddAutor'], true) and isset($_FILES['dAddFile'])) {
					require_once '../classes/Document.php';
					$check = Document::addDocument($folder['fID'], $_POST['dAddAutor'], $_FILES['dAddFile'], $folder['slID'], $folder['uThreshold'], $folder['uCheckWWW']);
					if ($check['state']) {
						$contentTpl = 'vielen Dank!';
					} else
						$contentTpl = 'upload Error';
				} else {
					$messages[] = array(
						'type' => 'error',
						'text' => 'Bitte wählen Sie eine Datei aus und geben Ihren Namen an!'
					);
					$smarty -> assign('messages', $messages);
					$contentTpl = $smarty -> fetch('public.tpl');
				}
			} else {
				$contentTpl = $smarty -> fetch('public.tpl');
			}
		} else {
			$contentTpl = 'Link ist abgelaufen....Sie sind zu spät...';
		}
	} else
		$contentTpl = 'Ihr Link ist ungültig..';

	//Is loggedin
} else if (LoginAccess::check()) {

	require_once '../classes/Setting.php';

	$smarty -> assign('isLogin', true);
	$smarty -> assign('userLevel', LoginAccess::getUserLevel());

	$smarty -> assign('userinfo', LoginAccess::getUserInfo());

	// get settings
	$settings = Setting::getAllSettings();
	$smarty -> assign('settings', $settings);

	$userSettings = LoginAccess::getUserSettings();
	$smarty -> assign('userSettings', $userSettings);

	switch ($url[0]) {
		case '' :
		case 'shared' :
		case 'folder' :
			// Folder Overview

			switch ($url[0]) {
				case 'shared' :
					$fpLevel = 700;
					break;
				default :
					$fpLevel = 900;
					break;
			}
			$smarty -> assign('fpLevel', $fpLevel);

			require_once '../classes/Document.php';
			require_once '../classes/Folder.php';
			require_once '../classes/Report.php';

			// get users
			$users = User::getAllUser();
			$smarty -> assign('users', $users);

			// get selected folder
			$folderUrl = deleteItem($url, 0);
			$folderLink = implode('/', $folderUrl);
			$allFolders = Folder::getFolders($fpLevel, null);
			$folder = $allFolders[$folderLink];

			$smarty -> assign('folder', $folder);

			// POST FUNCTIONS
			switch ($post) {
				case 'createLink' :
					Folder::addFolderLink($_POST['fID'], $_POST['fLinkExpireDatetime']);
					break;
				case 'shareFolder' :
					$check = Folder::saveMultibleFolderPermissions(700, $_POST['fID'], $_POST['uIDs']);
					break;
				case 'newFolder' :
					Folder::addFolder($_POST['fAddName'], $folder['fID'], LoginAccess::getUserID());
					break;
				case 'deleteFolder' :
					$check = Folder::deleteFolder($_POST['fID']);
					break;
				case 'newFile' :
					// print_array($_FILES['dAddFile']);
					$check = Document::addDocument($folder['fID'], $_POST['dAddAutor'], $_FILES['dAddFile'], $userSettings['slID'], $userSettings['uThreshold'], $userSettings['uCheckWWW']);
					break;
				case 'newUrl' :
					$check = Document::addUrl($folder['fID'], $_POST['dAddAutor'], $_POST['dOriginalName'], $userSettings['slID'], $userSettings['uThreshold'], $userSettings['uCheckWWW']);
					break;
				case 'newSnipped' :
					$check = Document::addSnipped($folder['fID'], $_POST['dAddAutor'], $_POST['dAddShortText'], $userSettings['slID'], $userSettings['uThreshold'], $userSettings['uCheckWWW']);
					break;
				case 'deleteDocument' :
					$check = Document::deleteDocument($_POST['dID']);
					break;
				case 'addReport' :
					$check = Report::createReport($_POST['dID'], $_POST['slID'], $_POST['rThreshold'], $_POST['rCheckWWW'], $_POST['rCheckIDs']);
					break;
			}

			$smarty -> assign('messages', $check['messages']);

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

			// POST FUNCTIONS
			switch ($post) {
				case 'uChangeSettings' :
					$checkSettings = User::saveUserSettings(LoginAccess::getUserID(), $_POST['slID'], $_POST['uThreshold'], $_POST['uCheckWWW']);
					if ($checkSettings['state']) {
						LoginAccess::saveSettingsSession($_POST['slID'], $_POST['uThreshold'], $_POST['uCheckWWW']);
						$page = $root . $page;
						header("Refresh: 1; url=$page");
					}
					$smarty -> assign('messages', $checkSettings['messages']);
					break;
				case 'uChangePassword' :
					$checkPassword = User::checkUserPassword(LoginAccess::getUserID(), $_POST['uPassword']);
					if ($checkPassword['state']) {
						$checkSave = User::setUserPassword($_POST['uPassword1'], $_POST['uPassword2'], LoginAccess::getUserID());
						$message = $checkSave['messages'];
					} else
						$message = $checkPassword['messages'];
					$smarty -> assign('messages', $message);
					break;
			}

			$contentTpl = $smarty -> fetch('settings.tpl');
			break;

		case 'admin' :
			if (LoginAccess::check(500)) {
				// POST FUNCTIONS
				switch ($post) {
					case 'uAddSubmit' :
						$return = User::newUser($_POST['uName'], $_POST['uLastname'], $_POST['uEMailAdress'], $_POST['uPassword'], $_POST['uPermissonLevel']);
						break;
					case 'activateUser' :
						$return = User::activateUser($_POST['uID'], $_POST['uPermissonLevel']);
						break;
					case 'deleteUser' :
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
			switch ($post) {
				case 'uRegistrate' :
					$return = User::registrateUser($_POST['uName'], $_POST['uLastname'], $_POST['uEMailAdress'], $_POST['uPassword'], $_POST['uPassword2'], $_POST['cID']);
					$smarty -> assign('messages', $return['messages']);
					break;
			}
			$contentTpl = $smarty -> fetch('registrate.tpl');
			break;

		case 'reset-password' :
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
