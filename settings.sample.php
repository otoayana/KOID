<?php
// define settings here.

// database settings.
const DB_HOST = 'localhost'; // hostname of the database. required.
const DB_USER = 'root'; // database user. required.
const DB_PASS = ''; // password for the database user. optional.
const DB_NAME = 'koid_db'; // name of the database. required.

// cloudinary settings.
const CLOUD_NAME = 'insert-account-name'; // cloudinary account name. required.
const CLOUD_PRESET = 'default'; // cloudinary upload preset. required.

// recaptcha settings.
const RE_PUB = null; // recaptcha public key. optional.
const RE_SCRT = null; // recaptcha secret key. optional.

// various.
const CONTACT_EMAIL = ''; // the email you want to use for emergency contact (e.g. dmca notices etc.) optional.
const HTTPS_PROXY = false; // Set this to true if you're using an HTTPS proxy like Cloudflare for your site's main domain, or false if you're not or don't know what that is. Required.
const TIMEZONE = 'America/Indiana/Indianapolis'; // The timezone used by the site. Required.
