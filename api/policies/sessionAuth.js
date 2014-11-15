/**
 * sessionAuth
 *
 * @module      :: Policy
 * @description :: Simple policy to allow any authenticated user
 *                 Assumes that your login action in one of your controllers sets `req.session.authenticated = true;`
 * @docs        :: http://sailsjs.org/#!documentation/policies
 *
 */

var passport = require('passport');
var expressJwt = require('express-jwt');
var secret = 'z8dkQ58m';

module.exports = function(req, res, next) {

  if(req.isAuthenticated()){

    console.log("authenticated")

    return next();

  };

  expressJwt({secret: secret})(req, res, next);

};
