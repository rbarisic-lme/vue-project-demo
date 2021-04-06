const path = require('path')

module.exports = {
  // test: /\.s?css$/,
  test: /\.scss$/,
  use: [
    'vue-style-loader',
    'css-loader',
    'postcss-loader',
    'sass-loader',
    {
      loader: 'sass-resources-loader',
      options: {
        // Or array of paths
        resources: [
          path.resolve(__dirname, '..', '..', '..', 'app/assets/stylesheets/_variables.scss')
        ]
      },
    },
  ],
}