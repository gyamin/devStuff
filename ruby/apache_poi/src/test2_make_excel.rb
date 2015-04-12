require 'java'

require './lib/java/poi-3.11/lib/commons-codec-1.9.jar'
require './lib/java/poi-3.11/lib/commons-logging-1.1.3.jar'
require './lib/java/poi-3.11/lib/junit-4.11.jar'
require './lib/java/poi-3.11/lib/log4j-1.2.17.jar'
require './lib/java/poi-3.11/ooxml-lib/xmlbeans-2.6.0.jar'
require './lib/java/poi-3.11/poi-3.11-20141221.jar'
require './lib/java/poi-3.11/poi-examples-3.11-20141221.jar'
require './lib/java/poi-3.11/poi-excelant-3.11-20141221.jar'
require './lib/java/poi-3.11/poi-ooxml-3.11-20141221.jar'
require './lib/java/poi-3.11/poi-ooxml-schemas-3.11-20141221.jar'
require './lib/java/poi-3.11/poi-scratchpad-3.11-20141221.jar'

java_import org.apache.poi.xssf.usermodel.XSSFCell;
java_import org.apache.poi.xssf.usermodel.XSSFRow;
java_import org.apache.poi.xssf.usermodel.XSSFSheet;
java_import org.apache.poi.xssf.usermodel.XSSFWorkbook;

java_import java.io.FileOutputStream;
java_import java.io.FileInputStream;

# simple excel file wrhite
wb = XSSFWorkbook.new()
sh = wb.createSheet("sheet_1")
row = sh.createRow(0)
cell = row.createCell(0)
cell.setCellValue(1)

row.createCell(1).setCellValue('this is test')

out = FileOutputStream.new("./excel/BookNew2.xlsx")
wb.write(out)
out.close()

# simple excel file read
fis = FileInputStream.new('./excel/Book2.xlsx')
wb = XSSFWorkbook.new(fis)
sheet = wb.getSheetAt(0)
row = sheet.getRow(2)
cell = row.getCell(2)
puts cell.getStringCellValue()
fis.close
