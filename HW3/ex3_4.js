const express = require('express');
const port = 3000;
const app = express();
app.use(express.urlencoded({ extended : true }));

app.set('views', `${__dirname}/views`);
app.set('view engine', 'pug');

app.get('/',(req, res)=>{
    res.render("login");
});

app.post('/login', (req,res)=>{
    let body = req.body;
    let query = Object.keys(body).map(k => `${k} : ${body[k]}`).join('\n');   
    res.send(query);
});
app.listen(port, ()=> console.log(`Server listening on port ${port}`));
