module RubySyntaxUpgrader
	class UpgradeHashRocketSyntax
		include RubySyntaxUpgrader::RegexReplacer

		def initialize(source)
			@source = source
			raise 'Source file must be passed' unless source
		end

		def execute
			regex_replace(
				source: source,
				pattern: HASH_ROCKET_REGEX[:pattern],
				replacement: HASH_ROCKET_REGEX[:replacement]
			)
		end

	private

		RUBY_SYMBOL = /:([a-z0-9_]+)/
		MULTIPLE_TYPES_OR_SYMBOL = /(\s)?([a-zA-Z0-9_.'"{}\[\]\/]+|#{RUBY_SYMBOL})/

		HASH_ROCKET_REGEX = {
			pattern: Regexp.new(/#{RUBY_SYMBOL}\s?=>#{MULTIPLE_TYPES_OR_SYMBOL}/),
			replacement: '\1: \3'
		}

	end
end
