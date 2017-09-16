# .latexmkrc starts
$pdf_mode = 1;
$pdflatex .= ' && (cp "%D" "%R.pdf"; echo Output file copied from "%D" to "%R.pdf" in current directory)';
$out_dir = 'build';
# .latexmkrc ends
