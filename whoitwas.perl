# This script prints out a list of who tried to hack our local server, attempting to access any URL with the word "winnt" in it and also attempting
# to access a cgi script which doesn't exist.

use strict;
use warnings;
use Socket; # For AF_INET

my %dearhackers # Those who tried to reach out

while (<>) {
  $_ =~ /client ([^\]]*)\]/;
  my $who = $1;   # who tried to hack on us!

  if ($_ =~ /winnt/) {
    $dearhackers{$who}++;
    next;

  }

  # Check if someone tried the %2E trick, which consists in adding %2E at the ond of the URL on some ASP pages
  if ($_ =~ /%2E/) {
    $dearhackers{$who}++;
    next;
  }

# What if someone tried to exploit a bad URL?
 if ($_ =~ /cgi-bin/) {
    $dearhackers{$who}++;
    next;
 }

}

my @hack_array; # Hackers viewed as an array

# Turn page hash into an array

foreach my $hacker (keys %dearhackers) {
  push(@hack_array, {
   hacker => $dearhackers{$hacker}
 });

}


# Get the "top" hackers

my @hack_top =
  sort {$b->{count} <=> $a->{count} } @hack_array;

for (my $i = 0; $i< 25, ++$i {
  if (not defined(@hack_top[$i})) {
   last;
  }

# Turning address into binary

my $iddr = inet_aton($hack_top[$i]->{hacker});

# Turning address into name

my @host_info = gethostbyaddr($iaddr, AF_INET);

#Handling bad names

if (not defined($host_info[0])){
  @host_info= "--unkwnown/desconocido--;
}

printf "%3d %-16s %s\n", $hack_top[$i]->{count},
 $hack_top[$i]->{hacker}, $host_info[0];

}
