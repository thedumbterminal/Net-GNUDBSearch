package Net::GNUDBSearch::Cd;

=pod

Adds storage for GNUDBSearch results.

=cut

use warnings;
use strict;
use Carp;
use Net::GNUDB::Cd;
use base qw(Net::GNUDB::Cd);
#########################################################
sub new{
	my($class, $config) = @_;
	my $self = $class->SUPER::new($config);
	$self->{'__album'} = undef;
	$self->{'__artist'} = undef;
	bless $self, $class;
	$self->__setAlbum($config->{'album'});
	$self->__setArtist($config->{'artist'});
	return $self;
}
#########################################################
sub getAlbum{
	my $self = shift;
	return $self->{'__album'};
}
#########################################################
sub getArtist{
	my $self = shift;
	return $self->{'__artist'};
}
#########################################################
sub __setAlbum{
	my($self, $album) = @_;
	$self->{'__album'} = $album;
	return 1;
}
#########################################################
sub __setArtist{
	my($self, $artist) = @_;
	$self->{'__artist'} = $artist;
	return 1;
}
#########################################################
return 1;