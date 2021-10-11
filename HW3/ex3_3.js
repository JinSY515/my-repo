const factorial = n =>{
    let x = 1;
    for(let i = 1; i<=n; i++){
        x *= i;
    }
    return x;
}
const express= require('express');
const app = express();
const port = 3000;

app.set('views', `${__dirname}/views`);
app.set('view engine', 'pug');

app.use(express.urlencoded({ extended : true }));

app.get('/factorial', (req, res)=>{
    res.redirect('/factorial/' + req.query.number);
});

app.get('/factorial/:number', (req, res)=>{
    const {number} = req.params;
    res.send(`${factorial(number)}`);
});

app.listen(port, ()=> console.log(`Server listening on port ${port}`));
