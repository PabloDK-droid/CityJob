const express = require('express');
const cors = require('cors'); // <--- 1. Importar
const app = express();
const pool = require('./db');

app.use(cors()); // <--- 2. Habilitar para todas las peticiones
app.use(express.json());

// Tu ruta de prueba
app.get('/test-db', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW()');
    res.json({ message: "Conexión exitosa", time: result.rows[0] });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.listen(3000, () => {
  console.log("Servidor corriendo en el puerto 3000");
});