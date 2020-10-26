const bcrypt =  require('bcrypt');
const helpers = {};

//para registrar
helpers.encriptar = async (password) => {
    const encrip = await bcrypt.genSalt(10);
    const encriptado = await bcrypt.hash(password, encrip);
   return encriptado;
};

//para logearse
helpers.logeo = async (password, savedPasword) => {
    try {
        return await bcrypt.compare(password, savedPasword);
    } catch (error) {
        console.log(error);
    }
   
};

module.exports = helpers;