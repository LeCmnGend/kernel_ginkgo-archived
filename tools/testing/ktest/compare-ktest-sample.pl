<<<<<<< HEAD
#!/usr/bin/env perl
=======
#!/usr/bin/perl
>>>>>>> 169b81fd53c8c3aae4861aff8a9d502629eba3b4
# SPDX-License-Identifier: GPL-2.0

open (IN,"ktest.pl");
while (<IN>) {
    # hashes are now used
    if (/\$opt\{"?([A-Z].*?)(\[.*\])?"?\}/ ||
	/^\s*"?([A-Z].*?)"?\s*=>\s*/ ||
	/set_test_option\("(.*?)"/) {
	$opt{$1} = 1;
    }
}
close IN;

open (IN, "sample.conf");
while (<IN>) {
    if (/^\s*#?\s*([A-Z]\S*)\s*=/) {
	$samp{$1} = 1;
    }
}
close IN;

foreach $opt (keys %opt) {
    if (!defined($samp{$opt})) {
	print "opt = $opt\n";
    }
}

foreach $samp (keys %samp) {
    if (!defined($opt{$samp})) {
	print "samp = $samp\n";
    }
}
