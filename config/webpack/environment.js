const { environment } = require('@rails/webpacker')


//this code is to fix js from bootstrap elements
const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({
  $: 'jquery',
  Popper:['popper.js', 'default']
}))


module.exports = environment
