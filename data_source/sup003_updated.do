************************************ BJPS replication do file ****
*** Last update: 4 March 2014 ************************************

********************************************************************************
**** Updated by Christopher Gandrud
**** 25 September 2014
**** With corrected yrcurnt data
**** See https://github.com/christophergandrud/yrcurnt_corrected
********************************************************************************

set mem 100mset more offencode worldbank_code, generate(country2)tsset country2 yeartab year, gen(y)* Deficit, debt change, and SFA measuresgen balance_gdp_edf = netlend_ublge3gen debt_change = grossdebt_udgg2 - l.grossdebt_udgg2gen debt_gdp_change = (debt_change / gdp_uvgd4)*100gen sfa_new = debt_gdp_change + netlend_ublge3* Transparency measuregen altlassenindex10b = al10_transparency / 11gen obi2010 = obi_10score / 100reg obi2010 altlassenindex10bpredict obi2reg obi2010 imf_rosc_transparencypredict obi3replace obi3 = obi2010 if obi2010~=.replace obi3 = obi2 if obi3==.* Slump and boom variablesgen slump = 0replace slump = gap_avggdt if gap_avggdt<0replace slump = . if gap_avggdt==.
gen slump2 = abs(slump)
gen slump2_obi3 = slump2 * obi3
gen boom = 0replace boom = gap_avggdt if gap_avggdt>0replace boom = . if gap_avggdt==.
gen booml3 = boom
replace booml3 = 0 if boom < 3
gen booml3_obi3 = booml3 * obi3


* Election variable

gen yrcurnt_obi3 = dpi_yrcurnt * obi3

********** Added in Replication 25 September 2014 ******************************
* Corrected election variable
gen yrcurnt_corrected_obi3 = yrcurnt_corrected * obi3



