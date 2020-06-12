Role Name
=========

Ansible Role to deploy Zimbra Mail Server on CentOS 7

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

DNS Records ( A and MX Record ) need to be avaialbe for the mail server

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

List of variables that need to be specified at the time of execution.

hostname: "HOSTNAME"

domain: "DOMAIN_NAME"

zmpasswd: "SECUREPASSWORD"

zmnetwork: "192.168.200.0/8"

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - role: harpreet.zimbra
	       hostname: "HOSTNAME"
           domain: "DOMAIN_NAME"
           zmpasswd: "SECUREPASSWORD"
           zmnetwork: "192.168.200.0/8"


License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
