theFile = LOAD '$deno_file' using PigStorage(',');
ldsvaluecodeInfo = FOREACH theFile GENERATE
	(chararray)$0 as dsysrtky:chararray,
	(int)$1 as claimno:int,
	(chararray)$2 as rltvalsq:chararray,
	(chararray)$3 as thru_dt:chararray,
	(chararray)$4 as clm_type:chararray,
	(chararray)$5 as val_cd:chararray,
	(chararray)$6 as val_amt:chararray;

store ldsvaluecodeInfo into '$out_table' using org.apache.hcatalog.pig.HCatStorer();