* Stability and Growth Pactgen sgp = 0replace sgp = 1 if worldbank_code=="AUT" & year > 1997replace sgp = 1 if worldbank_code=="BEL" & year > 1997replace sgp = 1 if worldbank_code=="BGR" & year > 1997replace sgp = 1 if worldbank_code=="CYP" & year > 1997replace sgp = 1 if worldbank_code=="CZE" & year > 1997replace sgp = 1 if worldbank_code=="DEU" & year > 1997replace sgp = 1 if worldbank_code=="DNK" & year > 1997replace sgp = 1 if worldbank_code=="ESP" & year > 1997replace sgp = 1 if worldbank_code=="EST" & year > 1997replace sgp = 1 if worldbank_code=="FIN" & year > 1997replace sgp = 1 if worldbank_code=="FRA" & year > 1997replace sgp = 1 if worldbank_code=="GBR" & year > 1997replace sgp = 1 if worldbank_code=="GRC" & year > 1997replace sgp = 1 if worldbank_code=="HUN" & year > 1997replace sgp = 1 if worldbank_code=="IRL" & year > 1997replace sgp = 1 if worldbank_code=="ITA" & year > 1997replace sgp = 1 if worldbank_code=="LTU" & year > 1997replace sgp = 1 if worldbank_code=="LUX" & year > 1997replace sgp = 1 if worldbank_code=="LVA" & year > 1997replace sgp = 1 if worldbank_code=="MLT" & year > 1997replace sgp = 1 if worldbank_code=="NLD" & year > 1997replace sgp = 1 if worldbank_code=="POL" & year > 1997replace sgp = 1 if worldbank_code=="PRT" & year > 1997replace sgp = 1 if worldbank_code=="ROM" & year > 1997replace sgp = 1 if worldbank_code=="SVK" & year > 1997replace sgp = 1 if worldbank_code=="SVN" & year > 1997replace sgp = 1 if worldbank_code=="SWE" & year > 1997gen sgp_obi3 = sgp*obi3* Main EU-15 sample
gen emu15 = 0replace emu15 = 1 if worldbank_code=="AUT"replace emu15 = 1 if worldbank_code=="BEL"replace emu15 = 1 if worldbank_code=="DEU"replace emu15 = 1 if worldbank_code=="ESP"replace emu15 = 1 if worldbank_code=="FIN"replace emu15 = 1 if worldbank_code=="FRA"replace emu15 = 1 if worldbank_code=="GRC"replace emu15 = 1 if worldbank_code=="IRL"replace emu15 = 1 if worldbank_code=="ITA"replace emu15 = 1 if worldbank_code=="LUX"replace emu15 = 1 if worldbank_code=="NLD"replace emu15 = 1 if worldbank_code=="PRT"replace emu15 = 1 if worldbank_code=="GBR"replace emu15 = 1 if worldbank_code=="DNK"replace emu15 = 1 if worldbank_code=="SWE"* Wider EU-27 samplegen eu27b = 0replace eu27b = 1 if worldbank_code=="AUT" & year >= 1995replace eu27b = 1 if worldbank_code=="BEL" & year >= 1952replace eu27b = 1 if worldbank_code=="BGR" & year >= 2007replace eu27b = 1 if worldbank_code=="CYP" & year >= 2004replace eu27b = 1 if worldbank_code=="CZE" & year >= 2004replace eu27b = 1 if worldbank_code=="DEU" & year >= 1952replace eu27b = 1 if worldbank_code=="DNK" & year >= 1973replace eu27b = 1 if worldbank_code=="ESP" & year >= 1986replace eu27b = 1 if worldbank_code=="EST" & year >= 2004replace eu27b = 1 if worldbank_code=="FIN" & year >= 1995replace eu27b = 1 if worldbank_code=="FRA" & year >= 1952replace eu27b = 1 if worldbank_code=="GBR" & year >= 1973replace eu27b = 1 if worldbank_code=="GRC" & year >= 1981replace eu27b = 1 if worldbank_code=="HUN" & year >= 2004replace eu27b = 1 if worldbank_code=="IRL" & year >= 1973replace eu27b = 1 if worldbank_code=="ITA" & year >= 1952replace eu27b = 1 if worldbank_code=="LTU" & year >= 2004replace eu27b = 1 if worldbank_code=="LUX" & year >= 1952replace eu27b = 1 if worldbank_code=="LVA" & year >= 2004replace eu27b = 1 if worldbank_code=="MLT" & year >= 2004replace eu27b = 1 if worldbank_code=="NLD" & year >= 1952replace eu27b = 1 if worldbank_code=="POL" & year >= 2004replace eu27b = 1 if worldbank_code=="PRT" & year >= 1986replace eu27b = 1 if worldbank_code=="ROM" & year >= 2007replace eu27b = 1 if worldbank_code=="SVK" & year >= 2004replace eu27b = 1 if worldbank_code=="SVN" & year >= 2004replace eu27b = 1 if worldbank_code=="SWE" & year >= 1995
*** BJPS main regressions - graph in main paper and full results in Appendix 7 ***set more off* Balance, no lag, incl. Greecextreg balance_gdp_edf dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

********** Added in Replication 25 September 2014 ******************************
xtreg balance_gdp_edf yrcurnt_corrected yrcurnt_corrected_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* Debt change, no lag, incl. Greece
xtreg debt_gdp_change dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

********** Added in Replication 25 September 2014 ******************************\
xtreg debt_gdp_change yrcurnt_corrected yrcurnt_corrected_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)


* SFA, no lag, incl. Greece
xtreg sfa_new dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

********** Added in Replication 25 September 2014 ******************************
xtreg sfa_new yrcurnt_corrected yrcurnt_corrected_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* SFA, no lag, excl. Greece
xtreg sfa_new dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & worldbank_code~="GRC" & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
xtreg sfa_new obi3 yrcurnt_corrected yrcurnt_corrected_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & worldbank_code~="GRC" & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)


* Shares and other equity, no lag, reduced sample excl. Greece and other countries with one observation or less
xtreg eurostat_f5_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

********** Added in Replication 25 September 2014 ******************************
xtreg eurostat_f5_gdp yrcurnt_corrected yrcurnt_corrected_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)


* Other accounts payable, no lag, reduced sample excl. Greece and other countries with one observation or less
xtreg eurostat_fli_oth_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

********** Added in Replication 25 September 2014 ******************************
xtreg eurostat_fli_oth_gdp yrcurnt_corrected yrcurnt_corrected_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)



******************
*** Appendices ***
******************


*** Appendix 6 ***

replace booml3 = boom
replace booml3 = 0 if boom < .5
replace booml3_obi3 = booml3 * obi3
xtreg sfa_new dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & worldbank_code~="GRC" & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

