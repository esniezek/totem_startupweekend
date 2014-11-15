var expressJwt = require('express-jwt');
var secret = 'z8dkQ58m';

module.exports = expressJwt({secret: secret});
