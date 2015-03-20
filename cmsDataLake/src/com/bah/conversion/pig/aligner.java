package com.bah.conversion.pig;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class aligner {

	static PrintWriter writer;

	public static void main(String[] args) {

		
	try (BufferedReader br = new BufferedReader(new FileReader("C:\\thunder\\workspace\\jsonDataLake\\pig_src\\factoryJson100LdsData.java"))){

//		BufferedReader recordcatcherBR = new BufferedReader(new FileReader("C:\\thunder\\workspace\\jsonDataLake\\pig_src\\recordcatcher.txt"));
		writer = new PrintWriter("C:\\thunder\\workspace\\jsonDataLake\\pig_src\\JSON100LdsData.java","UTF-8");

		List<String> lines = new ArrayList<>();
		String line = null;
		while ((line = br.readLine()) != null) {
		    lines.add(line);
//		    if(iter > 3) break;
//		    iter++;
		}

		
		Scanner scanner = new Scanner(new File("C:\\thunder\\workspace\\jsonDataLake\\pig_src\\recordcatcher.txt")); 
		//Set the delimiter used in file 
		scanner.useDelimiter(","); 
		int index = 0;
		String sCurrentLine = null;
		while (scanner.hasNext()) 
		{ 
			// pairing the java to actual values
			
//			System.out.print(lines.get(index) + " // " + scanner.next());
			sCurrentLine = lines.get(index) + " // " + scanner.next();
			writer.println(sCurrentLine);
			index++;
// 			System.out.print(scanner.next() + "|"); 

		
		} 
		scanner.close(); 
		
	}catch (IOException e) {
		e.printStackTrace();
	}finally{
		if(writer != null)
			writer.close();
	}
	System.out.println("...... DONE ....."); 

	}

}
