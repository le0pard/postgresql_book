const path = require('path')
const browserlist = require('./browserslist.config')

module.exports = function (api) {
  var validEnv = ['development', 'test', 'production']
  var currentEnv = api.env()
  var isDevelopmentEnv = api.env('development')
  var isTestEnv = api.env('test')

  if (!validEnv.includes(currentEnv)) {
    throw new Error(
      'Please specify a valid `NODE_ENV` or ' +
      '`BABEL_ENV` environment variables. Valid values are "development", ' +
      '"test", and "production". Instead, received: ' +
      JSON.stringify(currentEnv) +
      '.'
    )
  }

  return {
    presets: [
      [
        '@babel/preset-env',
        {
          targets: browserlist,
          forceAllTransforms: true,
          modules: (isTestEnv ? 'auto' : false),
          useBuiltIns: 'entry',
          corejs: 3,
          exclude: ['transform-typeof-symbol']
        }
      ]
    ],
    plugins: [
      [
        '@babel/plugin-transform-runtime',
        {
          helpers: false,
          regenerator: true,
          corejs: false
        }
      ]
    ]
  }
}
