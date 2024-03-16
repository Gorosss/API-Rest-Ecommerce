import express, { json } from 'express' 
import { productsRouter } from './routes/products.js'
import { corsMiddleware } from './middlewares/cors.js'

const app = express()
app.use(json())
app.disable('x-powered-by') // Quitar el header de express


const PORT = process.env.PORT ?? 8989

app.use('/products', productsRouter)



app.listen(PORT, () => {
  console.log(`Server listening port http://localhost:${PORT}`)
})
