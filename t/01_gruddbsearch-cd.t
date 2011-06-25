use strict;
use warnings;
use Test::More;
use Data::Dumper;
use lib qw(lib ../lib);
use Net::GNUDBSearch::Cd;
plan(tests => 2);

my $config = {
	"id" => "b512560d",
	"artist" => "The Prodigy",
	"album" => "(More) Music For The Jilted Generation",
	"genre" => "blues"
};
my $cd = Net::GNUDBSearch::Cd->new($config);
#1
isa_ok($cd, "Net::GNUDBSearch::Cd");

my @tracks = $cd->getTracks();
#print Dumper \@tracks;
#2
is($#tracks, 12, "getTracks()");

#get the tracks again to check for caching
@tracks = $cd->getTracks();
