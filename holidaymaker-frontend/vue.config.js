module.exports = {
    devServer: {
      proxy: {
        '^/api': {
          target: 'http://localhost:44385',
          changeOrigin: true
        },
        "/userapi": {
          target: 'http://localhost:3070/', // vi vet inte routen för Identity-APIet än, denna porten måste ändras efter vad scaffolden väljer
          pathRewrite: {'^/userapi' : '/api2'}
        }
      }
    }
  }