const express = require('express');
const router = express.Router();
const {esEmpresa}= require('../../lib/auth');
//importa una conexion a db (en este caso llamado pool)
const pool = require('../../database');

router.get('/add',  (req, res) => {
    res.render('empresa/productos/add');
});

router.post('/add',esEmpresa,async(req, res) => {
    const { id, referencia, nombre, descripcioncorta, detalle, valor, palabrasclave, estado, categoria_id, marca_id } = req.body;
    const nuevoProducto = {
        id,
        referencia,
        nombre,
        descripcioncorta,
        detalle,
        valor,
        palabrasclave,
        estado,
        categoria_id,
        marca_id
    };
    await pool.query('INSERT INTO producto set ?', [nuevoProducto]);
    req.flash('success', '¡Producto agregado!');
    res.redirect('/empresa/productos');
});

router.get('/',esEmpresa, async (req, res) => {
    const lista_productos= await pool.query('SELECT * FROM producto');
   console.log(lista_productos);
    res.render('empresa/productos/list', {lista_productos});
});

router.get('/delete/:id',esEmpresa,  async (req,res) => {
    const {id} = req.params;
    await pool.query ('DELETE FROM producto WHERE id=?', [id]);
    req.flash('message', '¡Producto eliminado!');
    res.redirect('/empresa/productos');
});

router.get('/editar/:id',esEmpresa, async (req,res) => {
    const {id}= req.params;
    const producto = await pool.query ('SELECT * FROM producto WHERE id = ?', [id]);
    res.render('empresa/productos/editar', {producto: producto[0]} )
});

router.post('/editar/:id',esEmpresa,  async (req, res) => {
    const { id } = req.params;
    const {referencia, nombre, descripcioncorta, detalle, valor, palabrasclave, estado, categoria_id, marca_id } = req.body;
    
    const nuevoProducto = {
        referencia,
        nombre,
        descripcioncorta,
        detalle,
        valor,
        palabrasclave,
        estado,
        categoria_id,
        marca_id
    };
    
    await pool.query('UPDATE producto set ? WHERE id =?',[nuevoProducto, id] );
    req.flash('success', '¡Modificacion completa!');
    res.redirect('/empresa/productos');
});


module.exports = router;
