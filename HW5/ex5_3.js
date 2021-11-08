const express = require("express");
const mysql = require("mysql2/promise");
const app = express();
const port = 3000;
const pool = mysql.createPool({
    host : 'localhost',
    port : 3306,
    user : 'kwebuser',
    password : 'kwebpw',
    database : 'kweb05',
});

const runQuery = async (pstmt, data) =>{
    const conn = await pool.getConnection();
    try{
        const sql = conn.format(pstmt, data);
        const [result] = await conn.query(sql);
        return result;
    } finally {
        conn.release();
    }
};


app.get('/fare', async (req, res) => {
    const { uid } = req.query;
    const sql = `select users.name, sum(round(distance * fare_rate / 1000, -2)) as fare
                 from trains join types on trains.type = types.id join tickets on tickets.train = trains.id join users on tickets.user = users.id 
                 where users.id = ?
                 `;
    const result = await runQuery(sql, [uid]);
    res.send(`Total fare of ${result[0].name} is ${result[0].fare} KRW.`)
});

app.get('/train/status', async(req, res) => {
    const { tid } = req.query;
    const sql = `select max_seats as max, count(types.id) as sold
                 from types join trains on trains.type = types.id join tickets on trains.id = tickets.train
                 where trains.id = ? `;
    const result = await runQuery(sql, [tid]);
    if(result[0].max <= result[0].sold) res.send(`Train ${tid} is sold out`);
    else res.send(`Train ${tid} is not sold out!`);
});
app.listen(port, () => console.log(`Server listening on the port ${port}`));
