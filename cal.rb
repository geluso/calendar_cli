require 'pry'

$days_in_month = {
	"January" =>  31,
	"February" =>  28,
	"March" =>  31,
	"April" =>  30,
	"May" =>  31,
	"June" =>  30,
	"July" =>  31,
	"August" =>  31,
	"September" =>  30,
	"October" =>  31,
	"November" =>  30,
	"December" =>  31,
}

$weekdays = [
	"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday",
	"Friday", "Saturday"
]

$format = <<~TEXT
     July 2019        
Su Mo Tu We Th Fr Sa  
    1  2  3  4  5  6  
 7  8  9 10 11 12 13  
14 15 16 17 18 19 20  
21 22 23 24 25 26 27  
28 29 30 31           
TEXT

def get_days_in_month(month)
	$days_in_month[month]
end

def format_digit(n)
	if n < 10
		return " #{n}"
	end
	n.to_s
end

def get_weeks(month)
	start_day = "Monday"
	start_index = $weekdays.index(start_day)

	weeks = []
	week = []
	while week.length < start_index
		week << '  '
	end

	day = 1
	days_in_month = get_days_in_month(month)
	while day <= days_in_month
		week << format_digit(day)
		if week.length % 7 == 0
			weeks << week.join(' ')
			week = []
		end
		
		day += 1
	end
	weeks
end

def print_header(month, year)
	title = "#{month} #{year}"

	weekdays = "Su Mo Tu We Th Fr Sa"

	width = weekdays.length
	header_width = title.length
	left_pad = (width - header_width) / 2

	header = " " * left_pad + title

	puts header
	puts weekdays
end

def print_month
	month = "July"
	year = "2019"

	print_header(month, year)
	weeks = get_weeks(month)
	puts weeks.join("\n")
end

print_month
