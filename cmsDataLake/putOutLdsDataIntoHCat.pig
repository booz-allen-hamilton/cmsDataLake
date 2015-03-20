theFile = LOAD '$deno_file' using PigStorage(',');
ldsbeneficiaryInfo = FOREACH theFile GENERATE
	(chararray)$0 as dsysrtky:chararray,
	(int)$1 as claimno:int,
	(chararray)$2 as provider:chararray,
	(chararray)$3 as thru_dt:chararray,
	(chararray)$4 as ric_cd:chararray,
	(chararray)$5 as clm_type:chararray,
	(chararray)$6 as query_cd:chararray,
	(chararray)$7 as fac_type:chararray,
	(chararray)$8 as typesrvc:chararray,
	(chararray)$9 as freq_cd:chararray,
	(int)$10 as fi_num:int,
	(chararray)$11 as nopay_cd:chararray,
	(chararray)$12 as pmt_amt:chararray,
	(chararray)$13 as prpayamt:chararray,
	(chararray)$14 as prpay_cd:chararray,
	(chararray)$15 as prstate:chararray,
	(chararray)$16 as orgnpinm:chararray,
	(chararray)$17 as at_upin:chararray,
	(chararray)$18 as at_npi:chararray,
	(chararray)$19 as op_upin:chararray,
	(chararray)$20 as op_npi:chararray,
	(chararray)$21 as ot_upin:chararray,
	(chararray)$22 as ot_npi:chararray,
	(chararray)$23 as mcopdsw:chararray,
	(chararray)$24 as stus_cd:chararray,
	(chararray)$25 as tot_chrg:chararray,
	(chararray)$26 as blddedam:chararray,
	(chararray)$27 as pcchgamt:chararray,
	(chararray)$28 as prncpal_dgns_cd:chararray,
	(chararray)$29 as prncpal_dgns_vrsn_cd:chararray,
	(chararray)$30 as icd_dgns_cd1:chararray,
	(chararray)$31 as icd_dgns_vrsn_cd1:chararray,
	(chararray)$32 as icd_dgns_cd2:chararray,
	(chararray)$33 as icd_dgns_vrsn_cd2:chararray,
	(chararray)$34 as icd_dgns_cd3:chararray,
	(chararray)$35 as icd_dgns_vrsn_cd3:chararray,
	(chararray)$36 as icd_dgns_cd4:chararray,
	(chararray)$37 as icd_dgns_vrsn_cd4:chararray,
	(chararray)$38 as icd_dgns_cd5:chararray,
	(chararray)$39 as icd_dgns_vrsn_cd5:chararray,
	(chararray)$40 as icd_dgns_cd6:chararray,
	(chararray)$41 as icd_dgns_vrsn_cd6:chararray,
	(chararray)$42 as icd_dgns_cd7:chararray,
	(chararray)$43 as icd_dgns_vrsn_cd7:chararray,
	(chararray)$44 as icd_dgns_cd8:chararray,
	(chararray)$45 as icd_dgns_vrsn_cd8:chararray,
	(chararray)$46 as icd_dgns_cd9:chararray,
	(chararray)$47 as icd_dgns_vrsn_cd9:chararray,
	(chararray)$48 as icd_dgns_cd10:chararray,
	(chararray)$49 as icd_dgns_vrsn_cd10:chararray,
	(chararray)$50 as icd_dgns_cd11:chararray,
	(chararray)$51 as icd_dgns_vrsn_cd11:chararray,
	(chararray)$52 as icd_dgns_cd12:chararray,
	(chararray)$53 as icd_dgns_vrsn_cd12:chararray,
	(chararray)$54 as icd_dgns_cd13:chararray,
	(chararray)$55 as icd_dgns_vrsn_cd13:chararray,
	(chararray)$56 as icd_dgns_cd14:chararray,
	(chararray)$57 as icd_dgns_vrsn_cd14:chararray,
	(chararray)$58 as icd_dgns_cd15:chararray,
	(chararray)$59 as icd_dgns_vrsn_cd15:chararray,
	(chararray)$60 as icd_dgns_cd16:chararray,
	(chararray)$61 as icd_dgns_vrsn_cd16:chararray,
	(chararray)$62 as icd_dgns_cd17:chararray,
	(chararray)$63 as icd_dgns_vrsn_cd17:chararray,
	(chararray)$64 as icd_dgns_cd18:chararray,
	(chararray)$65 as icd_dgns_vrsn_cd18:chararray,
	(chararray)$66 as icd_dgns_cd19:chararray,
	(chararray)$67 as icd_dgns_vrsn_cd19:chararray,
	(chararray)$68 as icd_dgns_cd20:chararray,
	(chararray)$69 as icd_dgns_vrsn_cd20:chararray,
	(chararray)$70 as icd_dgns_cd21:chararray,
	(chararray)$71 as icd_dgns_vrsn_cd21:chararray,
	(chararray)$72 as icd_dgns_cd22:chararray,
	(chararray)$73 as icd_dgns_vrsn_cd22:chararray,
	(chararray)$74 as icd_dgns_cd23:chararray,
	(chararray)$75 as icd_dgns_vrsn_cd23:chararray,
	(chararray)$76 as icd_dgns_cd24:chararray,
	(chararray)$77 as icd_dgns_vrsn_cd24:chararray,
	(chararray)$78 as icd_dgns_cd25:chararray,
	(chararray)$79 as icd_dgns_vrsn_cd25:chararray,
	(chararray)$80 as fst_dgns_e_cd:chararray,
	(chararray)$81 as fst_dgns_e_vrsn_cd:chararray,
	(chararray)$82 as icd_dgns_e_cd1:chararray,
	(chararray)$83 as icd_dgns_e_vrsn_cd1:chararray,
	(chararray)$84 as icd_dgns_e_cd2:chararray,
	(chararray)$85 as icd_dgns_e_vrsn_cd2:chararray,
	(chararray)$86 as icd_dgns_e_cd3:chararray,
	(chararray)$87 as icd_dgns_e_vrsn_cd3:chararray,
	(chararray)$88 as icd_dgns_e_cd4:chararray,
	(chararray)$89 as icd_dgns_e_vrsn_cd4:chararray,
	(chararray)$90 as icd_dgns_e_cd5:chararray,
	(chararray)$91 as icd_dgns_e_vrsn_cd5:chararray,
	(chararray)$92 as icd_dgns_e_cd6:chararray,
	(chararray)$93 as icd_dgns_e_vrsn_cd6:chararray,
	(chararray)$94 as icd_dgns_e_cd7:chararray,
	(chararray)$95 as icd_dgns_e_vrsn_cd7:chararray,
	(chararray)$96 as icd_dgns_e_cd8:chararray,
	(chararray)$97 as icd_dgns_e_vrsn_cd8:chararray,
	(chararray)$98 as icd_dgns_e_cd9:chararray,
	(chararray)$99 as icd_dgns_e_vrsn_cd9:chararray,
	(chararray)$100 as icd_dgns_e_cd10:chararray,
	(chararray)$101 as icd_dgns_e_vrsn_cd10:chararray,
	(chararray)$102 as icd_dgns_e_cd11:chararray,
	(chararray)$103 as icd_dgns_e_vrsn_cd11:chararray,
	(chararray)$104 as icd_dgns_e_cd12:chararray,
	(chararray)$105 as icd_dgns_e_vrsn_cd12:chararray,
	(chararray)$106 as icd_prcdr_cd1:chararray,
	(chararray)$107 as icd_prcdr_vrsn_cd1:chararray,
	(chararray)$108 as prcdr_dt1:chararray,
	(chararray)$109 as icd_prcdr_cd2:chararray,
	(chararray)$110 as icd_prcdr_vrsn_cd2:chararray,
	(chararray)$111 as prcdr_dt2:chararray,
	(chararray)$112 as icd_prcdr_cd3:chararray,
	(chararray)$113 as icd_prcdr_vrsn_cd3:chararray,
	(chararray)$114 as prcdr_dt3:chararray,
	(chararray)$115 as icd_prcdr_cd4:chararray,
	(chararray)$116 as icd_prcdr_vrsn_cd4:chararray,
	(chararray)$117 as prcdr_dt4:chararray,
	(chararray)$118 as icd_prcdr_cd5:chararray,
	(chararray)$119 as icd_prcdr_vrsn_cd5:chararray,
	(chararray)$120 as prcdr_dt5:chararray,
	(chararray)$121 as icd_prcdr_cd6:chararray,
	(chararray)$122 as icd_prcdr_vrsn_cd6:chararray,
	(chararray)$123 as prcdr_dt6:chararray,
	(chararray)$124 as icd_prcdr_cd7:chararray,
	(chararray)$125 as icd_prcdr_vrsn_cd7:chararray,
	(chararray)$126 as prcdr_dt7:chararray,
	(chararray)$127 as icd_prcdr_cd8:chararray,
	(chararray)$128 as icd_prcdr_vrsn_cd8:chararray,
	(chararray)$129 as prcdr_dt8:chararray,
	(chararray)$130 as icd_prcdr_cd9:chararray,
	(chararray)$131 as icd_prcdr_vrsn_cd9:chararray,
	(chararray)$132 as prcdr_dt9:chararray,
	(chararray)$133 as icd_prcdr_cd10:chararray,
	(chararray)$134 as icd_prcdr_vrsn_cd10:chararray,
	(chararray)$135 as prcdr_dt10:chararray,
	(chararray)$136 as icd_prcdr_cd11:chararray,
	(chararray)$137 as icd_prcdr_vrsn_cd11:chararray,
	(chararray)$138 as prcdr_dt11:chararray,
	(chararray)$139 as icd_prcdr_cd12:chararray,
	(chararray)$140 as icd_prcdr_vrsn_cd12:chararray,
	(chararray)$141 as prcdr_dt12:chararray,
	(chararray)$142 as icd_prcdr_cd13:chararray,
	(chararray)$143 as icd_prcdr_vrsn_cd13:chararray,
	(chararray)$144 as prcdr_dt13:chararray,
	(chararray)$145 as icd_prcdr_cd14:chararray,
	(chararray)$146 as icd_prcdr_vrsn_cd14:chararray,
	(chararray)$147 as prcdr_dt14:chararray,
	(chararray)$148 as icd_prcdr_cd15:chararray,
	(chararray)$149 as icd_prcdr_vrsn_cd15:chararray,
	(chararray)$150 as prcdr_dt15:chararray,
	(chararray)$151 as icd_prcdr_cd16:chararray,
	(chararray)$152 as icd_prcdr_vrsn_cd16:chararray,
	(chararray)$153 as prcdr_dt16:chararray,
	(chararray)$154 as icd_prcdr_cd17:chararray,
	(chararray)$155 as icd_prcdr_vrsn_cd17:chararray,
	(chararray)$156 as prcdr_dt17:chararray,
	(chararray)$157 as icd_prcdr_cd18:chararray,
	(chararray)$158 as icd_prcdr_vrsn_cd18:chararray,
	(chararray)$159 as prcdr_dt18:chararray,
	(chararray)$160 as icd_prcdr_cd19:chararray,
	(chararray)$161 as icd_prcdr_vrsn_cd19:chararray,
	(chararray)$162 as prcdr_dt19:chararray,
	(chararray)$163 as icd_prcdr_cd20:chararray,
	(chararray)$164 as icd_prcdr_vrsn_cd20:chararray,
	(chararray)$165 as prcdr_dt20:chararray,
	(chararray)$166 as icd_prcdr_cd21:chararray,
	(chararray)$167 as icd_prcdr_vrsn_cd21:chararray,
	(chararray)$168 as prcdr_dt21:chararray,
	(chararray)$169 as icd_prcdr_cd22:chararray,
	(chararray)$170 as icd_prcdr_vrsn_cd22:chararray,
	(chararray)$171 as prcdr_dt22:chararray,
	(chararray)$172 as icd_prcdr_cd23:chararray,
	(chararray)$173 as icd_prcdr_vrsn_cd23:chararray,
	(chararray)$174 as prcdr_dt23:chararray,
	(chararray)$175 as icd_prcdr_cd24:chararray,
	(chararray)$176 as icd_prcdr_vrsn_cd24:chararray,
	(chararray)$177 as prcdr_dt24:chararray,
	(chararray)$178 as icd_prcdr_cd25:chararray,
	(chararray)$179 as icd_prcdr_vrsn_cd25:chararray,
	(chararray)$180 as prcdr_dt25:chararray,
	(chararray)$181 as rsn_visit_cd1:chararray,
	(chararray)$182 as rsn_visit_vrsn_cd1:chararray,
	(chararray)$183 as rsn_visit_cd2:chararray,
	(chararray)$184 as rsn_visit_vrsn_cd2:chararray,
	(chararray)$185 as rsn_visit_cd3:chararray,
	(chararray)$186 as rsn_visit_vrsn_cd3:chararray,
	(chararray)$187 as ptb_ded:chararray,
	(chararray)$188 as ptb_coin:chararray,
	(chararray)$189 as prvdrpmt:chararray,
	(chararray)$190 as benepmt:chararray,
	(int)$191 as dob_dt:int,
	(chararray)$192 as gndr_cd:chararray,
	(chararray)$193 as race_cd:chararray,
	(chararray)$194 as cnty_cd:chararray,
	(chararray)$195 as state_cd:chararray,
	(chararray)$196 as cwf_bene_mdcr_stus_cd:chararray,
	(chararray)$197 as actioncd:chararray;

store ldsbeneficiaryInfo into '$out_table' using org.apache.hcatalog.pig.HCatStorer();
