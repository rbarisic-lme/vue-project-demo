const path = require('path')
const _ = require('lodash')

const { environment } = require('@rails/webpacker')

const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const pug = require('./loaders/pug')

// const sassResourcesLoader = require('./loaders/sassResourcesLoader')

// prepend loaders
environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.loaders.prepend('pug', pug)
// environment.loaders.prepend('scss', sassResourcesLoader)
// environment.loaders.prepend('style!css!sass!sass-resources', sassResourcesLoader)

environment.config.merge({
  resolve: {
    alias: {
      '@':       path.resolve(__dirname, '..', '..', 'app/javascript/vue'),
      '@assets': path.resolve(__dirname, '..', '..', 'app/assets'),
      '@images': path.resolve(__dirname, '..', '..', 'app/assets/images'),    
    }
  }
})

module.exports = _.merge(environment)