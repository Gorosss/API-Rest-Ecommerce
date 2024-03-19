import { Router } from 'express'

import { InfoController } from '../controllers/info_controller.js'

export const infoRouter = Router()

infoRouter.get('/', InfoController.getInfo)