package com.bah.conversion.csv;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ticklerXCvsListOnly {

	static boolean debug = false; 
	public static void main(String[] args) {
		 
		try (BufferedReader br = new BufferedReader(new FileReader("C:\\thunder\\workspace\\jsonDataLake\\hive_src\\inp_clm_saf_lds_100_2010_header.csv")))
		{
 
			String sCurrentLine;
			int foundNumber;
			int newNumber;
			
			PrintWriter writer = new PrintWriter("C:\\thunder\\workspace\\jsonDataLake\\hive_src\\skelton_header.txt","UTF-8");
			
			while ((sCurrentLine = br.readLine()) != null) {
				if(debug) System.out.println(sCurrentLine);
/*

 *  Determine new line number 
 * 
 */
				String patternString;
/*
				if(sCurrentLine.contains("chararray")){
					patternString = "(chararray)";
					String typeStr = patternString;
					sCurrentLine = sCurrentLine.replaceFirst("(" + typeStr + ")", "");
					sCurrentLine = sCurrentLine.replaceFirst(":chararray,", ";");
					sCurrentLine = sCurrentLine.replaceFirst(":chararray;", ";");//last pig statement
					if(debug) System.out.println("-1- " + sCurrentLine);
					sCurrentLine = sCurrentLine.replaceAll("[()]", "");
					if(debug) System.out.println("-2a- " + sCurrentLine);

				}else if(sCurrentLine.contains("int")){
					patternString = "(int)";
					String typeStr = patternString;
					sCurrentLine = sCurrentLine.replaceFirst("(" + typeStr + ")", "");
					sCurrentLine = sCurrentLine.replaceFirst(":int,", ";");
					if(debug) System.out.println("-1- " + sCurrentLine);
					sCurrentLine = sCurrentLine.replaceAll("[()]", "");
					if(debug) System.out.println("-2a- " + sCurrentLine);
					
				}else if(sCurrentLine.contains("float")){
					patternString = "(float)";
					String typeStr = patternString;
					sCurrentLine = sCurrentLine.replaceFirst("(" + typeStr + ")", "");
					sCurrentLine = sCurrentLine.replaceFirst(":float,", ";");
					if(debug) System.out.println("-1- " + sCurrentLine);
					sCurrentLine = sCurrentLine.replaceAll("[()]", "");
					if(debug) System.out.println("-2a- " + sCurrentLine);

				}
*/
				sCurrentLine = sCurrentLine.replaceAll("[,]", "\n");
				sCurrentLine = sCurrentLine.replaceAll("[\"]", "");
				
/*				
				patternString = "-?\\d+";
				Pattern p = Pattern.compile(patternString);
				Matcher m = p.matcher(sCurrentLine);
				m.find();
				if(debug) System.out.println(m.group());
				String element = m.group();
				sCurrentLine = sCurrentLine.replaceFirst(element + " ", "");
				sCurrentLine = sCurrentLine.replaceAll("[$]", "");
				
				sCurrentLine = sCurrentLine.replaceAll("[;]", "").trim();
*/
				if(debug) System.out.println("-2- " + sCurrentLine);
				writer.println(sCurrentLine);
			
			}
			writer.close();
			System.out.println("...... DONE ....."); 
		} catch (IOException e) {
			e.printStackTrace();
		} 	
	}
}
