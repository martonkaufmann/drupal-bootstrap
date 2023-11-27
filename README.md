`docker compose run --rm drupal /bin/bash`
`composer create-project drupal/recommended-project:10.1.6 /tmp/proj && cp -r /tmp/proj/* . && rm -rf /tmp/proj`
`cp web/sites/default/default.settings.php web/sites/default/settings.php`

Replace `#PROJECT#` in 000-default.conf
