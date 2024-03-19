import { InfoModel } from '../models/info_model.js'

export class InfoController {
  static async getInfo (req, res) {
    const info = await InfoModel.getInfo()
    res.json(info)
  }
}