use strict;
use warnings;

# first star
open(my $in,  "<",  "input.txt")  or die "Can't open input.txt: $!";

my $first_star = 0;

while (my $line = <$in>) {
  # print $line
  
  my @first_split = split(":",$line);
  my $game_number = (split(" ",$first_split[0]))[1];

  my $truth = 0;
  my @openings = split(";",$first_split[1]);
  foreach my $game (@openings){
    my %count = ("red"=>0,"blue"=>0,"green"=>0);

    my @boxes = split(",",$game);
    foreach my $box (@boxes){
      my @content = split(" ",$box);
      my $color = $content[1];
      my $quantity = $content[0];
      # print $color;
      foreach my $i (keys %count){
        if ($i eq $color){
          $count{$i}+=$quantity;
          # print $quantity,$color;
        }
      }
    }

    if ($count{"red"}>12 || $count{"green"}>13 || $count{"blue"}>14){
      $truth = 1;
    }

  }

  if ($truth == 0){
    $first_star+=$game_number
  }
  # print $game _number;
}

print "First Star: ",$first_star,"\n";

#second star
close($in);
open(my $in,  "<",  "input.txt")  or die "Can't open input.txt: $!";

my $second_star = 0;

while (my $line = <$in>) {
  # print $line
  my @first_split = split(":",$line);
  my $game_number = (split(" ",$first_split[0]))[1];

  my @openings = split(";",$first_split[1]);
  my %count = ("red"=>0,"blue"=>0,"green"=>0);
  foreach my $game (@openings){

    my @boxes = split(",",$game);
    foreach my $box (@boxes){
      my @content = split(" ",$box);
      my $color = $content[1];
      my $quantity = $content[0];
      # print $color;
      foreach my $i (keys %count){
        if ($i eq $color){
          if ($count{$i}<$quantity){
            $count{$i}=$quantity;
          }
          # print $quantity,$color;
        }
      }
    }
  }

  $second_star+=$count{"red"}*$count{"blue"}*$count{"green"};
}

print "Second star: ${second_star}\n";
  # print $game _number;