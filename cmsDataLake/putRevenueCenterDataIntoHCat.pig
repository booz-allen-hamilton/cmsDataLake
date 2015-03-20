theFile = LOAD '$deno_file' using PigStorage(',');
ldsrevenuectrInfo = FOREACH theFile GENERATE
	(chararray)$0 as dsysrtky:chararray,
	(int)$1 as claimno:int,
	(int)$2 as clm_ln:int,
	(chararray)$3 as thru_dt:chararray,
	(chararray)$4 as clm_type:chararray,
	(chararray)$5 as rev_cntr:chararray,
	(chararray)$6 as rev_dt:chararray,
	(chararray)$7 as apchipps:chararray,
	(chararray)$8 as hcpcs_cd:chararray,
	(chararray)$9 as mdfr_cd1:chararray,
	(chararray)$10 as mdfr_cd2:chararray,
	(chararray)$11 as pmtmthd:chararray,
	(chararray)$12 as dscntind:chararray,
	(chararray)$13 as packgind:chararray,
	(chararray)$14 as otaf_1:chararray,
	(chararray)$15 as idendc:chararray,
	(int)$16 as rev_unit:int,
	(chararray)$17 as rev_rate:chararray,
	(chararray)$18 as revblood:chararray,
	(chararray)$19 as revdctbl:chararray,
	(chararray)$20 as wageadj:chararray,
	(chararray)$21 as rdcdcoin:chararray,
	(chararray)$22 as rev_msp1:chararray,
	(chararray)$23 as rev_msp2:chararray,
	(chararray)$24 as rprvdpmt:chararray,
	(chararray)$25 as rbenepmt:chararray,
	(chararray)$26 as ptntresp:chararray,
	(chararray)$27 as revpmt:chararray,
	(chararray)$28 as rev_chrg:chararray,
	(chararray)$29 as rev_ncvr:chararray,
	(chararray)$30 as revstind:chararray,
	(chararray)$31 as rev_cntr_pricing_ind_cd:chararray;

store ldsrevenuectrInfo into '$out_table' using org.apache.hcatalog.pig.HCatStorer();
