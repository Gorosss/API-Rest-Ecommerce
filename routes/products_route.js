import { Router } from 'express'

import { ProductController } from '../controllers/products_controller.js'

export const productsRouter = Router()

productsRouter.get('/', ProductController.getAll)
productsRouter.post('/', ProductController.create)
productsRouter.get('/:id', ProductController.getById)
productsRouter.delete('/:id', ProductController.delete)
productsRouter.patch('/:id', ProductController.update)
