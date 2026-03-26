const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const PokemonSchema = new Schema({
    id: {
        type: Number,
        required: true,
    },
    name: {
        type: String,
        required: true,
    },
    types: {
        type: Array,
        required: true,
    },
    abilities: {
        type: Array,
        required: true,
    },
    height: {
        type: Number,
        required: true,
    },
    weight: {
        type: Number,
        required: true,
    },
    baseExperience: {
        type: Number,
        required: true,
    },
    stats: {
        type: Object,
        required: true,
    },
    evolution: {
        type: Object,
        required: true,        
    },
    sprites: {
        type: Object,
        required: true,
    },
    metadata: {
        type: Object,
        required: true,
    },
});

module.exports = mongoose.model("Pokemon", PokemonSchema);