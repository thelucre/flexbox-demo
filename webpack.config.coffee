# Dependencies
webpack      = require 'webpack'
autoprefixer = require 'autoprefixer'
ExtractText  = require 'extract-text-webpack-plugin'
flexibility   = require 'postcss-flexibility'

# Autoprefixer config
# https://github.com/ai/browserslist#queries
autoprefixerBrowsers = [
	'last 2 versions'
	'ie >= 9'
]

config =
	resolve:
		root: "./src"

	entry:
		main: './src/main.coffee'

	output:
		path: './dist'
		filename: '[name].js'

	resolve:
		# Add coffee to the list of optional extensions
		extensions: ['', '.js', '.coffee', '.vue']

	module: {}

	# Hook up the flexibility postcss plugin
	postcss: -> plugins: [
		flexibility
		autoprefixer browsers: autoprefixerBrowsers
	]

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
		loader: ExtractText.extract [
			'css-loader?sourceMap'
			'postcss-loader'
			'stylus-loader?sourceMap'
			'prepend-string-loader?string[]=@require "definitions.styl";'
		].join('!')
	}

	# Jade #
	# Jade-loader reutrns a function. Apply-loader executes the function so we
	# get a string back.
	{ test: /\.jade$/, loader: 'apply-loader!jade-loader' }

	# Vue #
	{ test: /\.vue$/, loader: 'vue-loader' }
]

config.plugins = [
	new ExtractText '[name].css'
]

module.exports = config
