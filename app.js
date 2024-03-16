import express, { json } from 'express' 
import { productsRouter } from './routes/products_route.js'
import { corsMiddleware } from './middlewares/cors_middleware.js'


const app = express()
app.use(corsMiddleware())
app.use(json())
app.disable('x-powered-by') // Quitar el header de express


const PORT = process.env.PORT ?? 8989

app.use('/products', productsRouter)



app.listen(PORT, () => {
  console.log(`Server listening port http://localhost:${PORT}`)
})
