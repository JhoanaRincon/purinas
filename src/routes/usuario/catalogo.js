const express = require('express');
const router = express.Router();
const pool = require("../../database");
const passport = require('passport');


router.get('/catalogo',async (req, res) => {
    const productos= await pool.query("SELECT * FROM producto");
    console.log(productos);
    res.render('usuario/catalogo',{productos});
});



module.exports=router;

