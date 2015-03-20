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

public class RenewAdd115HeaderCSV {
	public static final int HEADER_INDEX = 0;
	public static final String DEFAULT_EMPTY_VALUE = "";
	public static final String DEFAULT_TITLE_PREFIX = "UNTITLED_";

	public static void main(String[] args) {
		
		File csvFile = new File("C:\\thunder\\workspace\\jsonDataLake\\hive_src\\recordcatcherProjectX.csv");
		
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
	private static void preprocessCSVFile(File file) throws IOException {
		List<String[]> rows = readAllRowsFromCSVFile(file);
		titleHeader(rows);
		
		File newcsvFile = new File("C:\\thunder\\workspace\\jsonDataLake\\hive_src\\recordcatcherProjectX.csv");
		writeRowToCSVFile(newcsvFile, rows);

		System.out.println("...... DONE ....."); 

		return;
	}
	
/*
 * to capture the array size of a data row for the number of headers needed
 */
	private static List<String[]> readAllRowsFromCSVFile(File file) throws IOException {
		System.out.println("...... readAllRowsFromCSVFile ....."); 

		BufferedReader br = new BufferedReader(new FileReader("C:\\thunder\\workspace\\jsonDataLake\\hive_src\\recordcatcherProjectX.csv"));
		

		PrintWriter writer = new PrintWriter("C:\\thunder\\workspace\\jsonDataLake\\hive_src\\csvcatcher.csv","UTF-8");

		List<String> lines = new ArrayList<>();
		String line = null;

		int iter = 0;
		while ((line = br.readLine()) != null) {
		    lines.add(line);
//		    if(iter > 3) break;
//		    iter++;
		}

		
		for(String lineWrite : lines){
//			System.out.println(lineWrite);
			writer.println(lineWrite);
		}

		writer.close();

		File adjCSVFile = new File("C:\\thunder\\workspace\\jsonDataLake\\hive_src\\csvcatcher.csv");
		
		FileReader fileReader = new FileReader(adjCSVFile);
		CSVReader csvReader = new CSVReader(fileReader);
		List<String[]> rows = csvReader.readAll();
		csvReader.close();
		return rows;
	}

	private static void writeRowToCSVFile(File file, List<String[]> rows) throws IOException{
		System.out.println("...... writeRowToCSVFile ....."); 
		writeRowToCSVFile(file, rows, 0);
	}

	private static void writeRowToCSVFile(File file, List<String[]> rows, int columnSize) 
			throws IOException {
			CSVWriter csvWriter = new CSVWriter(new FileWriter(file));
			csvWriter.writeAll(rows);
			csvWriter.close();
		}


	
	private static void titleHeader(List<String[]> rows) {
		System.out.println("...... titleHeader ....."); 
		int numberOfUntitledColumn = 0;
		List<String> headerlines = new ArrayList<>();
		String[] header = new String[rows.get(HEADER_INDEX).length];
		
		try (BufferedReader brList = new BufferedReader(new FileReader("C:\\thunder\\workspace\\jsonDataLake\\hive_src\\skelton_header115.txt"))){

			String columnline = null;
			while ((columnline = brList.readLine()) != null) {
				headerlines.add(columnline);
			}
			brList.close();
		}catch (IOException ex){
			ex.printStackTrace();
		}
		if (headerlines.size() > 0) {
//			String[] header = new String[rows.get(HEADER_INDEX).length];
			if(headerlines.isEmpty()){
				for (int i = 0; i < header.length; i++) {
					/* Add default title if the column is an empty string */
					header[i] = DEFAULT_TITLE_PREFIX + String.valueOf(numberOfUntitledColumn++);
				}
			}else{
				for (int i = 0; i < header.length; i++) {
					/* Add default title if the column is an empty string */
					try{
						header[i] = headerlines.get(i);
					}catch(IndexOutOfBoundsException iex){
						break;
					}
				}
				
			}
			rows.add(HEADER_INDEX, header);
			//convert to bytearray
			
			
			final ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
			ObjectOutputStream objectOutputStream;
			try {
				objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
				objectOutputStream.writeObject(header);
				objectOutputStream.flush();
				objectOutputStream.close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			final byte[] byteArray = byteArrayOutputStream.toByteArray();
			
			try {
				RandomAccessFile r = new RandomAccessFile(new File("C:\\thunder\\workspace\\jsonDataLake\\hive_src\\recordcatcherProjectX.csv"), "rw");
				
				
				RandomAccessFile rtemp = new RandomAccessFile(new File("C:\\thunder\\workspace\\jsonDataLake\\hive_src\\recordcatcherProjectX.csv" + "~"), "rw");
				
				long fileSize = r.length();
				System.out.println("size of file = " + fileSize);
				
				FileChannel sourceChannel = r.getChannel();
				FileChannel targetChannel = rtemp.getChannel();
				
				sourceChannel.transferTo(0, (fileSize - 0), targetChannel);
				sourceChannel.truncate(0);
				r.seek(0);
				String headerStr = ""; 
				int intrpos = 0;
				for(String headcol: header){
					if(intrpos == 0 ){
						headerStr = headcol;
					}else{
						headerStr = headerStr + "," + headcol;
					}
					intrpos++;
				}
				
				final byte[] headerBytes = headerStr.getBytes(Charset.forName("ISO-8859-1"));

				
				r.write(headerBytes);
				r.writeChars("\n");

				
				long newOffset = r.getFilePointer();
				targetChannel.position(0L);

				fileSize = rtemp.length();
				
				System.out.println("\nfileSize = " + fileSize);
				
				sourceChannel.transferFrom(targetChannel, newOffset, (fileSize - 0));

				fileSize = r.length();
				System.out.println("\nAfter fileSize = " + fileSize);

				
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

}
