use strict;
use warnings;
use Module::Build;
my $build = Module::Build->new(
	module_name => 'Net::GNUDBSearch',
	license => 'perl',
	dist_author => 'MacGyveR <dumb@cpan.org>',
	requires => {
	},
	build_requires => {
		"Test::More" => "",
		'WWW::Mechanize' => undef,
		'Carp' => undef,
		'URI::Encode' => undef,
		'XML::Simple' => undef
	},
	create_makefile_pl => 'traditional'
);
$build->create_build_script;
