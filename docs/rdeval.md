The standard notation of rdeval is:
``` 
rdeval input.[fasta|fastq|gfa][.gz] [expected genome size]
```

Let's begin by looking at the options of redeval:
```
rdeval -h
```

Let's get some test files first:
```
cp gfastar-training/docs/testFiles-rdeval/* .
```

Now let's evaluate the contents of our fasta file:
```
rdeval random1.fastq
```

Output size list, based on unsorted (‘u’), sorted (‘s’), histogram (‘h’) or inverse cumulative table (‘c’) [-s/–out-size]:
```
rdeval -s u random1.fastq
rdeval -s s random1.fastq
rdeval -s h random1.fastq
rdeval -s c random1.fastq
```

To obtain a distribution of quality for each read (c) or both length and quality(l):
```
rdeval random1.fastq -q c
rdeval random1.fastq -q l
```

To generate a per-read report:
```
rdeval --sequence-report random1.fastq
```

To filter the reads to be assessed, by length (‘l’) or quality (‘q’), or both:
```
rdeval -f 'l>10' random1.fastq
rdeval -f 'q>10' random1.fastq
rdeval -f 'l>10 & q>10' random1.fastq
```

To exclude data from analysis, based on read header information in a list [-e/–exclude-list]:
```
rdeval -i header.txt random1.fastq
```

To include data in the analysis, based on read header information in a list [-i/include-list]:
```
rdeval -i header.txt random1.fastq
```

To write reads to a file or generate an rd summary file (output options: fa*[.gz], bam, cram, rd):
```
rdeval -o output1.fa random1.fastq
rdeval -o output1.rd random1.fastq
```

To compress all the homopolymers longer than ‘n’ in the input:
```
rdeval --sample 0.5 random1.fastq
```

To subsample reads (requires an float between 0 and 1; use seed for reproducible runs):
```
rdeval --sample 0.5 random1.fastq
rdeval --sample 0.5 --random-seed 1 random1.fastq
```

To print md5 of a .rd file:
```
rdeval --md5 output1.rd
```

To generate a HTML file (e.g. [genomark](https://genomeark.s3.amazonaws.com/index.html?prefix=downstream_analyses/SRA/)):
```
R -e "rmarkdown::render('${RDEVAL}/figures.Rmd', output_file='[output].html')" --args "[rd-file-1].rd" "[rd-file-2].rd"
```