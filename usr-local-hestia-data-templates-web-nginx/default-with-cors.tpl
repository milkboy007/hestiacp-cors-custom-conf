#=========================================================================#
# Default Web Domain Template                                             #
# DO NOT MODIFY THIS FILE! CHANGES WILL BE LOST WHEN REBUILDING DOMAINS   #
# https://hestiacp.com/docs/server-administration/web-templates.html      #
#=========================================================================#

server {
	listen      %ip%:%proxy_port%;
	server_name %domain_idn% %alias_idn%;
	index       index.php index.html index.htm;
	error_log   /var/log/%web_system%/domains/%domain%.error.log error;
 
	include %home%/%user%/conf/web/%domain%/nginx.forcessl.conf*;

	location ~ /\.(?!well-known\/|file) {
		deny all;
		return 404;
	}

	location / {
		proxy_pass http://%ip%:%web_port%;
	    include %home%/%user%/conf/web/%domain%/nginx.conf-cors_preflight;

		location ~* ^.+\.(%proxy_extensions%)$ {
            try_files $uri $uri/ /index.php?$args;
			root        %docroot%/public;
			access_log /var/log/%web_system%/domains/%domain%.log combined;
			access_log /var/log/%web_system%/domains/%domain%.bytes bytes;
            include %home%/%user%/conf/web/%domain%/nginx.conf-cors;
			expires    max;
		}
        include %home%/%user%/conf/web/%domain%/nginx.conf-cors;
	}

	location /error/ {
		alias %home%/%user%/web/%domain%/document_errors/;
	}

	location /vstats/ {
		alias   %home%/%user%/web/%domain%/stats/;
		include %home%/%user%/web/%domain%/stats/auth.conf*;
	}

        include %home%/%user%/conf/web/%domain%/nginx.conf_*;
}
