const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const helpers = require('../lib/helpers');
const pool = require('../database');

//---- Empresa ----//

//logear usuario
passport.use('iniciarsesion', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async (req, username, password, done) => {
    console.log('nada mal');
    const rows = await pool.query('SELECT id, CAST(aes_decrypt(clave,'+password+')AS CHAR(200))clave FROM empresa WHERE username = ?', [username]);

    //Validar si encontró 1 solo registro
    if (rows.length < 1) {
        done(null, false, req.flash('message', 'La empresa no existe'));
    }
    if (rows.length > 1) {
        done(null, false, req.flash('message', 'Existe más de una empresa'));
    }

    const user = rows[0];
    //Validar si las contraseñas coinciden
    console.log("de la db:",user.clave," lo escrito:",password);
    if(user.clave!=password){
        done(null, false, req.flash('message', 'Contraseña incorrecta'));
    }
    req.session.id_empresa=user.id;
    done(null, user);
}));

// ---- Comun ----
passport.serializeUser((user, done) => {
    console.log(user.id);
    done(null, user.id);

});

passport.deserializeUser(async (id, done) => {
    const rows = await pool.query('SELECT * FROM empresa WHERE id  = ?', [id]);
    done(null, rows[0]);
});
