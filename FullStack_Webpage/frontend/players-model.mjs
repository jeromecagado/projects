// Models for the Liverpool Player Collection

// Import dependencies.
import mongoose from 'mongoose';
import 'dotenv/config';

// Connect based on the .env file parameters.
mongoose.connect(
    process.env.MONGODB_CONNECT_STRING,
    { useNewUrlParser: true }
);
const db = mongoose.connection;

// Confirm that the database has connected and print a message in the console.
db.once("open", (err) => {
    if(err){
        res.status(500).json({ error: 'You have failed to connect to Mongodb server.' });
    } else  {
        console.log('Congratulations! You have connected to "project0" MongoDb Atlas Cluster using Mongoose.');
    }
});

// SCHEMA: Define the collection's schema.
const playersSchema = mongoose.Schema({
	name:    { type: String, required: true },
	jerseyNumber:     { type: Number, required: true },
	country: { type: String, required: true },
    dateJoined: {  type: Date, required: true, min: '1997-08-14', default: Date.now}
});

// Compile the model from the schema 
// by defining the collection name "Liverpool Players".
const players = mongoose.model('Liverpool Players', playersSchema);


// CREATE model *****************************************
const createPlayer = async (name, jerseyNumber, country, dateJoined) => {
    const player = new players({ 
        name: name, 
        jerseyNumber: jerseyNumber, 
        country: country,
        dateJoined: dateJoined
    });
    return player.save();
}


// RETRIEVE model *****************************************
// Retrieve based on a filter and return a promise.
const retrievePlayers = async () => {
    const query = players.find();
    return query.exec();
}

// RETRIEVE by ID
const retrievePlayerByID = async (_id) => {
    const query = players.findById({_id: _id});
    return query.exec();
}

// DELETE model based on _id  *****************************************
const deletePlayerById = async (_id) => {
    const result = await players.deleteOne({_id: _id});
    return result.deletedCount;
};


// UPDATE model *****************************************************
const updatePlayer = async (_id, name, jerseyNumber, country, dateJoined) => {
    const result = await players.replaceOne({_id: _id }, {
        name: name,
        jerseyNumber: jerseyNumber,
        country: country,
        dateJoined: dateJoined
    });
    return { 
        _id: _id, 
        name: name,
        jerseyNumber: jerseyNumber,
        country: country,
        dateJoined: dateJoined
    }
}

// EXPORT the variables for use in the controller file.
export { createPlayer, retrievePlayers, retrievePlayerByID, updatePlayer, deletePlayerById }
