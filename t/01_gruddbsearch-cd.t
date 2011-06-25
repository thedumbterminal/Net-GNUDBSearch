use strict;
use warnings;
use Test::More;
use lib qw(lib ../lib);
use Net::GNUDBSearch::Cd;
plan(tests => 1);

my $config = {
	"id" => "blb512560d",
	"artist" => "The Prodigy",
	"album" => "(More) Music For The Jilted Generation"
};
my $search = Net::GNUDBSearch::Cd->new();
#1
isa_ok($search, "Net::GNUDBSearch::Cd");