replace booml3 = boom
replace booml3 = 0 if boom < 1.5
replace booml3_obi3 = booml3 * obi3
xtreg sfa_new dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & worldbank_code~="GRC" & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

replace booml3 = boom
replace booml3 = 0 if boom < 2.5
replace booml3_obi3 = booml3 * obi3
xtreg sfa_new dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & worldbank_code~="GRC" & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

replace booml3 = boom
replace booml3 = 0 if boom < 3.5
replace booml3_obi3 = booml3 * obi3
xtreg sfa_new dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & worldbank_code~="GRC" & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)


*** Appendix 8 ***

* SFA subcomponents table

gen sfa_gfs = eurostat_gd_change_gdp - eurostat_edp_b9min_gdp

* Detailed subcomponents with GFS data from Eurostat
xtreg sfa_gfs dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
xtreg eurostat_f_as_tr_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
xtreg eurostat_tot_adj_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
xtreg eurostat_tot_x_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* Breakdown of net acquision of financial assets
xtreg eurostat_f2_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
xtreg eurostat_f3_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
xtreg eurostat_f4_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
xtreg eurostat_f5_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
xtreg eurostat_f_as_oth_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* Breakdown of adjustments
*xtreg eurostat_f34_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
xtreg eurostat_fli_oth_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
xtreg eurostat_iss_adj_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
xtreg eurostat_edp_d41_adj_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
xtreg eurostat_red_adj_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
xtreg eurostat_edp_k11_adj_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
xtreg eurostat_k121_adj_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
xtreg eurostat_oth_k_adj_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)


* Sample restrictions

* Reduced sample, looking only at observations where deficits exceed 3% of GDPxtreg sfa_new dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & balance_gdp_edf < -3 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* Reduced sample, excluding 4 countries with substantial cumulative surpluses over the 1998-2007 period (DNK, FIN, IRL, SWE)xtreg sfa_new dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & worldbank_code~= "DNK" & worldbank_code~= "FIN" & worldbank_code~= "IRL" & worldbank_code~= "SWE" & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
* Reduced sample, Eurozone only, excluding DNK, GBR, SWExtreg sfa_new dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & worldbank_code~="DNK" & worldbank_code~="GBR" & worldbank_code~="SWE" & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* Expanded sample, 25 EU countriesxtreg sfa_new dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if eu27b==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)


* Adding a lag to all main regressions in the paper

* Balance, with lag, incl. Greecextreg balance_gdp_edf l.balance_gdp_edf dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* Debt change, with lag, incl. Greece
xtreg debt_gdp_change l.debt_gdp_change dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* SFA, with lag, incl. Greece
xtreg sfa_new l.sfa_new dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* SFA, with lag, excl. Greece
xtreg sfa_new l.sfa_new dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & worldbank_code~="GRC" & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* Shares and other equity, with lag, reduced sample excl. Greece and other countries with one observation or less
xtreg eurostat_f5_gdp l.eurostat_f5_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* Other accounts payable, with lag, reduced sample excl. Greece and other countries with one observation or less
xtreg eurostat_fli_oth_gdp l.eurostat_fli_oth_gdp dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)


* Adding ideology and coalition dummies

* Prime minister from a leftish party (based on DPI), dummy
gen leftPM = 0replace leftPM = . if dpi_execrlc==.replace leftPM = 1 if dpi_execrlc==3

* Coalition government (based on DPI), dummy
gen coalition2 = 0
replace coalition2 = 1 if dpi_gov2seat > 0
replace coalition2 = . if dpi_gov2seat == .

set more off* Balance, no lag, incl. Greece + ideology and coalition dummiesxtreg balance_gdp_edf leftPM coalition2 dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* Debt change, no lag, incl. Greece + ideology and coalition dummies
xtreg debt_gdp_change leftPM coalition2 dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* SFA, no lag, incl. Greece + ideology and coalition dummies
xtreg sfa_new leftPM coalition2 dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* SFA, no lag, excl. Greece + ideology and coalition dummies
xtreg sfa_new leftPM coalition2 dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & worldbank_code~="GRC" & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* Shares and other equity, no lag, reduced sample excl. Greece and other countries with one observation or less + ideology and coalition dummies
xtreg eurostat_f5_gdp leftPM coalition2 dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)

