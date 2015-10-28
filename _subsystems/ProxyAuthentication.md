---
title: Proxy authentication 
description: Information about proxy authentication
layout: basic
---

## Introduction 

CouchDB allows [proxy
authentication](http://docs.couchdb.org/en/1.6.1/api/server/authn.html#proxy-authentication)
which enables another server to provide the necessary authentication
information.  In this Docker container, both proxy and 'normal' authentication
are enabled.  Proxy authentication is only used by internal daemons (e.g. the
aggregate and update daemons) as well as the [File Server]({{ site.url
}}/FileServer-Docker) for providing privileged access.

### Settings in `local.ini` 

The relevant settings are:

{% highlight ini %}
...
[httpd]
authentication_handlers = ..., {couch_httpd_auth, proxy_authentication_handler},...
...

[couch_httpd_auth]
secret = @SECRETREPLACE@
proxy_use_secret = true
...
{% endhighlight %} 
`secret` is randomly generated and only available for the local container and
other connecting containers.

