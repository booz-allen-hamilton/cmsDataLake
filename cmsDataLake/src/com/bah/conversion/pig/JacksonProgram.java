package com.bah.conversion.pig;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.databind.MappingIterator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.csv.CsvMapper;
import com.fasterxml.jackson.dataformat.csv.CsvSchema;

public class JacksonProgram {

    public static void main(String[] args) throws Exception {
/*
 * 
 * Java Heap Error
 *
 */
    	File input = new File("C:\\DataLakeGrp\\csv\\2010\\100pct\\sda\\win32\\DataLake.csv");
        File output = new File("C:\\DataLakeGrp\\csv\\2010\\100pct\\sda\\win32\\DataLake.json");

/*
    	File input = new File("C:\\thunder\\workspace\\jsonDataLake\\pig_src\\JSON100LdsData.csv");
		File output = new File("C:\\thunder\\workspace\\jsonDataLake\\pig_src\\JSON100LdsData.json");
*/        
        List<Map<?, ?>> data = readObjectsFromCsv(input);
        writeAsJson(data, output);
        
        System.out.println("------ DONE ------");
    }

    public static List<Map<?, ?>> readObjectsFromCsv(File file) throws IOException {
        CsvSchema bootstrap = CsvSchema.emptySchema().withHeader();
        CsvMapper csvMapper = new CsvMapper();
        MappingIterator<Map<?, ?>> mappingIterator = csvMapper.reader(Map.class).with(bootstrap).readValues(file);

        return mappingIterator.readAll();
    }

    public static void writeAsJson(List<Map<?, ?>> data, File file) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(file, data);
    }
}