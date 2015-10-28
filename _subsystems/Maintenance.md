---
title: Maintenance 
description: What to do when running 
layout: basic
---

### Once running

There are a few options that have to be taken care of to setup for an nEDM
server:

#### Alarm Daemon

The alarm daemon handles tracking alarms that may have been set for a
particular database.  For more information about how to set/design an alarm on
the nEDM Interface, see [here](

If you wish to run the alarm daemon, change `alarm_daemon:disabled` to be
`false` in the configuration.  Other configuration options:

{% highlight javascript %}
{
  email_agent : 'name.of.smtp.server', // name of SMTP server to send
                                       // notification emails
  emails : ['email@host.com', 'emailtwo@host.com'], // list of email addresses
													// that receive
													// notification
  disabled : true // don't run on this server
}
{% endhighlight %}

#### View Updater/Aggregator

This deamon has two functions:

* actively update view functions after a certain number of documents (~100)
have entered the database.  This is necessary because CouchDB does not process
a view until it is queried.  By actively updating the views, the ensures that
the interface remains snappy.
* aggregate changes feed from all databases.  This takes the changes occuring
across all databases and saves them in an aggregate database (e.g.
`nedm/aggregate`).  This has the advantage that a user only needs to listen to
the changes feed of a single database and will receive updates when documents
are changed in any of the `nedm/*` databases.

Options for this daemon include:

{% highlight javascript %}
{
  write_aggregate : false, // Run aggregation (set to true to do this)
  checked_types   : ['data', 'heartbeat'], // Types of documents that are
										   // aggregated into the aggregate db
}
{% endhighlight %}

Note that only changes to documents with a 'type' field that is within
`checked_types` are saved in the aggregate database.

### Other settings 

Compactions are automatically scheduled meaning that when a database or view
reaches a certain fragmentation (ratio of 'real' data to overhead size) then a
compaction is forced.  This ensures that databases remain as small as possible.


