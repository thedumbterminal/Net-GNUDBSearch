package Net::GNUDBSearch::Cd;
use warnings;
use strict;
use Carp;
use Net::FreeDB2;
use Net::FreeDB2::Match;
use Net::FreeDB2::Entry;	#see bug; https://rt.cpan.org/Ticket/Display.html?id=69089
#########################################################
sub new{
	my($class, $config) = @_;
	my $self = {
		'__id' => undef,
		'__genre' => undef,
		'__album' => undef,
		'__artist' => undef,
		'__tracks' => []
	};
	bless $self, $class;
	$self->__setId($config->{'id'});
	$self->__setGenre($config->{'genre'});
	$self->__setAlbum($config->{'album'});
	$self->__setArtist($config->{'artist'});
	return $self;
}
########################################################
sub getTracks{
	my $self = shift;
	my @tracks = @{$self->{'__tracks'}};
	if($#tracks == -1){
		my $connectionConfig = {
	        client_name => ref($self),
	        client_version => 1.0,
	        protocol => "HTTP",
	        freedb_host => "gnudb.gnudb.org"
	 	};
		my $conn = Net::FreeDB2->connection($connectionConfig);
		my $matchConfig = {
			"categ" => $self->__getGenre(),
			"discid" => $self->__getId()
		};
		my $match = Net::FreeDB2::Match->new($matchConfig);
		my $res = $conn->read($match);
	 	if($res->hasError()){
	  		confess('Error quering GNUDB');
	 	}
	 	else{	#all ok
	 		my $entry = $res->getEntry();
	 		@tracks = $entry->getTtitlen(0);	#get all tracks;
	 		$self->{'__tracks'} = \@tracks;
	 	}
	}
	return @tracks;
}
#########################################################
sub __setId{
	my($self, $id) = @_;
	if(defined($id)){
		if($id =~ m/^[0-9a-fA-F]+$/){
			$self->{'__id'} = $id;
			return 1;
		}
		else{
			confess("Invalid ID");
		}
	}
	else{
		confess("No ID given");
	}
	return 0;
}
#########################################################
sub __getId{
	my $self = shift;
	return $self->{'__id'};
}
#########################################################
sub __getGenre{
	my $self = shift;
	return $self->{'__genre'};
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
sub __setGenre{
	my($self, $genre) = @_;
	if(defined($genre)){
		$self->{'__genre'} = $genre;
		return 1;
	}
	else{
		confess("No genre given");
	}
	return 0;
}
#########################################################
return 1;