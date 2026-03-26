const YAML = require("yamljs") ;
const path = require("path");

const swaggerDocument = YAML.load(path.join(__dirname, "swagger.yaml"));

module.exports = swaggerDocument;