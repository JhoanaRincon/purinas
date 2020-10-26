//importa variables y conexion a base de datos 
const express = require('express');
const router = express.Router();
const pool = require("../../database");
const passport = require('passport');

//accede a la base de datos mostrando los productos en ella 
router.get('/catalogo',async (req, res) => {
    const productos= await pool.query("SELECT * FROM producto");
    console.log(productos);
    res.render('usuario/catalogo',{productos});
});



module.exports=router;

