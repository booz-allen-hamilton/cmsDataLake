theFile = LOAD '$deno_file' using PigStorage(',');
ldsoccurrencecodeInfo = FOREACH theFile GENERATE
	(chararray)$0 as dsysrtky:chararray,
	(int)$1 as claimno:int,
	(chararray)$2 as rltocrsq:chararray,
	(chararray)$3 as thru_dt:chararray,
	(chararray)$4 as clm_type:chararray,
	(chararray)$5 as ocrnc_cd:chararray,
	(chararray)$6 as ocrncdt:chararray;

store ldsoccurrencecodeInfo into '$out_table' using org.apache.hcatalog.pig.HCatStorer();
