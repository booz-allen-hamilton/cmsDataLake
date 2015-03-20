theFile = LOAD '$deno_file' using PigStorage(',');
ldsconditioncodeInfo = FOREACH theFile GENERATE
	(chararray)$0 as dsysrtky:chararray,
	(int)$1 as claimno:int,
	(chararray)$2 as rltcndsq:chararray,
	(chararray)$3 as thru_dt:chararray,
	(chararray)$4 as clm_type:chararray,
	(chararray)$5 as rlt_cond:chararray;

store ldsconditioncodeInfo into '$out_table' using org.apache.hcatalog.pig.HCatStorer();
