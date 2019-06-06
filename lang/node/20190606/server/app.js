const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.send('Hello World!'))


// POST method route
app.get('/index', function (req, res) {
    var data = {};
    data.name = req.query.name;
    res.render("index.ejs", data);
})

// POST method route
app.post('/index', function (req, res) {
    data = {};
    console.log(req.body);
    data.name = req.body.test;
    res.render("index.ejs", data);
})

app.listen(port, () => console.log(`Example app listening on port ${port}!`))