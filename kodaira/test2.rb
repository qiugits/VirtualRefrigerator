require 'csv'

#編集したcsvファイルを１つにまとめるcsvファイルを作る
#dbで使うデータが入っているファイル
all_data = File.open("all_data.csv", 'w')
nutr_data = File.open("nutr_data.csv", 'w')

#栄養素のファイルを読み込む
str = File.read("origin.csv")

str = str.gsub(/Tr|-/, '0')
str = str.gsub(/[()]/, '')

#配列に栄養素などを入れる
nutr = Array.new
nutr = CSV.parse(str)

#タンパク質
pro = 0
#脂質
lip = 0
#炭水化物
car = 0
#ビタミン
bit = 0
#無機物
ino = 0

#
sam = 0

#5大栄養素の計算
nutr.each do |row|
	bit = 0
	ino = 0

	item = row[3]
	pro = row[8].to_f
	lip = row[10].to_f
	car = row[16].to_f

	#タンパク質
	#35-41と46,51,52,54がμg
	for i in 35..41
		bit += row[i].to_f / 1000
	end
	
	for i in 42..55
		if i == 46 || i == 51 || i == 52 || i == 54
			bit += row[i].to_f / 1000
		else
			bit += row[i].to_f
		end
	end
	#ミネラル
	#31-34がμg
	for i in 22..30
		ino += row[i].to_f
	end

	for i in 31..34
		ino += row[i].to_f / 1000
	end

	sam = item,pro,lip,car,bit,ino

	sam_data = CSV.generate() do |csv|
		csv << sam
	end


	sam_data.each_line do |row|
		nutr_data << row
	end

end

nutr_data = CSV.generate() do |csv|
	nutr.each do |row|
		csv << row
	end
end

nutr_data.each_line do |row|
	all_data << row
end


#all_data.close
#nutr_data.close
