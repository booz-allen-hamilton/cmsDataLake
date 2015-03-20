#!/bin/bash

usage()
{
cat << EOF
usage: $0 -o table_name -f deno_file

This script creates a table to store  LDS Revenue Center data into HCatalog for readmission measures.

OPTIONS:
        -h      Show this message
        -o      table name as database.table
        -f      denominator file
EOF
}

table_name=""
deno_file=""
while getopts "ho:f:" OPTION
do
        case $OPTION in 
                h)
                        usage
                        exit 1
                        ;;
                o)
                        table_name=$OPTARG
                        ;;
                f)      deno_file=$OPTARG
                        ;;
                ?)
                        echo "Error: unknown option -$OPTARG" 
                        usage
                        exit 1
                        ;;
        esac
done
if [[ -z $table_name ]] || [[ -z $deno_file ]]
then
	usage
	exit 1
else
	#First drop table before creating
	hcat -e "drop table ${table_name}"
	#create the table
	hcat -e "create table ${table_name}(dsysrtky string, claimno int, clm_ln int, thru_dt string, clm_type string, rev_cntr string, rev_dt string, apchipps string, hcpcs_cd string, mdfr_cd1 string, mdfr_cd2 string, pmtmthd string, dscntind string, packgind string, otaf_1 string, idendc string, rev_unit int, rev_rate string, revblood string, revdctbl string, wageadj string, rdcdcoin string, rev_msp1 string, rev_msp2 string, rprvdpmt string, rbenepmt string, ptntresp string, revpmt string, rev_chrg string, rev_ncvr string, revstind string, rev_cntr_pricing_ind_cd string)"
	

	#run pig script to fill data
	pig -useHCatalog -p deno_file=${deno_file} -p out_table=${table_name} putRevenueCenterDataIntoHCat.pig 
fi
