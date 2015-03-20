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
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.List;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.CSVWriter;

public class ResetCSV {
	public static final int HEADER_INDEX = 0;
	public static final String DEFAULT_EMPTY_VALUE = "";
	public static final String DEFAULT_TITLE_PREFIX = "UNTITLED_";

	public static void main(String[] args) {
		File csvFile = new File("C:\\DataLakeGrp\\csv\\2010\\100pct\\sda\\win32\\inp_clm_saf_lds_100_2010.csv");
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
		resetCsv();
		System.out.println("...... DONE ....."); 

		return;
	}
	
	
	private static void resetCsv() {
		System.out.println("...... reseting ....."); 
			
			try {
				//RandomAccessFile r = new RandomAccessFile(new File("C:\\DataLakeGrp\\csv\\2010\\100pct\\sda\\win32\\DataLake-Copy.csv"), "rw");
				//RandomAccessFile rtemp = new RandomAccessFile(new File("C:\\DataLakeGrp\\csv\\2010\\100pct\\sda\\win32\\DataLake.csv"), "rw");
				
				RandomAccessFile r = new RandomAccessFile(new File("C:\\DataLakeGrp\\csv\\2010\\100pct\\sda\\win32\\DataLake-Copy.csv"), "rw");
				RandomAccessFile rtemp = new RandomAccessFile(new File("C:\\DataLakeGrp\\csv\\2010\\100pct\\sda\\win32\\DataLake.csv"), "rw");

				long fileSize = r.length();
				System.out.println("size of file = " + fileSize);
				
				FileChannel sourceChannel = r.getChannel();
				FileChannel targetChannel = rtemp.getChannel();
				
				long position = 0;
				long count = sourceChannel.size();
				targetChannel.transferFrom(sourceChannel, position, count);
//				sourceChannel.transferTo(0, (fileSize - 0), targetChannel);
//				sourceChannel.truncate(0);
				r.seek(0);
				long newOffset = r.getFilePointer();
				
				targetChannel.position(0L);
				
//				sourceChannel.transferFrom(targetChannel, newOffset, (fileSize - 0));
				sourceChannel.close();
				targetChannel.close();
				r.close();
				rtemp.close();
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("-------- DONE with channeling ---------- ");
			
		}

}
