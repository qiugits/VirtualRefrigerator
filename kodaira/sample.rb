require 'roo'

xslx = Roo::Spreadsheet.open("test.xlsx")
printt(xslx.cell(2,1))

#i: 行
i = 1
#s: 列
s = 1

while i < 10
	print(xslx.cell(i,s),"\n")
	i += 1
	s += 1
	#Book.create(isbn: row[0], name: row[1], title: row[2])
end