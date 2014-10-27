Alt et al. (2014) Replication
==========================

> This repository includes a replication of [Alt et al. (2014)](http://dx.doi.org/10.1017/S0007123414000064)
using corrected election timing data.

Christopher Gandrud

27 October 2014

## Motivation

[Alt et al. (2014)](http://dx.doi.org/10.1017/S0007123414000064)
use the **yrcurnt** election timing variable from the
[Database of Political Institution's](http://go.worldbank.org/2EAGGLRZ40) (2012)
in their recent study of fiscal gimmickry in Europe. They find that fiscal
gimmickry is more common directly before elections (and in countries with weak
fiscal transparency).

However, this variable has a number of problems that reduce its reliability and
validity of the variable as a measure of government election timing. See
[Gandrud (2014)](https://github.com/christophergandrud/yrcurnt_corrected)
for details.

## Summary

This replication simply uses a corrected version of the **yrcurnt** variable
in the same regression models as those presented in the original paper.

Overall, the original results are robust to models using the corrected variable,
though the estimated magnitudes and statistical significance of the effects are
reduced somewhat.

## Contents

The repository contains the following main files:

- [data_source/sup002_corrected.dta](data_source/sup002_corrected.dta): the original
Stata data file with one addition: the corrected **yrcurnt** variable
**yrcurnt_corrected**

- [data_source/sup003_updated.do](data_source/sup003_updated.do) the Stata
do-file with source to run both the original and replication analyses.

- [detailed_results/Alt_et_al_2014_detailed_results.pdf](detailed_results/Alt_et_al_2014_detailed_results.pdf):
a write up of the replication with biased and corrected results tables.
