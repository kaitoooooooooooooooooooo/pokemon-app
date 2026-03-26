const { set } = require("mongoose");
const Pokemon = require("../models/pokemon");
const { ObjectId } = require("mongodb");

exports.getPokemons = (req, res, next ) => {
    Pokemon.find().then(result => res.status(200).json(result));
};

exports.getPokemonsById = (req, res, next) => {
    if(ObjectId.isValid(req.params.id)){
        Pokemon.findOne({_id: req.params.id})
        .then(pokemon =>  {
            if(pokemon != null){
                res.status(200).json(pokemon)
            }else{
                res.status(500).json({error: "Aucun document trouvé"});
            }
        })
    }else{
        res.status(500).json({error: "L'id reçu est invalide"})
    }
};