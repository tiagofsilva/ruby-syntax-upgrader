require_relative 'ruby_syntax_upgrader'

module RubySyntaxUpgrader::RegexReplacer

	def regex_replace(filepath:, pattern:, replacement:)
		IO.write(filepath, File.open(filepath) do |f|
			f.read.gsub(pattern, replacement)
		end )
	end

end