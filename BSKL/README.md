# CodeFMAB - Appendix: Bioinformatics Skills
This directory contains code referenced in the "Bioinformatics Skills" appendix.

## Installing NCBI EDirect
[NCBI EDirect](https://dataguide.nlm.nih.gov/edirect/overview.html) allows programmatic access to [NCBI E-utilites](https://dataguide.nlm.nih.gov/eutilities/what_is_eutilities.html) from a Unix-like shell.


[Installation of EDirect](https://dataguide.nlm.nih.gov/edirect/install.html) is straightforward.
You will need to have a few system packages installed; see files [xupgradeFedora](./xupgradeFedora) and [xupgradeUbuntu](./xupgradeUbuntu) for sample upgrade scripts to run, depending on your flavor of Linux.
Furthermore, EDirect requires some Perl packages, which can be installed with the script [xcpanm](./xcpanm).
After these preliminaries, [xinstall-edirect](./xinstall-edirect) will install EDirect into the current directory.
To make the EDirect scripts accessible from any shell, add the following to your ~/.bashrc file (or equivalent if you use a different shell type)

```bash
# Source local definitions
if [ -f ~/.profile ]; then
        . ~/.profile
fi
```

and activate the $PATH change by

```bash
source ~/.bashrc
```

That's all.
You should now be ready to use EDirect.

## A simple test
As a usage example, we shall download the bacteriophage lambda genome sequence from NCBI.
We assume prior knowledge that the database entry has accession number NC_001416.
The script [xgetLambda](.xgetLambda) executes

```bash
esearch -db nucleotide -query "NC_001416" | efetch -format fasta > lambda.fa
```

which will deposit the file lambda.fa into your current directory.


## Usage examples
The scripts xEDcode* provide usage examples derived from the [NCBI documentation](https://dataguide.nlm.nih.gov/classes/intro/samplecode.html).
