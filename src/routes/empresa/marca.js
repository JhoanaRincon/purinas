const express = require('express');
const router = express.Router();
const {esEmpresa}= require('../../lib/auth');

//importa una conexion adb (en este caso llamado pool)
const pool = require('../../database');

router.get('/',esEmpresa,async (req, res) => {
    const lista_marcas= await pool.query('SELECT * FROM marca');
    console.log(lista_marcas);
    res.render('empresa/marca/lista', {lista_marcas});
});

router.get('/add',esEmpresa,  (req, res) => {
    res.render('empresa/marca/add');
});

router.post('/add',esEmpresa, async(req, res) => {
    const { id, nombre, descripcion } = req.body;
    const nuevaMarca = {
        id,
        nombre,
        descripcion
    };
    
    await pool.query('INSERT INTO marca set ?', [nuevaMarca]);
    req.flash('success', '¡Marca agregada!');
    res.redirect('/empresa/marca');
});


router.get('/delete/:id',esEmpresa, async (req,res) => {
    const {id} = req.params;
    await pool.query ('DELETE FROM marca WHERE id=?', [id]);
    req.flash('message', '¡Marca eliminada!');
    res.redirect('/empresa/marca');
});

router.get('/editar/:id',esEmpresa,async (req,res) => {
    const {id}= req.params;
    const marcaN = await pool.query ('SELECT * FROM marca WHERE id = ?', [id]);
    res.render('/empresa/marca/editar', {marcaN: marcaN[0]} )
});

router.post('/editar/:id',esEmpresa, async (req, res) => {
    const { id } = req.params;
    const {nombre, descripcion } = req.body;
    const nuevaMarca = {
        nombre,
        descripcion
    };
    
    await pool.query('UPDATE marca set ? WHERE id = ?',[nuevaMarca, id] );
    req.flash('success', '¡Modificacion completa!');
    res.redirect('/empresa/marca');
});

module.exports = router;
