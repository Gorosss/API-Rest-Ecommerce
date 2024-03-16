import { randomUUID } from 'node:crypto'
import { readJSON } from '../../components/utils.js'

const products = readJSON('../json/products.json')

export class ProductModel {
  static async getAll ({ category }) {
    if (category) {
      return products.filter(
        product => product.category.some(g => g.toLowerCase() === category.toLowerCase())
      )
    }

    return products
  }

  static async getById ({ id }) {
    const product = products.find(product => product.id === id)
    return product
  }

  static async create ({ input }) {
    const newProduct = {
      id: randomUUID(),
      ...input
    }

    products.push(newProduct)

    return newProduct
  }

  static async delete ({ id }) {
    const productIndex = products.findIndex(product => product.id === id)
    if (productIndex === -1) return false

    products.splice(productIndex, 1)
    return true
  }

  static async update ({ id, input }) {
    const productIndex = products.findIndex(product => product.id === id)
    if (productIndex === -1) return false

    products[productIndex] = {
      ...products[productIndex],
      ...input
    }

    return products[productIndex]
  }
}
