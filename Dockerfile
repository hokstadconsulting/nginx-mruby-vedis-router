FROM matsumotory/ngx-mruby:latest
MAINTAINER vidar@hokstad.com

VOLUME /config

#
# matsumotory/ngx-mruby image supports ONBUILD for below commands.
#
# ONBUILD ADD docker/hook /usr/local/nginx/hook
# ONBUILD ADD docker/conf /usr/local/nginx/conf
# ONBUILD ADD docker/conf/nginx.conf /usr/local/nginx/conf/nginx.conf
