package Net::GNUDBSearch::Cd;
use warnings;
use strict;
use Carp;
#########################################################
sub new{
	my($class, $config) = @_;
	my $self = {
		'__id' => undef,
		'__album' => undef,
		'__artist' => undef
	};
	bless $self, $class;
	$self->__setId($config->{'id'});
	$self->__setAlbum($config->{'album'});
	$self->__setArtist($config->{'artist'});
	return $self;
}
#########################################################
sub __setId{
	my($self, $id) = @_;
	$self->{'__id'} = $id;
	return 1;
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