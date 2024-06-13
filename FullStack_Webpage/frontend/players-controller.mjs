// Controllers for the Liverpool Player Collection

import 'dotenv/config';
import express from 'express';
import * as players from './players-model.mjs';

const PORT = process.env.PORT;
const app = express();
app.use(express.json());  // REST needs JSON MIME type.


// CREATE controller ******************************************
app.post ('/players', (req,res) => { 
    players.createPlayer(
        req.body.name, 
        req.body.jerseyNumber, 
        req.body.country,
        req.body.dateJoined
        )
        .then(players => {
            res.status(201).json(players);
        })
        .catch(error => {
            console.log(error);
            res.status(400).json({ error: 'Bad request. You are not connected to the Mongodb server. The server cannot create a player.' });
        });
});


// RETRIEVE controller ****************************************************
app.get('/players', (req, res) => {
    players.retrievePlayers()
        .then(players => { 
            if (players !== null) {
                res.json(players);
            } else {
                res.status(404).json({ Error: 'The player you requested is not a Liverpool player.' });
            }         
         })
        .catch(error => {
            console.log(error);
            res.status(400).json({ Error: 'Bad request. You are not connected to the Mongodb server. The server cannot retrieve players.' });
        });
});


// RETRIEVE by ID controller
app.get('/players/:_id', (req, res) => {
    players.retrievePlayerByID(req.params._id)
    .then(players => { 
        if (players !== null) {
            res.json(players);
        } else {
            res.status(404).json({ Error: 'No Liverpool player can be retrieved by that ID.' });
        }         
     })
    .catch(error => {
        console.log(error);
        res.status(400).json({ Error: 'Bad request. You are not connected to the Mongodb server. The server cannot retrieve a player by that ID.' });
    });

});


// UPDATE controller ************************************
app.put('/players/:_id', (req, res) => {
    players.updatePlayer(
        req.params._id, 
        req.body.name, 
        req.body.jerseyNumber, 
        req.body.country,
        req.body.dateJoined
    )
    .then(players => {
        res.json(players);
    })
    .catch(error => {
        console.log(error);
        res.status(400).json({ error: 'Bad request. You are not connected to the Mongodb server. The server cannot update a player.' });
    });
});


// DELETE Controller ******************************
app.delete('/players/:_id', (req, res) => {
    players.deletePlayerById(req.params._id)
        .then(deletedCount => {
            if (deletedCount === 1) {
                res.status(200).send({ Success: 'You have deleted a Liverpool player.' });
            } else {
                res.status(404).json({ Error: 'Cannot delete the player. That player ID does not exist!' });
            }
        })
        .catch(error => {
            console.error(error);
            res.send({ error: 'Bad request. You are not connected to the Mongodb server. The server cannot find the player.' });
        });
});


app.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}...`);
});
