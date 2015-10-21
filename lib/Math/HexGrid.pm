use strict;
use warnings;
package Math::HexGrid;

# ABSTRACT: Math::HexGrid - create hex coordinate grids

use Math::HexGrid::Hex;
use List::Util qw/min max/;


=head1 DESCRIPTION

This module is for creating hex grids of L<Math::HexGrid::Grid> objects. For
now it only supports hexagonally-shaped grids. It supports both cube and
axial (trapezoidal) coordinate systems.

=cut

=head1 METHODS

=head2 new_hexagon ($radius)

Constructs a new hexagonally-shaped grid of size C<$radius>.

=cut

sub new_hexagon
{
  my ($class, $radius) = @_;

  my %map;
  for (my $q = - $radius; $q <= $radius; $q++)
  {
    my $r1 = max(-$radius, -$q - $radius);
    my $r2 = min($radius, -$q + $radius);

    for (my $r = $r1; $r <= $r2; $r++)
    {
      $map{"$q$r"} = Math::HexGrid::Hex->new($q, $r);
    }
  }

  bless {
    map => \%map,
  }, $class;
}

=head2 get_hex ($q, $r)

Returns the hex at location C<$q> and C<$r>.

=cut

sub get_hex
{
  my ($self, $q, $r) = @_;
  $self->{map}{"$q$r"};
}

=head2 count_sides

Returns a count of all unique sides in the grid.

=cut

sub count_sides
{
  my ($self) = @_;
  my $n = keys %{$self->{map}};
  ($n-1) * 3 + $n-1 + 6;
}

=head1 SEE ALSO

This code was helped by Amit Patel's L<articles|http://www.redblobgames.com/grids/hexagons/> on hexagonal grids.

=cut

1;
