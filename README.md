# HestiaCP Custom Conf For CORS

Having problems with CORS on Hestia server?

Here is here is my solution (my config files).

Don't forget to change your required config parameters

### CORS Using Default Template for nginx proxy

Solution found by reading the hestiacp forum.
If this didn't help you, go and ask in the hestiacp forum.

1. Copy `nginx.conf_header` & `nginx.ssl.conf_header` files inside folder `home-user-conf-web-domain` to `/home/YOURUSER/conf/web/DOMAINS/`
2. Test nginx conf using: `nginx -t`
3. If no problems, reload/restart nginx, using hestiacp webui or server cli `nginx -s reload`/`systemctl reload nginx`

### Custom Nginx Template for nginx proxy with CORS preflight

Why this solution?

I'm using laravel. I had troubles with CORS preflight and CORS images outside the root folder (root folder point to laravelapp/public/ & image is in laravelapp/storage/).

I didn't find it in any solutions in the forums, so this is my solution after trials and errors. You can use check what I changed by comparing it to the .reference files

1. Copy `default-with-cors.tpl` & `default-with-cors.stpl` files inside folder `usr-local-hestia-data-templates-web-nginx` to `/usr/local/hestia/data/templates/web/nginx/`
2. Copy all files inside folder `home-user-conf-web-domain` to `/home/YOURUSER/conf/web/DOMAINS/
3. Test nginx conf using: `nginx -t`
4. If no problems, reload/restart nginx, using hestiacp webui or server cli `nginx -s reload`/`systemctl reload nginx`

Documentations for custom template: [https://hestiacp.com/docs/server-administration/web-templates](https://hestiacp.com/docs/server-administration/web-templates)
