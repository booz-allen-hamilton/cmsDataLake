#!/bin/bash

usage()
{
cat << EOF
usage: $0 -o table_name -f deno_file

This script creates a table to store Outpatient LDS data into HCatalog for readmission measures.

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
	hcat -e "create table ${table_name}(dsysrtky string, claimno int, provider string, thru_dt string,	ric_cd string, clm_type string, query_cd string, fac_type string, typesrvc string, freq_cd string,	fi_num int, nopay_cd string, pmt_amt string, prpayamt string, prpay_cd string, prstate string, orgnpinm string, at_upin string, at_npi string, op_upin string, op_npi string, ot_upin string,	ot_npi string, mcopdsw string, stus_cd string, tot_chrg string, blddedam string, pcchgamt string,	prncpal_dgns_cd string, prncpal_dgns_vrsn_cd string, icd_dgns_cd1 string, icd_dgns_vrsn_cd1 string,	icd_dgns_cd2 string, icd_dgns_vrsn_cd2 string, icd_dgns_cd3 string, icd_dgns_vrsn_cd3 string,	icd_dgns_cd4 string, icd_dgns_vrsn_cd4 string, icd_dgns_cd5 string, icd_dgns_vrsn_cd5 string,	icd_dgns_cd6 string, icd_dgns_vrsn_cd6 string, icd_dgns_cd7 string, icd_dgns_vrsn_cd7 string,	icd_dgns_cd8 string, icd_dgns_vrsn_cd8 string, icd_dgns_cd9 string, icd_dgns_vrsn_cd9 string,	icd_dgns_cd10 string, icd_dgns_vrsn_cd10 string, icd_dgns_cd11 string, icd_dgns_vrsn_cd11 string,	icd_dgns_cd12 string, icd_dgns_vrsn_cd12 string, icd_dgns_cd13 string, icd_dgns_vrsn_cd13 string,	icd_dgns_cd14 string, icd_dgns_vrsn_cd14 string, icd_dgns_cd15 string, icd_dgns_vrsn_cd15 string,	icd_dgns_cd16 string, icd_dgns_vrsn_cd16 string, icd_dgns_cd17 string, icd_dgns_vrsn_cd17 string,	icd_dgns_cd18 string, icd_dgns_vrsn_cd18 string, icd_dgns_cd19 string, icd_dgns_vrsn_cd19 string,	icd_dgns_cd20 string, icd_dgns_vrsn_cd20 string, icd_dgns_cd21 string, icd_dgns_vrsn_cd21 string,	icd_dgns_cd22 string, icd_dgns_vrsn_cd22 string, icd_dgns_cd23 string, icd_dgns_vrsn_cd23 string,	icd_dgns_cd24 string, icd_dgns_vrsn_cd24 string, icd_dgns_cd25 string, icd_dgns_vrsn_cd25 string,	fst_dgns_e_cd string, fst_dgns_e_vrsn_cd string, icd_dgns_e_cd1 string, icd_dgns_e_vrsn_cd1 string, icd_dgns_e_cd2 string, icd_dgns_e_vrsn_cd2 string, icd_dgns_e_cd3 string, icd_dgns_e_vrsn_cd3 string,	 icd_dgns_e_cd4 string, icd_dgns_e_vrsn_cd4 string, icd_dgns_e_cd5 string, icd_dgns_e_vrsn_cd5 string,	 icd_dgns_e_cd6 string, icd_dgns_e_vrsn_cd6 string, icd_dgns_e_cd7 string, icd_dgns_e_vrsn_cd7 string,	 icd_dgns_e_cd8 string, icd_dgns_e_vrsn_cd8 string, icd_dgns_e_cd9 string, icd_dgns_e_vrsn_cd9 string,	 icd_dgns_e_cd10 string, icd_dgns_e_vrsn_cd10 string, icd_dgns_e_cd11 string, icd_dgns_e_vrsn_cd11 string,	 icd_dgns_e_cd12 string, icd_dgns_e_vrsn_cd12 string, icd_prcdr_cd1 string, icd_prcdr_vrsn_cd1 string, prcdr_dt1 string,icd_prcdr_cd2 string,icd_prcdr_vrsn_cd2 string, prcdr_dt2 string, icd_prcdr_cd3 string, icd_prcdr_vrsn_cd3 string, prcdr_dt3 string, icd_prcdr_cd4 string, icd_prcdr_vrsn_cd4 string, prcdr_dt4 string,	 icd_prcdr_cd5 string, icd_prcdr_vrsn_cd5 string, prcdr_dt5 string, icd_prcdr_cd6 string,	 icd_prcdr_vrsn_cd6 string, prcdr_dt6 string, icd_prcdr_cd7 string, icd_prcdr_vrsn_cd7 string, prcdr_dt7 string,	 icd_prcdr_cd8 string, icd_prcdr_vrsn_cd8 string, prcdr_dt8 string, icd_prcdr_cd9 string, icd_prcdr_vrsn_cd9 string,	 prcdr_dt9 string, icd_prcdr_cd10 string, icd_prcdr_vrsn_cd10 string, prcdr_dt10 string,	 icd_prcdr_cd11 string, icd_prcdr_vrsn_cd11 string, prcdr_dt11 string, icd_prcdr_cd12 string,	 icd_prcdr_vrsn_cd12 string, prcdr_dt12 string, icd_prcdr_cd13 string, icd_prcdr_vrsn_cd13 string, prcdr_dt13 string, icd_prcdr_cd14 string, icd_prcdr_vrsn_cd14 string, prcdr_dt14 string, icd_prcdr_cd15 string, icd_prcdr_vrsn_cd15 string, prcdr_dt15 string, icd_prcdr_cd16 string,	 icd_prcdr_vrsn_cd16 string, prcdr_dt16 string, icd_prcdr_cd17 string, icd_prcdr_vrsn_cd17 string, prcdr_dt17 string, icd_prcdr_cd18 string, icd_prcdr_vrsn_cd18 string, prcdr_dt18 string, icd_prcdr_cd19 string, icd_prcdr_vrsn_cd19 string, prcdr_dt19 string, icd_prcdr_cd20 string,	 icd_prcdr_vrsn_cd20 string, prcdr_dt20 string, icd_prcdr_cd21 string, icd_prcdr_vrsn_cd21 string, prcdr_dt21 string, icd_prcdr_cd22 string, icd_prcdr_vrsn_cd22 string, prcdr_dt22 string,	 icd_prcdr_cd23 string, icd_prcdr_vrsn_cd23 string, prcdr_dt23 string, icd_prcdr_cd24 string,	 icd_prcdr_vrsn_cd24 string, prcdr_dt24 string, icd_prcdr_cd25 string, icd_prcdr_vrsn_cd25 string,	 prcdr_dt25 string, rsn_visit_cd1 string, rsn_visit_vrsn_cd1 string, rsn_visit_cd2 string, rsn_visit_vrsn_cd2 string,	 rsn_visit_cd3 string, rsn_visit_vrsn_cd3 string, ptb_ded string, ptb_coin string, prvdrpmt string,	 benepmt string, dob_dt int, gndr_cd string, race_cd string, cnty_cd string, state_cd string,	 cwf_bene_mdcr_stus_cd string, actioncd string)"
	

	#run pig script to fill data
	pig -useHCatalog -p deno_file=${deno_file} -p out_table=${table_name} putOutLdsDataIntoHCat.pig 
fi