* Other accounts payable, no lag, reduced sample excl. Greece and other countries with one observation or less + ideology and coalition dummies
xtreg eurostat_fli_oth_gdp leftPM coalition2 dpi_yrcurnt yrcurnt_obi3 sgp sgp_obi3 slump2 slump2_obi3 booml3 booml3_obi3 lv_crisis_dummy y31 y33-y47 if emu15==1 & (worldbank_code=="BEL" | worldbank_code=="ESP" | worldbank_code=="FRA" | worldbank_code=="GBR" | worldbank_code=="NLD" | worldbank_code=="PRT") & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)


* Nonlinearity

gen trans_high = 0
replace trans_high = 1 if obi3 > .74
replace trans_high = . if obi3 == .
replace trans_high = . if emu15 == 0

gen trans_medium = 0
replace trans_medium = 1 if obi3 <= .74 & obi3 > .65
replace trans_medium = . if obi3 == .
replace trans_medium = . if emu15 == 0

gen trans_low = 0
replace trans_low = 1 if obi3 <= .65
replace trans_low = . if obi3 == .
replace trans_low = . if emu15 == 0

gen trans_hml = 0
replace trans_hml = 1 if trans_medium == 1
replace trans_hml = 2 if trans_high == 1
replace trans_hml = . if obi3 == .

list country obi3 trans_high trans_medium trans_low trans_hml if year==2000 & emu15==1

* High transparency: Finland, France, Netherlands, Sweden, UK
* Medium transparency: Austria, Belgium, Denmark, Germany, Ireland
* Low transparency: Greece, Italy, Portugal, Spain

xtreg sfa_new c.dpi_yrcurnt##i.trans_hml c.sgp##i.trans_hml c.booml3##i.trans_hml c.slump2##i.trans_hml lv_crisis_dummy y31 y33-y47 if obi3~=. & emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)


* von Hagen & Wolff (2006) revisited, based on column 1 in their Table 2

* VH&W (p. 3269) on GMM: "We therefore specify a dynamic panel model with the lagged dependent variable* included as a regressor. We use the dynamic panel estimator by Arellano and Bond (1991), restricting
* the number of lagged levels to five in the instrument set. To address the simultaneous equation bias
* and endogeneity bias, we explicitly allow sfa, T x sfa [...] to be endogenous variables. This means
* that all possible lags until t-1 of these variables in levels are included as instruments for these
* endogenous variables.

* VH&W (p. 3270) on interpretation: "As the coefficient [on SFA] is statistically not different from 1,
* the estimated coefficient [the interaction term] represents the covariance between stock-flow adjustments
* and the deficit in the second period, which we find to be significantly negative. In regression (1) of
* Table 2, an increase of sfa by one percentage point results in a 0.25 percentage point lowering of the
* deficit. This suggests that stock-flow adjustments have become a policy variable to control the deficit
* in the time period when the fiscal rule was in place. In the earlier period, the regression results do not* imply any correlation between stock-flow adjustments and deficits. Thus, our results indicate that the
* introduction of the fiscal rule led governments to systematically use stockflow adjustments to lower deficits.

gen sfa_sgp = sfa_new * sgp

set more off

* GMM, conventional SEs
xtabond debt_gdp_change sfa_new sgp sfa_sgp if obi3~=. & emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., lags(1) maxldep(5) endogenous(sfa_new sfa_sgp)
test sfa_new = 1

* GMM, robust SEs
xtabond debt_gdp_change sfa_new sgp sfa_sgp if obi3~=. & emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., lags(1) maxldep(5) endogenous(sfa_new sfa_sgp) robust
test sfa_new = 1

* FE, conventional SEs
xtreg debt_gdp_change l.debt_gdp_change sfa_new sgp sfa_sgp if obi3~=. & emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe
test sfa_new = 1

* FE, clustered SEs
xtreg debt_gdp_change l.debt_gdp_change sfa_new sgp sfa_sgp if obi3~=. & emu15==1 & weber_inflation < 20 & year<2008 & year>1989 & l.sfa_new~=. & l.balance_gdp_edf~=. & l.debt_gdp_change~=., fe cluster(country2)
test sfa_new = 1
