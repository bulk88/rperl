# [[[ PREPROCESSOR ]]]
# <<< PARSE_ERROR: 'ERROR ECOPAPC02' >>>
# <<< PARSE_ERROR: 'Perl::Critic::Policy::Variables::ProhibitPunctuationVars' >>>

# [[[ HEADER ]]]
use RPerl;
package RPerl::Test::LiteralString::Package_DoubleQuotes_15_Bad_01;
use strict;
use warnings;
our $VERSION = 0.001_000;

# [[[ SUBROUTINES ]]]
sub empty_sub { { my string $RETURN_TYPE }; return "`~!@#$%^&*()-_=+[]{}\|;:',<.>/?\n"; }

1;    # end of package
