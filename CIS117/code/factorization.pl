#!C:\Strawberry\perl\bin\perl

use strict;
use Getopt::Long;

# setup my defaults
use vars qw($type @primes);
my @types = ('small', 'medium', 'large');

GetOptions(
    'type=s'    => \$type,
) or die "\nERROR: missing Option --type either unknown or not given (available types are @types)\n\n";

if ($type eq 'small') {
# Two arrays of prime numbers
  @primes  = (11,13,17,19);
}
elsif ($type eq 'medium') {
  @primes = (811,821,823,827);
}
elsif ($type eq 'large') {
  @primes = (3581,3583,3593,3607);
}
else {
	die "\nERROR: missing Option --type either unknown or not given (available types are @types)\n\n";
}

printf "\n\n  $type PRIMES..... @primes\n\n";
&main::main(@primes);


sub main {
  my @array = @_;

  my @products = &main::multiply(@array);
  for my $product (@products) {
    &main::factor($product);
  }
}

sub multiply {
  my @primes = @_;

  my @array;
  # loop over each prime and capture product
  for my $y (@primes) {
    for my $x (@primes) {
      my $start = time;
      my $answer = $x * $y;
      my $end = time;
      my $duraction = $end - $start;
      printf "Multiply: %d * %d = %d [ took %d seconds ]\n", $x, $y, $answer, $duraction;
      push(@array,$answer);
    }
  }
  return @array;
}

sub factor {
  my $input = shift;

  my $factors;
  my $start = time;
  for (my $i = 2; $i <= int($input / 2); $i++) {
    my $div = $input / $i;

    unless ($div =~ /\./) {
      $factors.="$div,";
    }
  }
  my $end = time;
  my $duraction = $end - $start;
  chop($factors);
  printf "Factors for %d (%s) [ took %d seconds ]\n", $input, $factors, $duraction;
}
 