const jwt = require('jsonwebtoken');

const auth = async(req, res, next) => {
    try {
        const token = req.header("x-auth-token"); // Get the token from header if it exists
        if (!token) return res.status(401).send({ msg: "No Token Provided" }); // If no token send a 401 response with message No Token
        const verified = jwt.verify(token, "passwordKey");
        if (!verified) return res.status(401).json({ msg: "Token verification failed" });
        
        req.user = verified.id;
        req.token = token;
        next(); //next api
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

module.exports = auth; 