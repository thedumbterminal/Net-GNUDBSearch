use strict;
use warnings;
use Test::More;
use lib qw(lib ../lib);
plan(tests => 2);
#1
use_ok("Net::GNUDBSearch::Cd");
#2
use_ok("Net::GNUDBSearch");

