const express = require('express');
const app = express();
const pool = require('./db'); // Tu archivo de conexión a PSQL
const cors = require('cors'); // 1. Importa cors

// En tu archivo del servidor (ej. index.js)
app.use(cors({
  origin: '*',
  methods: ['GET', 'POST', 'PUT', 'DELETE']
}));

// Esta es la ruta que mencionas, está bien que sea '/'
app.get('/', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW()'); // Prueba simple a la DB
    res.json({ message: 'Conexión exitosa con CityJob', time: result.rows[0] });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// ESTO ES LO QUE FALTA: Si no hay un listen, el proceso termina de inmediato
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Servidor de CityJob corriendo en http://localhost:${PORT}`);
});