#! /usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

print "### ROMAN NUMERALS CONVERSION ###\n";

sub roman_numerals{
  my $str = shift;

  #Split string into array
  my @array = split(//,$str);

  my ($result, $previous, $current) = 0;

  for(my $i = 0; $i <scalar @array; $i++){
    $current = get_value($array[$i]);

    if($i == 0){
      $result = $current;
    }
    else{
      if($previous < $current){
        $result -= $previous;
        $result += $current - $previous;
      }
      else{
        $result = $current + $result;
      }
    }
    $previous = $current;
  }

  return $result;
}

#Mapping
sub get_value{
  my $char = shift;
  my $map = {
    'I' => 1,
    'V' => 5, 
    'X' => 10,
    'L' => 50,
    'C' => 100,
  };
  return $map->{$char};
}

MAIN:{
  print "RESULT: ", roman_numerals('L')."\n";
}

1;

__END__
