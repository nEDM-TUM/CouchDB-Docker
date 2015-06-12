CouchDB-Docker
==============

Docker for CouchDB servers in the nEDM experiment

## Information

This docker is based off of klaemo/couchdb:1.6.1 and includes a number of
scripts (os daemons and update notifiers) that need to be run in parallel.

The couchdb server which is run allows proxy authentication though with a
randomly defined private key (automatically generated for each container),
which means this is only used for the local scripts (os daemons/update
notifiers) that run in the container.

### Setup options

1. Mount lib directory (R/W) to `/usr/local/var/lib/couchdb`
1. Mount log directory (R/W) to `/usr/local/var/log/couchdb`
1. To define an admin user, export the environment variable for the hash
generated by CouchDB: `"ADMINHASH=admin = -pbkdf2-0hashfollowshere"`

### Once running

There are a few options that have to be taken care of to setup for an nEDM
server:

#### Alarm Daemon

If you wish to run the alarm daemon, change `alarm_daemon:disabled` to be
`false` in the configuration.  Other configuration options:

```json
{
  'email_agent' : 'name.of.smtp.server', # name of SMTP server to send
                                         # notification emails
  'emails' : ['email@host.com', 'emailtwo@host.com'], # list of email addresses
													  # that receive
													  # notification
  'disabled' : true # don't run on this server
}
```

#### View Updater/Aggregator

This runs to update views as well as aggregates changes from `nedm/` databases

Options include:

```json
{
  'write_aggregate' : false, # Run aggregation (set to true to do this)
  'checked_types'   : ['data', 'heartbeat'], # Types of documents that are
											 # aggregated into the aggregate db
}
```

