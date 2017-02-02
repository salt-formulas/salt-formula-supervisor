
==========
Supervisor
==========

Supervisor is a client/server system that allows its users to monitor and control a number of processes on UNIX-like operating systems.

It shares some of the same goals of programs like launchd, daemontools, and runit. Unlike some of these programs, it is not meant to be run as a substitute for init as “process id 1”. Instead it is meant to be used to control processes related to a project or a customer, and is meant to start like any other program at boot time.

Sample pillars
==============

Robotice services

.. code-block::

    supervisor:
      server:
        enabled: true
        service:
          robotice_planner:
            name: planner
            type: robotice
          robotice_monitor:
            name: monitor
            type: robotice

OctoPrint services

.. code-block::

    supervisor:
      server:
        enabled: true
        service:
          octoprint_server:
            name: server
            type: octoprint

Sentry services

.. code-block::

    supervisor:
      server:
        enabled: true
        service:
          sentry_web:
            name: web
            type: sentry
          sentry_worker:
            name: worker
            type: sentry

Read more
=========

* http://supervisord.org/

Documentation and Bugs
======================

To learn how to install and update salt-formulas, consult the documentation
available online at:

    http://salt-formulas.readthedocs.io/

In the unfortunate event that bugs are discovered, they should be reported to
the appropriate issue tracker. Use Github issue tracker for specific salt
formula:

    https://github.com/salt-formulas/salt-formula-supervisor/issues

For feature requests, bug reports or blueprints affecting entire ecosystem,
use Launchpad salt-formulas project:

    https://launchpad.net/salt-formulas

You can also join salt-formulas-users team and subscribe to mailing list:

    https://launchpad.net/~salt-formulas-users

Developers wishing to work on the salt-formulas projects should always base
their work on master branch and submit pull request against specific formula.

    https://github.com/salt-formulas/salt-formula-supervisor

Any questions or feedback is always welcome so feel free to join our IRC
channel:

    #salt-formulas @ irc.freenode.net
