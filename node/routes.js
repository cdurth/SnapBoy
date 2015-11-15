module.exports = function(app) {
  
  app.all('*', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With");
  next();
 });
 
  // Insert routes below
  app.use('/api/app', require('./api/app'));
  app.use('/api/esp', require('./api/esp'));

  app.route('/')
  .get(function(req, res) {
    res.send('index');
  });
};