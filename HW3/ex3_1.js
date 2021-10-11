const express= require('express');
const app = express();
const port = 3000;

app.set('views', `${__dirname}/views`);
app.set('view engine', 'pug');

app.use(express.urlencoded({ extended : true }));

//GET, POST, PUT, DELETE
app.get('/', (req, res)=>{
    let obj = req.query; 
    let query = Object.keys(obj).map(k => `${k} : ${obj[k]}`).join('\n');
    res.send(query);
});

app.post('/', (req, res)=>{
    let body = req.body;
    let query = Object.keys(body).map(k => `${k} : ${body[k]}`).join('\n');   
    res.send(query);
});

app.put('/', (req, res)=>{
    let body = req.body;
    let query = Object.keys(body).map(k => `${k} : ${body[k]}`).join('\n');   
    res.send(query);
});

app.delete('/', (req, res)=>{
    let body = req.body;
    let query = Object.keys(body).map(k => `${k} : ${body[k]}`).join('\n');   
    res.send(query);
});

app.listen(port, ()=> console.log(`Server listening on port ${port}`));
