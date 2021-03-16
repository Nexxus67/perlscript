# perlscript
Perl script for dumb hacker detection

# How it works

There are some people who try to break into web servers using exploits that only works on windows. Unbelievable. This script scans the Apache error log looking for "hacking" attempts and printing out those "hackers".  

# How to run 

Run the script on the following directory: 

$whoitwas.pl /var/log/httpd/error_log
