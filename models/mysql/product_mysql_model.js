
import mysql from 'mysql2/promise'

const DEFAULT_CONFIG = {
  host: 'localhost',
  user: 'root',
  port: 3306,
  password: '',
  database: 'ecommerce'
}
const connectionString = process.env.DATABASE_URL ?? DEFAULT_CONFIG

const connection = await mysql.createConnection(connectionString)

export class ProductModel {
  static async getAll({ category }) {

    if (category) {
      const lowerCaseCate = category.toLowerCase()

      const [categories] = await connection.query(
        'SELECT title, description, price, discountPercentage, rating, stock, brand, category, thumbnail, id FROM products WHERE LOWER(category) = ?;',
        [lowerCaseCate]
      )

      if (categories.length === 0) return []


      return categories
    }

    const [products] = await connection.query(
      'SELECT title, description, price, discountPercentage, rating, stock, brand, category, thumbnail, id FROM products;'
    )

    return products
  }

  static async getById({ id }) {
    const [products] = await connection.query(
      `SELECT title, description, price, discountPercentage, rating, stock, brand, category, thumbnail, id
        FROM products WHERE id = ?;`,
      [id]
    )

    if (products.length === 0) return null

    return products[0]
  }

  static async create({ input }) {
    const {
      title,
      description,
      price,
      discountPercentage,
      rating,
      stock,
      brand,
      category,
      thumbnail,
      images
    } = input



    const [uuidResult] = await connection.query('SELECT UUID() uuid;')
    const [{ uuid }] = uuidResult

    try {
      await connection.query(
        `INSERT INTO products (id, title, description, price, discountPercentage, rating, stock, brand, category, thumbnail, images)
          VALUES (UUID_TO_BIN("${uuid}"), ?, ?, ?, ?, ?, ?);`,
        [title, description, price, discountPercentage, rating, stock, brand, category, thumbnail, images]
      )
    } catch (e) {
      throw new Error('Error creating product in database.')
    }

    const [products] = await connection.query(
      `SELECT title, description, price, discountPercentage, rating, stock, brand, category, thumbnail, id
        FROM products WHERE id = UUID_TO_BIN(?);`,
      [uuid]
    )

    return products[0]
  }

  static async delete({ id }) {
  }

  static async update({ id, input }) {
  }
}
