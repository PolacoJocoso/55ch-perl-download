#!/usr/bin/perl -w

use WWW::Mechanize;
use Term::ANSIColor;
use warnings;
use strict;
#-------------
#my $cont=0;
#my @lista=(1,2,8,78,88);
#for($cont=0;$cont<300;$cont++){
#if($cont%60==0){print $cont."\n";}
#}print "-----------------------------\n";
#
#for($cont=0;$cont<300;$cont++){
#if($cont ~~ @lista){print $cont." tá na lista\n";}
#}
#-------------
sub R($$){
print $_[0]."\nNúmero de argumentos: ".@_."\n";
}
R($ARGV[0],$ARGV[1]);
#srand(12);
print "Um número randômico: ".int(rand(1000))."\n";
mkdir(int(rand(1000))*int(rand(1000)),0777);
