# CodeFMAB - Appendix: Bioinformatics Skills
This directory contains code referenced in the "Bioinformatics Skills" appendix.

## NCBI EDirect
[NCBI EDirect](https://www.ncbi.nlm.nih.gov/books/NBK179288/) allows programmatic access to [NCBI E-utilites](https://www.ncbi.nlm.nih.gov/books/NBK25501/) from a Unix-like shell.
Here we will show you how to install the software and demonstrate its versatile applications.
Initial examples have been modeled after records of no longer offered NCBI Insider's Guide classes on [EDirect](https://dataguide.nlm.nih.gov/edirect/overview.html) and [E-utilities](https://dataguide.nlm.nih.gov/eutilities/what_is_eutilities.html).

## Installation
Installation of EDirect is straightforward.
You will need to have a few system packages installed; see files [xupgradeFedora](./xupgradeFedora) and [xupgradeUbuntu](./xupgradeUbuntu) for sample upgrade scripts to run, depending on your flavor of Linux.
Furthermore, EDirect requires some Perl packages, which can be installed with the script [xcpanm](./xcpanm).
Thus, on an Ubuntu system, the following commands should take care of the pre-requisites:

```
sudo ./xupgradeUbuntu
suod ./xcpanm
```

After these preliminaries, [xinstall-edirect](./xinstall-edirect) will install EDirect into the current directory.
It is recommended to install into a common directory for external packages, for example

```
mkdir $HOME/src
cp xinstall-edirect $HOME/src
cd $HOME/src
bash ./xinstall-edirect
```

To make the EDirect scripts accessible from any shell after login, add the following to your ~/.profile file (or equivalent if you use a different shell type):

```bash
if [ -d "$HOME/src/edirect" ] ; then
    PATH="$PATH:$HOME/src/edirect"
fi
```

To activate the $PATH change in the current shell, type

```bash
source ~/.profile
```

That's all.
You should now be ready to use EDirect.

## A simple test
As a usage example, we shall download the bacteriophage lambda genome sequence from NCBI.
We assume prior knowledge that the database entry has accession number NC_001416.
The script [xgetLambda](./xgetLambda) executes

```bash
esearch -db nucleotide -query "NC_001416" | efetch -format fasta > lambda.fa
```

which will deposit the file lambda.fa into your current directory.


## Usage examples
The scripts xEDcode* provide usage examples derived from the [NCBI documentation](https://dataguide.nlm.nih.gov/classes/intro/samplecode.html).
