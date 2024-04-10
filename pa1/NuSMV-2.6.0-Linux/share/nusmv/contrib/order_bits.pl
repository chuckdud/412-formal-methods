#!/usr/bin/perl
#
# Copyright (C) 2007 Marco Roveri.
# Originally written by Marco Roveri <roveri@fbk.eu>
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# Reads an input order file generated by NuSMV and order the bits as
# to have the bit of words and scalar variables interleaved.  
#
# The other pure boolean variables are put possibly in the order they
# appear in the initial file at the topo or at the bottom, depending
# the -r option
#
# Thevariable ordering with bits can be generated by NuSMV with the
# following NuSMV commands provided in input at the interactive shell
# prompt of NuSMV
# 
# NuSMV -int <file.smv>
# NuSMV> set write_order_dumps_bits
# NuSMV> read_model
# NuSMV> flatten_hierarchy
# NuSMV> encode_variables
# NuSMV> write_order
# 
# This generate a file temp.ord. If you need a different file 
# 
# NuSMV> write_order -o <ordfile.ord>
# 
# the ordering file is then saved in file <ordfile.smv>
# 
# Usage: order_bits.pl [-i <input orderfile>] [-o <output orderfile>] [-r] [-h]
# Where:\n";
# <input orderfile> is the input order file to order. Default value "temp.ord"
#     obtained with the NuSMV command sequence:
#       set write_order_dumps_bits
#       read_model
#       flatten_hierarchy
#       encode_variables
#       write_order
#       quit
# <output orderfile> is the output order file. Default standard output
# -u reverse the order
# 

use Getopt::Std;

my $version = "1.0 -- Feb 25, 2007";
my $ifile = "temp.ord";
my $maxv = 50000;
my $ofile = "";
my $order = 1;
my $name = "order_bits.pl";

sub varcompare() {
    ($s1, $s2) = ($a, $b);

    # escaping . with _dot_
#    while($s1 =~ /^([-\"\$ \#\w_]+)\.([-\"\$ \#\w_.]+)/) {
#        $s1 = "$1_dot_$2";
#    }
#    while($s2 =~ /^([-\"\$ \#\w_]+)\.([-\"\$ \#\w_.]+)/) {
#        $s2 = "$1_dot_$2";
#    }

    # from now on no more . in the name
    if ($s1 =~ /.*\.(\d+)$/) {
        $s1 = $1;
    }
    else {
        if ($order == 1) {
            $s1 = $maxv;
        }
        else {
            $s1 = 0;
        }
    }
    if ($s2 =~ /.*\.(\d+)$/) {
        $s2 = $1;
    }
    else {
        if ($order == 1) {
            $s2 = $maxv;
        }
        else {
            $s2 = 0;
        }
    }
    if ($order == 1) {
        return $s2 <=> $s1;
    }
    else {
        return $s1 <=> $s2;
    }
}

sub help() {
    print STDERR "Usage: $name [-i <input orderfile>] [-o <output orderfile>] [-r] [-h]\n";
    print STDERR "Where:\n";
    print STDERR "\t <input orderfile> is the input order file to order.\n\t Default value \"temp.ord\"";
    print STDERR " obtained with the NuSMV command sequence:\n\t\tset write_order_dumps_bits\n\t\tread_model\n\t\tflatten_hierarchy\n\t\tencode_variables\n\t\twrite_order\n\t\tquit\"\n";
    print STDERR "\t <output orderfile> is the output order file. Default standard output\n";
    print STDERR "\t -u reverse the order\n";
    exit 1;
} 

sub varerror () {
    my ($m) = @_;
    
    print STDERR "ERROR: $m";
    &help;
    exit 1;
}

sub main() {
    open(FILE, "< $ifile") || &varerror("Unable to open file \"$ifile\" for reading\n");
    my @vars = ();
    my @nvars = ();

    while(<FILE>) {
        chomp;
        my $v = $_;
        push @vars, $v;
        next;
    }
    close(FILE);

    # Sorting of the variables in descending order on the last number
    # if any.  the model boolean variables have an higher position in
    # the final ordering, that's thay stay at the top, or close to the
    # top.
    @nvars = sort varcompare @vars;

    # Printing of the new order file
    if ($ofile eq "") {
        my $i;
        for ($i=0; $i<$#nvars; $i++) {print $nvars[$i], "\n"};
        print "\n";
    }
    else {
        open(FILE, ">$ofile") || &varerror("Unable to open file \"$ofile for writing\"\n");
        my $i;
        for ($i=0; $i<$#nvars; $i++) {print FILE $nvars[$i], "\n"};
        print FILE "\n";
        close(FILE);
    }
}    

&getopts('i:o:rh') || &help;

&help if ($opt_h);

$ifile = "temp.ord";
# $ofile = "p.ord";

if (defined($opt_i)) {
    $ifile = $opt_i;
}
if (defined($opt_o)) {
    $ofile = $opt_o;
}
if (defined($opt_r)) {
    $order = 0;
}

&main;
