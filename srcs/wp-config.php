<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpress_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', 'utf8_unicode_ci' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Rlvaj%d0>c$*e.(R1c<TQA4WsO*ad%txk$;]i0gY}v;$d{,/y_{H$|Xz#9R+,Cc5');
define('SECURE_AUTH_KEY',  'r==Ju$M$@:PHf6.nB9%x(J|rALm5Iv2 taN?t=o+~TTP7VKTWo+Irk-^W_<;a$E|');
define('LOGGED_IN_KEY',    '&E)lCO4:_9?Lm?B#fI!=,R|PU7R{2KIVA0Jj>V=Q=nq$KH L4=rmlORGBgCsLM5J');
define('NONCE_KEY',        'GDMdum7C6K-F+nq_?g!P;zDb+)}z&rmFweH4y%uYT|9C+z9qaG5dPkQ#ipT~+_ci');
define('AUTH_SALT',        '~3}1lJj3^/-%uAb|60.$MoElX$FYPASG^zeSn%wHA/wol8C:Y;NL/ZeFI-FypGN7');
define('SECURE_AUTH_SALT', '40%mvL6 wucn+X[aw;!4;<<:ab*cBC.YF]}les2dg8WLr|D#)+U4a/[~|+XF&;0`');
define('LOGGED_IN_SALT',   'o]K3M0BAYGpf<qYGOfr`q*M+Qw)JVOI5y-*,-UNO&T:}bQ=q]:>n6]CF^VdeU:E/');
define('NONCE_SALT',       '!E|q~m<Lr~.UIVC#r(*|GQ?e%PkZvquLU4<[xuzt1y+U0P]nRz,+X^0Ec?,!<^0P');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';

define('FS_METHOD', 'direct');