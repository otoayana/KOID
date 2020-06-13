<?php
require_once('connect.php');
?><!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title><?=isset($title) ? htmlspecialchars($title) . ' - ' : ''?>KOID</title>
        <meta http-equiv="content-style-type" content="text/css">
        <meta http-equiv="content-script-type" content="text/javascript">
        <meta name="format-detection" content="telephone=no">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="apple-mobile-web-app-title" content="KOID">
        <meta name="description" content="KOID is a lightweight social network written in PHP.">
        <meta name="keywords" content="KOID,mintphin,stampylongr,PHP,social">
        <meta property="og:locale" content="en_US">
        <meta property="og:title" content="<?=isset($title) ? htmlspecialchars($title) . ' - ' : ''?>KOID">
        <meta property="og:type" content="article">
        <meta property="og:url" content="http<?=($_SERVER['HTTPS'] || HTTPS_PROXY) ? 's' : ''?>://<?=$_SERVER['SERVER_NAME']?>">
        <meta property="og:description" content="KOID is a lightweight social network written in PHP.">
        <meta property="og:site_name" content="KOID">
        <meta name="twitter:card" content="summary">
        <meta name="twitter:domain" content="<?=$_SERVER['SERVER_NAME']?>">
        <link rel="shortcut icon" href="/assets/img/favicon.ico">
        <link rel="apple-touch-icon" sizes="57x57" href="/assets/img/apple-touch-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="114x114" href="/assets/img/apple-touch-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="72x72" href="/assets/img/apple-touch-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="144x144" href="/assets/img/apple-touch-icon-144x144.png">
        <link rel="stylesheet" type="text/css" href="/assets/css/main.css">
        <script src="https://kit.fontawesome.com/f41de4a235.js" crossorigin="anonymous"></script>
    </head>
    <body class="<?php if(empty($_SESSION['username'])) echo 'guest '; if(!empty($class)) echo $class; if(isset($reborn)) echo '" id="miiverse-will-reborn'; echo '" data-token="' . $_SESSION['token']; ?>">
        <div id="wrapper">
            <div id="sub-body">
                <menu id="global-menu">
                    <li id="global-menu-logo">
                        <h1><a href="/"><img src="/assets/img/logo.png" alt="KOID" width="165" height="30"></a></h1>
                    </li>
                    <?php if(empty($_SESSION['username'])) { ?><li id="global-menu-login">
                            <form id="login_form" action="/login" method="post">
                                <input type="image" alt="Sign in" src="/assets/img/signin.png">
                            </form>
                        </li>
                    <?php } else { ?><li id="global-menu-list">
                        <ul>
                            <li id="global-menu-mymenu"<?php if(!empty($selected) && $selected == 'mymenu') echo ' class="selected"'; ?>>
                                <a href="/users/<?=htmlspecialchars($_SESSION['username'])?>">
                                    <span class="icon-container">
                                        <img src="<?=getAvatar($_SESSION['avatar'], $_SESSION['has_mh'], 0)?>" alt="User Page">
                                    </span>
                                    <span>User Page</span>
                                </a>
                            </li>
                            <li id="global-menu-community"<?php if(!empty($selected) && $selected == 'community') echo ' class="selected"'; ?>>
                                <a href="/" class="symbol">
                                    <span>Homepage</span>
                                </a>
                            </li>
                            <li id="global-menu-my-menu">
                                <button class="symbol js-open-global-my-menu open-global-my-menu" id="my-menu-btn"></button>
                                <menu id="global-my-menu" class="invisible none">
                                    <li><i class="far fa-id-badge"></i><a href="/settings/profile"><span>Profile Settings</span></a></li>
                                    <li><i class="far fa-user-circle"></i><a href="/settings/account"><span>Account Settings</span></a></li>
                                    <li><i class="far fa-clipboard"></i><a href="/rules"><span>Site Rules</span></a></li>
                                    <li>
                                        <i class="fas fa-sign-out-alt"></i>
                                        <form action="/logout" method="post" id="my-menu-logout">
                                            <input type="hidden" name="token" value="<?=$_SESSION['token']?>">
                                            <input type="submit" value="Log Out">
                                        </form>
                                    </li>
                                </menu>
                            </li>
                    <?php } ?>
                </menu>
            </div>
            <div id="main-body">
