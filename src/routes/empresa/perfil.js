const express = require('express');
const router = express.Router();
const { esEmpresa } = require('../../lib/auth');

//importa una conexion a db (en este caso llamado pool)
const pool = require('../../database');

router.get('/',esEmpresa, async (req, res) => {
    const lista_empresa = await pool.query('SELECT * FROM empresa');
    console.log(lista_empresa);
    res.render('empresa/perfil/principal');
});


router.get('/editar',esEmpresa, async (req, res) => {
    const id= req.session.id_empresa;
    const empren = await pool.query('SELECT * FROM empresa WHERE id = ?', [id]);
    res.render('empresa/perfil/editar', { empren: empren[0] })
});

router.post('/editar',esEmpresa, async (req, res) => {
    const id= req.session.id_empresa;
    const { nombre, quienessomos, emailcontacto, direccion, telefonocontacto, facebook, twitter, instagram } = req.body;
    const nuevaEmpres = {
        nombre,
        quienessomos,
        emailcontacto,
        direccion,
        telefonocontacto,
        facebook,
        twitter,
        instagram
    };

    await pool.query('UPDATE empresa set ? WHERE id =?', [nuevaEmpres, id]);
    req.flash('success', '¡Modificacion completa!');
    res.redirect('/empresa');
});

module.exports = router;
