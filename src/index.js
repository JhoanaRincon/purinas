const express = require('express');
const morgan = require('morgan');
const path = require('path');
const exphbs = require('express-handlebars');
const session = require('express-session');
const validator = require('express-validator');
const passport = require('passport');
const flash = require('connect-flash');
const MySQLStore = require('express-mysql-session')(session);
const bodyParser = require('body-parser');



const { database } = require('./keys');

// Intializations
const app = express();
require('./lib/passport');

// Settings
app.set('port', process.env.PORT || 4000);
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/helpers')
    
}))
app.set('view engine', '.hbs');

app.use(session({
    secret: 'purinasmysqlnodemysql',
    resave: false,
    saveUninitialized: false,
    store: new MySQLStore(database)
}));

// Middlewares
app.use(flash());
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());


app.use(passport.initialize());
app.use(passport.session());
app.use(validator());


// Global variables
app.use((req, res, next) => {
    app.locals.message = req.flash('message');
    app.locals.success = req.flash('success');
    app.locals.user = req.user;
    next();
});

//routes
app.use(require('./routes/index.js'));

//--empresa
app.use('/empresa',require('./routes/empresa/authentication.js'));
app.use('/empresa/productos', require('./routes/empresa/productos.js'));
app.use('/empresa/marca', require('./routes/empresa/marca.js'));
app.use('/empresa/categoria', require('./routes/empresa/categorias.js'));
app.use('/empresa/perfil', require('./routes/empresa/perfil.js'));

//--usuarios
app.use('/usuario', require('./routes/usuario/catalogo.js'));

//public
app.use(express.static(path.join(__dirname, 'public')));

//starting the server
app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
});
