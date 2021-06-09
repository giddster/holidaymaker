module.exports = {
    devServer: {
      proxy: {
        "/api": {
          target: 'http://localhost:56898',
          changeOrigin: true
        },
        "/userapi": {
          target: 'http://localhost:3070/', // vi vet inte routen för Identity-APIet än, denna porten måste ändras efter vad scaffolden väljer
          pathRewrite: {'^/userapi' : '/api2'}
        },
        
      }
    }
  }

//http://localhost:56898/Account/Login?ReturnUrl=%2Fapi%2FCustomers%2FUserProfile