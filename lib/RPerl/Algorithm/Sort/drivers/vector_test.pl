#!/usr/bin/perl
use strict;  use warnings;
use Data::Dumper;

use lib '/tmp/RPerl-latest/lib/CPAN';  # RPerl's MyConfig.pm  # NEED REMOVE hard-coded path
use MyConfig;

package main;
use Inline
(
	CPP => '/tmp/RPerl-latest/lib/RPerl/Algorithm/Sort/drivers/vector_test.cpp',
	INC => '-I/usr/include/c++/4.5/ -I/usr/include/c++/4.5/i686-linux-gnu/',  # NEED FIX: remove hard-coded path
#    TYPEMAPS => '/tmp/RPerl-latest/lib/RPerl/Algorithm/Sort/drivers/vector_test.typemap',
	CCFLAGS => '-Wno-deprecated',
	BUILD_NOISY => 1,
	CLEAN_AFTER_BUILD => 0,
	WARNINGS => 1,
	FILTERS => 'Preprocess',
	AUTO_INCLUDE => '#include <vector>',  # DEV NOTE: include non-RPerl files here so they are not parsed by the 'Preprocess' filter
);

#XS_unpack_int__array_ref([5, 4, 3, 2, 1, 0]);
#XS_unpack_int__array_ref([0..9]);
print___int__array_ref([5, 4, 3, 2, 1, 0]);

my $retval = generate__int__array_ref(5);

print "have \$retval = \n" . Dumper($retval) . "\n";