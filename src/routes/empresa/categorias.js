const express = require('express');
const router = express.Router();
const {esEmpresa}= require('../../lib/auth');

//importa una conexion adb (en este caso llamado pool)
const pool = require('../../database');

router.get('/',esEmpresa,async (req, res) => {
    const lista_categoria= await pool.query('SELECT * FROM categoria');
   console.log(lista_categoria);
    res.render('empresa/categoria/listac', {lista_categoria});
});

router.get('/add', esEmpresa, (req, res) => {
    res.render('empresa/categoria/add');
});

router.post('/add', esEmpresa, async(req, res) => {
    const { id, descripcion, estado } = req.body;
    const nuevaCategoria = {
        id,
        descripcion,
        estado,
    };
    await pool.query('INSERT INTO categoria set ?', [nuevaCategoria]);
    req.flash('success', '¡Categoria agregada!');
    res.redirect('/empresa/categoria');
});


router.get('/delete/:id', esEmpresa,async (req,res) => {
    const {id} = req.params;
    await pool.query ('DELETE FROM categoria WHERE id=?', [id]);
    req.flash('message', '¡Categoria eliminada!');
    res.redirect('/empresa/categoria');
});

router.get('/editarc/:id', esEmpresa,async (req,res) => {
    const {id}= req.params;
    const cat = await pool.query ('SELECT * FROM categoria WHERE id = ?', [id]);
    res.render('empresa/categoria/editarc', {cat: cat[0]} )
});

router.post('/editarc/:id', esEmpresa,async (req, res) => {
    const { id } = req.params;
    const { ide, descripcion, estado } = req.body;
    const nuevaCategoria = {
        id,
        descripcion,
        estado,
    };
    console.log('nuevaCategoria');
    await pool.query('UPDATE categoria set ? WHERE id =?',[nuevaCategoria, id] );
    req.flash('success', '¡Modificacion completa!');
    res.redirect('/empresa/categoria');
});

module.exports = router;