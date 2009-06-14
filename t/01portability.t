#!/usr/bin/perl -T

# t/01portability.t
#  Tests if the distribution seems to be portable
#
# By Jonathan Yu <frequency@cpan.org>, 2009. All rights reversed.
#
# $Id: 01portability.t 7516 2009-06-14 01:28:51Z FREQUENCY@cpan.org $
#
# All rights to this test script are hereby disclaimed and its contents
# released into the public domain by the author. Where this is not possible,
# you may use this file under the same terms as Perl itself.

use strict;
use warnings;

use Test::More;

unless ($ENV{TEST_AUTHOR}) {
  plan(skip_all => 'Set TEST_AUTHOR to enable module author tests');
}

eval {
  require Test::Portability::Files;
};
if ($@) {
  plan skip_all => 'Test::Portability::Files required to test portability';
}

Test::Portability::Files->import();

options(
  # For descriptions of what these do, consult Test::Portability::Files
  test_amiga_length   => 1,
  test_ansi_chars     => 1,
  test_case           => 1,
  test_dir_noext      => 1,
  test_dos_length     => 0,
  test_mac_length     => 1,
  test_one_dot        => 1,
  test_space          => 1,
  test_special_chars  => 1,
  test_symlink        => 1,
  test_vms_length     => 1,
  use_file_find       => 0,
);

run_tests();