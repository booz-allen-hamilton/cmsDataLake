package com.bah.conversion.csv;

	import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

	public class ReadCsvSingleRow {

		static boolean debug = false;
		static PrintWriter writer;
		
		public static void main(String[] args) {
			 
//			try (BufferedReader br = new BufferedReader(new FileReader("C:\\DataLakeGrp\\csv\\2010\\100pct\\sda\\win32\\DataLake.csv")))
//			try (BufferedReader br = new BufferedReader(new FileReader("C:\\thunder\\workspace\\jsonDataLake\\hive_src\\recordcatcher.csv")))
			try (BufferedReader br = new BufferedReader(new FileReader("C:\\thunder\\workspace\\jsonDataLake\\hive_src\\recordcatcherProjectX.csv")))
			{

				writer = new PrintWriter("C:\\thunder\\workspace\\jsonDataLake\\hive_src\\tmpFile.txt","UTF-8");

				List<String> lines = new ArrayList<>();
				String line = null;

				int iter = 0;
				while ((line = br.readLine()) != null) {
				    lines.add(line);
				    if(iter > 3) break;
				    iter++;
				}

				for(String lineWrite : lines){
					System.out.println(lineWrite);
//					writer.println(lineWrite);
				}

				writer.println(lines.get(0));


			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				if(writer != null)
					writer.close();
			}
			System.out.println("...... DONE ....."); 

		}

}
