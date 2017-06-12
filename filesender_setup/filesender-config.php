<?php

/*
 * FileSender www.filesender.org
 * 
 * Copyright (c) 2009-2012, AARNet, Belnet, HEAnet, SURFnet, UNINETT
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * *    Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 * *    Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 * *    Neither the name of AARNet, Belnet, HEAnet, SURFnet and UNINETT nor the
 *     names of its contributors may be used to endorse or promote products
 *     derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

// ---------------------------------------------
//             README / 2014-09-11
// ---------------------------------------------
// 
// This is a sample of configuration file for Filesender
// --
// The configuration list is available at [todo: wiki URL]
//
// To make filesender work, you need first to create a file 'config/config.php',
// and at least to fill the following configuration parameters:


// ---------------------------------------------
//              General settings
// ---------------------------------------------
// 

$config['site_url'] = 'https://FILESENDER_URL';                // String, URL of the application
 
$config['admin'] = 'FILESENDER_ADMINISTRATOR';            // String, UID's (from  $config['saml_uid_attribute']) 

$config['admin_email'] ='FILESENDER_ADMIN_EMAIL';       // String, email  address(es, separated by ,) 

$config['email_reply_to'] ='noreply@usit.uio.no';    // String, default no-reply email  address

$config['Default_TimeZone'] = 'Europe/Oslo';


// --------------------------------------------------
//              Transfer settings
// --------------------------------------------------

$config['max_transfer_size'] = 2107374182400;

$config['stalling_detection'] = false;

// --------------------------------------------------
//    TeraSender high speed upload module
// --------------------------------------------------

$config['terasender_enabled'] = true;           //
$config['terasender_advanced'] = true;          // Make #webworkers configurable in UI.  Switched this on to make it easy
                                                // to determine optimal number for terasender_worker_count when going in production.
                                                // The useful number of maximum webworkers per browser changes nearly for each browser release.
$config['terasender_worker_count'] = 5;         // Number of web workers to launch simultaneously client-side when starting upload
$config['terasender_start_mode'] = "single";    // I think I prefer to show a nice serial predictable upload process

// --------------------------------------------------
//              Authenticated user transfer settings
// --------------------------------------------------


$config['max_transfer_days_valid'] = 60;                    // what user sees in date picker for expiry date. If not set this defaults to 20.
$config['default_transfer_days_valid'] = 20;                    // Default expiry date as per date picker in upload UI.  Most users will not change this.  If not set, this defaults to 10.




// ---------------------------------------------
//              DB configuration
// ---------------------------------------------
$config['db_type'] ='pgsql';       // String, pgsql or mysql
$config['db_host'] ='FILESENDERHOST';       // String, database host 
$config['db_database'] ='FILESENDERDBNAME';   // String, database name
$config['db_username'] ='FILESENDERUSER';   // String, database username
$config['db_password'] ='FILESENDERPASSWORD';   // String, database password

// ---------------------------------------------
//              SAML configuration
// ---------------------------------------------

$config['auth_sp_saml_simplesamlphp_url'] ='/simplesaml/';        // Url of simplesamlphp
$config['auth_sp_saml_simplesamlphp_location'] ='/opt/filesender/simplesaml/';   // Location of simplesamlphp libraries

// ---------------------------------------------
//              File locations (or storage?)
// ---------------------------------------------

$config['storage_type'] = 'filesystem';
$config['storage_filesystem_path'] = '/opt/filesender/filesender-2.0/files';


//      ----------------------------
//      -------- [optional] --------
//      ----------------------------
//
// If you want to overide the SAML simplephp configuration defaults parameter,
// uncoment and edit the following lines
// 
// // Authentification type ('saml' or 'shibboleth')
$config['auth_sp_type'] = 'saml';
// 
// // Get email attribute from authentication service
$config['auth_sp_saml_email_attribute'] = 'mail';
// 
// // Get name attribute from authentication service
// $config['auth_sp_saml_name_attribute'] = 'cn';
// 
// // Get uid attribute from authentication service.  Usually eduPersonTargetedID or eduPersonPrincipalName
$config['auth_sp_saml_uid_attribute'] = 'eduPersonPrincipalName';
// 
// // Get path  attribute from authentication service
$config['auth_sp_saml_authentication_source'] = 'default-sp';
