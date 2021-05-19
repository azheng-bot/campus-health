const webpack = require("webpack");
module.exports = {
  lintOnSave: false,
  productionSourceMap: false,
  devServer: {
    // 配置跨域
    proxy: {
      "/api": {
        target: "http://127.0.0.1:3000", // 设置请求接口
        changOrigin: true, // 允许跨域
        pathRewrite: {
          "^/api": "", // 忽略api前缀
        },
      },
    }, 
  },
  // css: {
  //   loaderOptions: {
  //     css: {},
  //     postcss: {
  //       plugins: [ 
  //         require('postcss-px2rem')({
  //           // 以设计稿750为例， 750 / 10 = 75
  //           remUnit: 192
  //         }),
  //       ]
  //     }
  //   }
  // },
};
