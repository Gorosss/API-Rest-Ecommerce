import { readJSON } from '../components/utils.js'

const info = readJSON('../json/info.json')

export class InfoModel {
  static async getInfo() {
    return info
  }
}