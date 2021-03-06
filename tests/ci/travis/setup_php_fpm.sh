#!/bin/sh

# enable php-fpm
sudo cp ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.conf.default ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.conf
# work around travis issue #3385
if [ "-d ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d" ]; then
    if [ "$TRAVIS_PHP_VERSION" = "7.0" -a -n "$(ls -A ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d)" ]; then
      sudo cp ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d/www.conf.default ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d/www.conf
    fi
    if [ "$TRAVIS_PHP_VERSION" = "7.1" -a -n "$(ls -A ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d)" ]; then
      sudo cp ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d/www.conf.default ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d/www.conf
    fi
    if [ "$TRAVIS_PHP_VERSION" = "7.2" -a -n "$(ls -A ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d)" ]; then
      sudo cp ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d/www.conf.default ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d/www.conf
    fi
    if [ "$TRAVIS_PHP_VERSION" = "7.3" -a -n "$(ls -A ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d)" ]; then
      sudo cp ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d/www.conf.default ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.d/www.conf
    fi
fi
echo "cgi.fix_pathinfo = 1" >> ~/.phpenv/versions/$(phpenv version-name)/etc/php.ini
echo "always_populate_raw_post_data = -1" >> ~/.phpenv/versions/$(phpenv version-name)/etc/php.ini
~/.phpenv/versions/$(phpenv version-name)/sbin/php-fpm
