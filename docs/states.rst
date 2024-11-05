Available states
----------------

The following states are found in this formula:

.. contents::
   :local:


``tool_bitwarden``
~~~~~~~~~~~~~~~~~~
*Meta-state*.

Performs all operations described in this formula according to the specified configuration.


``tool_bitwarden.package``
~~~~~~~~~~~~~~~~~~~~~~~~~~
Installs the Bitwarden package only.


``tool_bitwarden.package.brew``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



``tool_bitwarden.package.chocolatey``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



``tool_bitwarden.package.mas``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



``tool_bitwarden.package.snap``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



``tool_bitwarden.config``
~~~~~~~~~~~~~~~~~~~~~~~~~
Manages the Bitwarden package configuration by

* managing/serializing the config file

Has a dependency on `tool_bitwarden.package`_.


``tool_bitwarden.clean``
~~~~~~~~~~~~~~~~~~~~~~~~
*Meta-state*.

Undoes everything performed in the ``tool_bitwarden`` meta-state
in reverse order.


``tool_bitwarden.package.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Removes the Bitwarden package.


``tool_bitwarden.package.brew.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



``tool_bitwarden.package.chocolatey.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



``tool_bitwarden.package.mas.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



``tool_bitwarden.package.snap.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



``tool_bitwarden.config.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Removes the configuration of the Bitwarden package.


