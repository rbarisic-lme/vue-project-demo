process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

const config = environment.toWebpackConfig()

const UglifyJsPlugin = require('uglifyjs-webpack-plugin')

config.set('devtool', 'none')

config.set('optimization.minimizer', [new UglifyJsPlugin({
  exclude: 'vendors'
})])


module.exports = config
