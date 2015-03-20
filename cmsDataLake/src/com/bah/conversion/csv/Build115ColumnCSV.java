package com.bah.conversion.csv;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.CSVWriter;

public class Build115ColumnCSV {
	public static final int HEADER_INDEX = 0;
	public static final String DEFAULT_EMPTY_VALUE = "";
	public static final String DEFAULT_TITLE_PREFIX = "UNTITLED_";

	public static void main(String[] args) {
//		File csvFile = new File("C:\\DataLakeGrp\\csv\\2010\\100pct\\sda\\win32\\inp_clm_saf_lds_100_2010.csv");
		File csvFile = new File("C:\\DataLakeGrp\\csv\\2010\\100pct\\sda\\win32\\DataLake.csv");
		try {
			preprocessCSVFile(csvFile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	/*
	 * Add default title to the untitled columns
	 */
//	private static File preprocessCSVFile(File file) throws IOException {
	private static void preprocessCSVFile(File file) throws IOException {
		trucateColumnsCSVFile(file);

		System.out.println("...... DONE ....."); 

		return;
	}
	
/*
 * to capture the array size of a data row for the number of headers needed
 */
	private static void trucateColumnsCSVFile(File file) throws IOException {
		System.out.println("...... readAllRowsFromCSVFile ....."); 

		BufferedReader br = new BufferedReader(new FileReader("C:\\thunder\\workspace\\jsonDataLake\\hive_src\\recordcatcher.csv"));
		

		PrintWriter writer = new PrintWriter("C:\\thunder\\workspace\\jsonDataLake\\hive_src\\recordcatcherProjectX.csv","UTF-8");

		List<String> lines = new ArrayList<>();
		String line = null;

		int iter = 0;
		while ((line = br.readLine()) != null) {
		    lines.add(line);
		    if(iter > 101) break;
		    iter++;
		}

//break for columns
		for(String lineWrite : lines){
			String newlineWrite = "";
			for(int i = 0; i < 115; i++){
				if(i > 0){
					newlineWrite = newlineWrite + "," + lineWrite.split(",")[i];
				}else{
					newlineWrite = lineWrite.split(",")[i];
				}
			}
			System.out.println(newlineWrite);
			writer.println(newlineWrite);
		}

		writer.close();
	}


}
