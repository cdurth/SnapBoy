var path = require('path'),
    rootPath = path.normalize(__dirname + '/..'),
    env = process.env.NODE_ENV || 'development';

var config = {
  development: {
    root: rootPath,
    app: {
      name: 'jobservice'
    },
    port: 3000,
    
  },

  test: {
    root: rootPath,
    app: {
      name: 'jobservice'
    },
    port: 3000,
    database: "mongodb://admin:baseball9@apollo.modulusmongo.net:27017/ajug7uwA"
  },

  production: {
    root: rootPath,
    app: {
      name: 'jobservice'
    },
    port: 3000,
  }
};

module.exports = config[env];