$pdf_mode = 1;
$aux_dir = '../aux_files/build';
$pdflatex = 'pdflatex -synctex=1 %O %S';

my $texfile = $ARGV[-1] // '';
if ($texfile =~ /homework/ || $texfile =~ /lab-report/) {
    $out_dir = '../homework';
} else {
    $out_dir = '../lecture_notes';
}
