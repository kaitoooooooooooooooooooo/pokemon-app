const express = require('express');
const router = express.Router();

const pokemonController = require("../controller/pokemonController");

router.get("/", pokemonController.getPokemons);
router.get("/:id", pokemonController.getPokemonsById);

module.exports = router;