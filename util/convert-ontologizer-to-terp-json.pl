#!/usr/bin/perl -w
use strict;
use JSON;

# Maps between ontologizer headers and TERF controlled vocabulary
my %colmap =
    (
     'ID'=>'id',
     'name'=>'label',
     'Pop.total'=>'population_size',
     'Pop.term'=>'enriched_class_population_size',
     'Study.total'=>'sample_size',
     'Study.term'=>'enriched_class_sample_size',
     'marg'=>'marginal_score',
     'nparents'=>'number_of_parents',
     'is.trivial'=>'is_trivial',

     'Pop.family'=>'population_famiy_size',
     'Study.family'=>'study_family_size',
     'p'=>'p_value',
     'p.adjusted'=>'adjusted_p_value',
     'p.min'=>'minimum_p_value',
    );

# ----------------------------------------
# TOP LEVEL OBJECT
# ----------------------------------------

my @results = ();
my $output = {
    input => {},
    implementation => {
        registry_id => "nlx_149289",
        version => undef,
    },
    results => \@results
};

print STDERR "Warning! result json will be incomplete as we do not know the inputs\n";

# ----------------------------------------
# RESULTS
# ----------------------------------------

$_ = <>;
chomp;

my @hdr = split(/\t/,$_);

my %col_ix = ();
for (my $i=0; $i<@hdr; $i++) {
    $col_ix{$colmap{$hdr[$i]}} = $i;
}

my $sortcol = 0;
my $asc = 1;

my @cols = grep { $_ ne 'id' && $_ ne 'label'} map { $colmap{$_} } (keys %colmap);

while(<>) {
    chomp;
    # fake root - introduced by Ontologizer?
    next if /GO:0000000/;
    s/"//g;
    my @vals = split(/\t/,$_);


    my $result = {
        term => {
            id => $vals[$col_ix{id}],
            label => $vals[$col_ix{label}],
            type => 'owl:Class',
        },
    };
    foreach my $c (@cols) {
        my $index = $col_ix{$c};
        if (defined $index) {
            my $v = $vals[$index];
            if (defined $v) {
                $result->{$c} = $v;

                if (!$sortcol) {
                    if ($c eq 'adjusted_p_value') {
                        $sortcol = $c;
                        $asc = 1;                        
                    }
                    if ($c eq 'p_value') {
                        $sortcol = $c;
                        $asc = 1;                        
                    }
                    if ($c eq 'marginal_score') {
                        $sortcol = $c;
                        $asc = 0;
                    }
                }
            }
        }
    }
    
    push(@results, $result);
}

if ($sortcol) {
    if ($asc) {
        @results = sort {$a->{$sortcol} <=> $b->{$sortcol}} @results;
    }
    else {
        @results = sort {$b->{$sortcol} <=> $a->{$sortcol}} @results;
    }
}


my $json = new JSON;
print $json->pretty->encode( $output );

exit 0;
