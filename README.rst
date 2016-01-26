
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
