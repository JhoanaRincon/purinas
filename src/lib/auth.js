const auth = {};


auth.esEmpresa = (req, res, next) => {
    if (req.isAuthenticated()) {
        return next();
    }
    return res.redirect('/empresa/iniciar');
}

module.exports = auth;