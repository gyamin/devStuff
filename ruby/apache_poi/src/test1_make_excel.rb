require 'java'

require './lib/java/poi-3.11/poi-3.11-20141221.jar'

module JavaIO
    include_package "java.io"
end

module PoiUserModel
    include_package "org.apache.poi.hssf.usermodel"
end

## simple excel file create
fos = JavaIO::FileOutputStream.new('excel/BookNew1.xls')
wb = PoiUserModel::HSSFWorkbook.new()
sheet = wb.createSheet("sheet_1")
row = sheet.createRow(0)
cell = row.createCell(0)
cell.setCellValue(1)
row.createCell(1).setCellValue("this is test")

wb.write(fos)
fos.close()

## simple excel file read
fis = JavaIO::FileInputStream.new('excel/Book1.xls')
wb = PoiUserModel::HSSFWorkbook.new(fis)
sheet = wb.getSheetAt(0)
row = sheet.getRow(2)
cell = row.getCell(2)
puts cell.getStringCellValue()
fis.close
