#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

use_ok 'Math::HexGrid', 'import module';
ok my $hexgrid = Math::HexGrid->new_hexagon(2), 'create a hexagon';
cmp_ok keys %{$hexgrid->{map}}, '==', 19, 'hexgrid has expected number of hexes';

done_testing;