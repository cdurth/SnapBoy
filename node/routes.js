module.exports = function(app) {
  // Insert routes below
  app.use('/api/app', require('./api/app'));
  app.use('/api/esp', require('./api/esp'));

  app.route('/')
  .get(function(req, res) {
    res.send('index');
  });
};