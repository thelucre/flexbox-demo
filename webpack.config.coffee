# Dependencies
webpack      = require 'webpack'
autoprefixer = require 'autoprefixer'
ExtractText  = require 'extract-text-webpack-plugin'

config =
	entry:
		main: './src/main.coffee'

	output:
		path: './dist'
		filename: '[name].js'

	resolve:
		# Add coffee to the list of optional extensions
		extensions: ['', '.js', '.coffee', '.vue']

	module: {}

config.module.loaders = [

	# Coffeescript #
	{ test: /\.coffee$/, loader: 'coffee-loader' }

	# Stylus #
	# This also uses the ExtractText to generate a new CSS file, rather
	# than writing script tags to the DOM. This was required to get the CSS
	# sourcemaps exporting dependably. Note the "postcss" loader, that is
	# adding autoprefixer in.
	{
		test: /\.styl$/
		loader: ExtractText.extract ['css-loader?sourceMap','postcss-loader','stylus-loader?sourceMap'].join('!')
	}
]

config.plugins = [
	new ExtractText '[name].css'
]

module.exports = config
