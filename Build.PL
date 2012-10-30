use strict;
use warnings;
use Module::Build;
my $build = Module::Build->new(
	module_name => 'Net::GNUDBSearch',
	license => 'perl',
	dist_author => 'MacGyveR <dumb@cpan.org>',
	dist_abstract => 'Search interface to GNUDB database',
	requires => {
		'WWW::Mechanize' => undef,
		'URI::Encode' => undef,
		'XML::Simple' => undef,
		'Data::Dumper' => undef,
		'Carp' => undef,
		'Net::FreeDB2' => undef
	},
	build_requires => {
		"Test::More" => ""
	},
	create_makefile_pl => 'traditional'
);
$build->create_build_script;
