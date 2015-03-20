package com.bah.conversion.pig;

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
			 
			try (BufferedReader br = new BufferedReader(new FileReader("C:\\DataLakeGrp\\csv\\2010\\100pct\\sda\\win32\\DataLake.csv")))
			
//			try (BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\558514\\git\\cmsQIO\\dataFiles\\enrollmentData2010.csv")))
//			try (BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\558514\\git\\cmsQIO\\dataFiles\\partialLDSClaims.csv")))
//			try (BufferedReader br = new BufferedReader(new FileReader("C:\\DataLakeGrp\\denom\\csv\\2010\\100pct\\sda\\win32\\den_saf_lds_100_2010.csv")))
//			try (BufferedReader br = new BufferedReader(new FileReader("C:\\thunder\\workspace\\jsonDataLake\\pig_src\\JSON100LdsData.csv")))
//			try (BufferedReader br = new BufferedReader(new FileReader("C:\\thunder\\workspace\\jsonDataLake\\pig_src\\JSON100LdsData.json")))
//			try (BufferedReader br = new BufferedReader(new FileReader("C:\\DataLakeGrp\\xproject_csv\\inp_clm_saf_lds_100_2010_header.csv")))
			{

				writer = new PrintWriter("C:\\thunder\\workspace\\jsonDataLake\\pig_src\\recordcatcher.txt","UTF-8");

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
