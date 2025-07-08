# 42-born2beroot
guide to do this (for self-reference)

## Born2beRoot Project Requirements

### Mandatory Part

* **Virtual Machine Setup:**
    * Use VirtualBox (or UTM if VirtualBox is not usable).
    * Snapshots are prohibited.
    * Install either the latest stable version of Debian (recommended) or Rocky as the operating system.
    * Do not install a graphical interface (X.org or any other equivalent graphics server); otherwise, the grade will be 0.
* **Security & Configuration:**
    * **Disk Encryption:** Create at least 2 encrypted partitions using LVM.
    * **Security Modules:**
        * AppArmor must be running at startup for Debian.
        * SELinux must be running at startup for Rocky, and its configuration has to be adapted for the project's needs.
        * KDump setup is not required for Rocky.
    * **SSH Service:**
        * An SSH service will be running on the mandatory port 4242 in your virtual machine.
        * It must not be possible to connect using SSH as root.
    * **Firewall:**
        * Configure your operating system with the UFW (or firewalld for Rocky) firewall.
        * Only leave port 4242 open in your virtual machine.
        * Your firewall must be active when you launch your virtual machine.
    * **Hostname:** The hostname of your virtual machine must be your login ending with 42 (e.g., wil42). You will have to modify this hostname during your evaluation.
    * **Password Policy:** Implement a strong password policy with the following requirements:
        * Your password has to expire every 30 days.
        * The minimum number of days allowed before the modification of a password will be set to 2.
        * The user has to receive a warning message 7 days before their password expires.
        * Your password must be at least 10 characters long. It must contain an uppercase letter, a lowercase letter, and a number. Also, it must not contain more than 3 consecutive identical characters.
        * The password must not include the name of the user.
        * The following rule does not apply to the root password: The password must have at least 7 characters that are not part of the former password.
        * Your root password has to comply with this policy.
        * After setting up your configuration files, you will have to change all the passwords of the accounts present on the virtual machine, including the root account.
    * **User Management:**
        * In addition to the root user, a user with your login as username has to be present.
        * This user has to belong to the `user42` and `sudo` groups.
    * **Sudo Configuration:** Set up a strong configuration for your sudo group with the following requirements:
        * Authentication using sudo has to be limited to 3 attempts in the event of an incorrect password.
        * A custom message of your choice has to be displayed if an error due to a wrong password occurs when using sudo.
        * Each action using sudo has to be archived, both inputs and outputs. The log file has to be saved in the `/var/log/sudo/` folder.
        * The TTY mode has to be enabled for security reasons.
        * The paths that can be used by sudo must be restricted. Example: `/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin`.
* **Monitoring Script:**
    * Create a simple script called `monitoring.sh`, developed in bash.
    * At server startup, the script will display information on all terminals and every 10 minutes (take a look at wall). The banner is optional. No error must be visible.
    * Your script must always be able to display the following information:
        * The architecture of your operating system and its kernel version.
        * The number of physical processors.
        * The number of virtual processors.
        * The current available RAM on your server and its utilization rate as a percentage.
        * The current available storage on your server and its utilization rate as a percentage.
        * The current utilization rate of your processors as a percentage.
        * The date and time of the last reboot.
        * Whether LVM is active or not.
        * The number of active connections.
        * The number of users using the server.
        * The IPv4 address of your server and its MAC (Media Access Control) address.
        * The number of commands executed with the sudo program.

### Bonus Part

* **Partitioning:** Set up partitions correctly so you get a structure similar to the example provided in the document.
* **WordPress Website:** Set up a functional WordPress website with the following services: lighttpd, MariaDB, and PHP.
* **Additional Service:** Set up a service of your choice that you think is useful (NGINX / Apache2 excluded!). You will have to justify your choice during the defense.
* **Firewall Adaptation:** If you set up extra services for the bonus part, you may open more ports to suit your needs, and the UFW/Firewalld rules have to be adapted accordingly.

**Note on Bonus Evaluation:** The bonus part will only be assessed if the mandatory part is PERFECT. "Perfect" means the mandatory part has been integrally done and works without malfunctioning. If you have not passed ALL the mandatory requirements, your bonus part will not be evaluated at all.
