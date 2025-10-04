damnusb
-------

This utility is based on the *deny everything that is not allowed* (Zero
Trust) approach. When uninstalling the ``make uninstall`` utility, your
custom rules are saved in ``/etc/udev/rules.d/`` and require manual
management.

Usage
~~~~~

First, it should be noted that the command without options rereads the
*udev* rules and forces *udev* events to apply the rules to already
connected USB devices:

::

       damnusb

To disable USB ports, create a rule using the ``-c`` (create) flag:

::

       damnusb -c <rulename>

By default, this rule disables authorization of any devices on all USB
ports. The ``-p`` (ports) flag allows you to specify the numbers of
specific buses and physical ports to which the rule should apply:

::

       damnusb -c <rulename> -p <usb_port>
       damnusb -c <rulename> -p <usb_port1>,<usb_port2>...

The ``-a`` (attributes) flag allows you to specify attributes that
identify USB devices:

::

       damnusb -c <rulename> -a <sysfs_attr>
       damnusb -c <rulename> -a <sysfs_attr1>,<sysfs_attr2>...

All flags can be combined for greater effect:

::

       damnusb -c <rulename> -p <usb_port> -a <sysfs_attr>
       damnusb -c <rulename> -p <usb_port1>,<usb_port2>... -a <sysfs_attr1>,<sysfs_attr2>...

You can delete a rule and enable USB ports using the ``-d`` (delete)
flag:

::

       damnusb -d <rulename>

However, in practice, it is often necessary to change the state of
existing rules without reconfiguring them. The ``-s`` (stop) and ``-r``
(run) flags are available for this purpose:

::

       damnusb -s <rulename>
       damnusb -r <rulename>

There can be multiple rules, and they can all have different priorities.
The ``-l`` (list) flag, depending on the following word ``rule`` or
``usb``, can list all existing rules or all USB devices connected to the
system with brief information about each:

::

       damnusb -l rule
       damnusb -l usb

Examples
~~~~~~~

Let’s say a laptop’s USB camera is connected to internal port **3-2**.
To simplify the example, we’ll know for sure that only this device uses USB
port **3-2**. Let’s create a rule to disable camera authorization on
this USB port:

::

       damnusb -c 99-block-camera -p 3-2

Now, for example, when you need to join a video meeting, you can enable
the camera’s USB port:

::

       damnusb -s 99-block-camera

After half an hour of the call, the laptop camera can be easily
disabled:

::

       damnusb -r 99-block-camera

Another situation is when a user is concerned that physical access to
their desktop computer is open to more than just them. To simplify the
example, we’ll only discuss external, free USB ports and, possibly, USB
hubs. The desktop owner needs to disable authorization for all USB
devices other than their flash drive on all ports. A USB device can be
identified, for example, by its serial number:

::

       damnusb -c 99-restrict-usb -a serial=1234567890ABCDEF
