CREATE DATABASE IF NOT EXISTS mgsv;
CREATE USER IF NOT EXISTS 'mgsv_user'@'localhost' IDENTIFIED BY 'mgsvpass';
use mgsv;
CREATE TABLE IF NOT EXISTS `userinfo` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`email` text NOT NULL,
	`hash` text NOT NULL,
	`synfilename` text NOT NULL,
	`annfilename` text NOT NULL,
	`url` text NOT NULL,
	`session_id` text NOT NULL,
	`annImage`   int(5) NOT NULL,
	`create_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, PRIMARY KEY (`id`)
        ) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;
