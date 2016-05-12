
r = Nginx::Request.new
v = Vedis.new "/config/backend.db"

# We're going to assume that you don't have
# enough backends for a single site for it
# to be worthwhile complicating this.
backends = v.exec("SMEMBERS site_#{r.hostname}")
Nginx.log(Nginx::LOG_ERR,"No entry for #{r.hostname.inspect} / #{backends.inspect}")

v.close
if backends && !backends.empty?
  backends[rand(backends.size)]
else
  Nginx.log(Nginx::LOG_ERR,"No entry for #{r.hostname.inspect}")
  "404"
end
