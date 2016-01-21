
require 'nokogiri'
require 'pp'
require 'active_support/core_ext/hash/conversions'

class ParseFile

	def initialize(path)

		puts "init path #{path}"

		@orgFile = path
		@xmlData = nil

	end

	def getTemplate

		{
			'#EXTINF' => '',
			'group-title' => '',
			'tvg-logo' =>  '',
			'label' =>  "",
			'link' => ''
		}

	end

	def readXmlFile
		puts "trying open file #{@orgFile}"
		@xmlData = File.open(@orgFile) { |f| 	Nokogiri::XML(f) }
		@hashData = Hash.from_xml(@xmlData.to_s)

	end


	def doParse

		puts "Staring parse data"
		@hashData['items']['channel'].each do |d|
			pp d
			tmp = @getTemplate

			tmp['#EXTINF'] = 0
			tmp['group-title'] = 'Edem-test'
			tmp['tvg-logo'] = 'Edem-test'
			####netot file

		end
	end

	def run

		readXmlFile
		doParse

	end



end


ParseFile.new('nStream.xml').run
