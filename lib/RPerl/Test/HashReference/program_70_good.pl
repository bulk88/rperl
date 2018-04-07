#!/usr/bin/perl

# [[[ PREPROCESSOR ]]]
# <<< EXECUTE_SUCCESS: "have integer_hashref_to_string_compact($hash_1D) = {'dont_panic'=>42,'enterprise'=>1_701,'fnord'=>23,'least_random'=>17,'starman'=>2_112}" >>>
# <<< EXECUTE_SUCCESS: "have integer_hashref_to_string($hash_1D)         = { 'dont_panic' => 42, 'enterprise' => 1_701, 'fnord' => 23, 'least_random' => 17, 'starman' => 2_112 }" >>>
# <<< EXECUTE_SUCCESS: "have integer_hashref_to_string_pretty($hash_1D)  = { 'dont_panic' => 42, 'enterprise' => 1_701, 'fnord' => 23, 'least_random' => 17, 'starman' => 2_112 }" >>>
# <<< EXECUTE_SUCCESS: "have integer_hashref_to_string_expand($hash_1D)  =" >>>
# <<< EXECUTE_SUCCESS: "{" >>>
# <<< EXECUTE_SUCCESS: "    'dont_panic' => 42," >>>
# <<< EXECUTE_SUCCESS: "    'enterprise' => 1_701," >>>
# <<< EXECUTE_SUCCESS: "    'fnord' => 23," >>>
# <<< EXECUTE_SUCCESS: "    'least_random' => 17," >>>
# <<< EXECUTE_SUCCESS: "    'starman' => 2_112" >>>
# <<< EXECUTE_SUCCESS: "}" >>>
# <<< EXECUTE_SUCCESS: "have integer_hashref_to_string_format($hash_1D, -2, 0) = {'dont_panic'=>42,'enterprise'=>1_701,'fnord'=>23,'least_random'=>17,'starman'=>2_112}" >>>
# <<< EXECUTE_SUCCESS: "have integer_hashref_to_string_format($hash_1D, -1, 0) = { 'dont_panic' => 42, 'enterprise' => 1_701, 'fnord' => 23, 'least_random' => 17, 'starman' => 2_112 }" >>>
# <<< EXECUTE_SUCCESS: "have integer_hashref_to_string_format($hash_1D,  0, 0) = { 'dont_panic' => 42, 'enterprise' => 1_701, 'fnord' => 23, 'least_random' => 17, 'starman' => 2_112 }" >>>
# <<< EXECUTE_SUCCESS: "have integer_hashref_to_string_format($hash_1D,  1, 0) =" >>>
# <<< EXECUTE_SUCCESS: "{" >>>
# <<< EXECUTE_SUCCESS: "    'dont_panic' => 42," >>>
# <<< EXECUTE_SUCCESS: "    'enterprise' => 1_701," >>>
# <<< EXECUTE_SUCCESS: "    'fnord' => 23," >>>
# <<< EXECUTE_SUCCESS: "    'least_random' => 17," >>>
# <<< EXECUTE_SUCCESS: "    'starman' => 2_112" >>>
# <<< EXECUTE_SUCCESS: "}" >>>
# <<< EXECUTE_SUCCESS: "have integer_hashref_to_string_format($hash_1D, -2, 1) = {'dont_panic'=>42,'enterprise'=>1_701,'fnord'=>23,'least_random'=>17,'starman'=>2_112}" >>>
# <<< EXECUTE_SUCCESS: "have integer_hashref_to_string_format($hash_1D, -1, 1) = { 'dont_panic' => 42, 'enterprise' => 1_701, 'fnord' => 23, 'least_random' => 17, 'starman' => 2_112 }" >>>
# <<< EXECUTE_SUCCESS: "have integer_hashref_to_string_format($hash_1D,  0, 1) = { 'dont_panic' => 42, 'enterprise' => 1_701, 'fnord' => 23, 'least_random' => 17, 'starman' => 2_112 }" >>>
# <<< EXECUTE_SUCCESS: "have integer_hashref_to_string_format($hash_1D,  1, 1) =" >>>
# <<< EXECUTE_SUCCESS: "    {" >>>
# <<< EXECUTE_SUCCESS: "        'dont_panic' => 42," >>>
# <<< EXECUTE_SUCCESS: "        'enterprise' => 1_701," >>>
# <<< EXECUTE_SUCCESS: "        'fnord' => 23," >>>
# <<< EXECUTE_SUCCESS: "        'least_random' => 17," >>>
# <<< EXECUTE_SUCCESS: "        'starman' => 2_112" >>>
# <<< EXECUTE_SUCCESS: "    }" >>>

# [[[ HEADER ]]]
use RPerl;
use strict;
use warnings;
our $VERSION = 0.001_000;

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values & print operator
## no critic qw(RequireInterpolationOfMetachars)  # USER DEFAULT 2: allow single-quoted control characters & sigils

# [[[ OPERATIONS ]]]

my integer_hashref $hash_1D = { least_random => 17, fnord => 23, dont_panic => 42, enterprise => 1_701, starman => 2_112 };


print 'have integer_hashref_to_string_compact($hash_1D) = ', integer_hashref_to_string_compact($hash_1D), "\n";
print 'have integer_hashref_to_string($hash_1D)         = ', integer_hashref_to_string($hash_1D), "\n";
print 'have integer_hashref_to_string_pretty($hash_1D)  = ', integer_hashref_to_string_pretty($hash_1D), "\n";
print 'have integer_hashref_to_string_expand($hash_1D)  = ', "\n", integer_hashref_to_string_expand($hash_1D), "\n";

print 'have integer_hashref_to_string_format($hash_1D, -2, 0) = ', integer_hashref_to_string_format($hash_1D, -2, 0), "\n";
print 'have integer_hashref_to_string_format($hash_1D, -1, 0) = ', integer_hashref_to_string_format($hash_1D, -1, 0), "\n";
print 'have integer_hashref_to_string_format($hash_1D,  0, 0) = ', integer_hashref_to_string_format($hash_1D, 0, 0), "\n";
print 'have integer_hashref_to_string_format($hash_1D,  1, 0) = ', "\n", integer_hashref_to_string_format($hash_1D, 1, 0), "\n";

print 'have integer_hashref_to_string_format($hash_1D, -2, 1) = ', integer_hashref_to_string_format($hash_1D, -2, 1), "\n";
print 'have integer_hashref_to_string_format($hash_1D, -1, 1) = ', integer_hashref_to_string_format($hash_1D, -1, 1), "\n";
print 'have integer_hashref_to_string_format($hash_1D,  0, 1) = ', integer_hashref_to_string_format($hash_1D, 0, 1), "\n";
print 'have integer_hashref_to_string_format($hash_1D,  1, 1) = ', "\n", integer_hashref_to_string_format($hash_1D, 1, 1), "\n";
