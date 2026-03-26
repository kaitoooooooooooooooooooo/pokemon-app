const express = require('express');
const mongoose = require('mongoose');
const swaggerUI = require('swagger-ui-express');

const PokemonRoutes = require('./routes/pokemonRoutes');
const swaggerDocument = require("./swagger");

const app = express();
app.use(express.json());

app.use((req, res, next) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Access-Control-Allow-Methods", "GET");
    next();
});

app.use("/poke", swaggerUI.serve, swaggerUI.setup(swaggerDocument));

app.use("/pokemons", PokemonRoutes);

mongoose
    .connect("mongodb://localhost:27017/pokemon")
    .then(result => {
        console.log("server started");
        app.listen(3000);
    }).catch(err => console.log(err));


