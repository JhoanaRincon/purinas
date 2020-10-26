const express = require('express');
const router = express.Router();
const pool = require("../../database");
const passport = require('passport');
const { esEmpresa}= require('../../lib/auth');


//---- iniciar sesion

router.get('/iniciar', (req, res) => {
  res.render('empresa/auth/iniciar');
});

router.post('/iniciar', (req, res, next) => {
  passport.authenticate('iniciarsesion', {
  successRedirect: '/empresa/perfil',
  failureRedirect: '/empresa/iniciar',
  failureFlash: true
})(req, res, next)

});


router.get('/cerrar',esEmpresa,(req, res) => {
req.logOut();
res.redirect('/');
});

module.exports = router;