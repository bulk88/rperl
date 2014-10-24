# [[[ HEADER ]]]
package RPerl::Test::DataTypeNumber::Number_16_Bad_02;
use strict;
use warnings;
use RPerl;
our $VERSION = 0.001_000;

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values and print operator

# [[[ SUBROUTINES ]]]
# DEV NOTE: do not run perltidy on this file, it will wrongly separate the "0_" from the "." and the "2" below
our void $empty_sub = sub { 0_.2; };

1;
1;    # CODE SEPARATOR: end of package