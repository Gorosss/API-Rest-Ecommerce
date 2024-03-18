
import mysql from 'mysql2/promise'

import dotenv from 'dotenv';
dotenv.config();


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
    let query = `SELECT p.id, p.title, p.description, p.price, p.discountPercentage, p.rating, p.stock, p.brand, p.category, p.thumbnail,  GROUP_CONCAT(pi.image_url) AS images
                 FROM products p
                 LEFT JOIN product_images pi ON p.id = pi.product_id`;

    if (category) {
      const lowerCaseCate = category.toLowerCase();
      query += ` WHERE LOWER(p.category) = '${lowerCaseCate}'`;
    }

    query += ' GROUP BY p.id;';

    const [products] = await connection.query(query);

    products.forEach(product => {
      if (product.images) {
        product.images = product.images.split(',');
      } else {
        product.images = [];
      }
    });

    return products;
  }

  static async getById({ id }) {
    const [products] = await connection.query(
      `SELECT p.id, p.title, p.description, p.price, p.discountPercentage, p.rating, p.stock, p.brand, p.category, p.thumbnail,   GROUP_CONCAT(pi.image_url) AS images
         FROM products p
         LEFT JOIN product_images pi ON p.id = pi.product_id
         WHERE p.id = ?
         GROUP BY p.id;`,
      [id]
    );

    if (products.length === 0) return null;

    const product = products[0];
    if (product.images) {
      product.images = product.images.split(',');
    } else {
      product.images = [];
    }

    return product;
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

    try {

      const [productResult] = await connection.query(
        `INSERT INTO products (title, description, price, discountPercentage, rating, stock, brand, category, thumbnail)
              VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?);`,
        [title, description, price, discountPercentage, rating, stock, brand, category, thumbnail]
      );

      const productId = productResult.insertId;

      for (const imageUrl of images) {
        await connection.query(
          `INSERT INTO product_images (product_id, image_url) VALUES (?, ?);`,
          [productId, imageUrl]
        );
      }

      const [products] = await connection.query(
        `SELECT p.id, p.title, p.description, p.price, p.discountPercentage, p.rating, p.stock, p.brand, p.category, p.thumbnail,   GROUP_CONCAT(pi.image_url) AS images
           FROM products p
           LEFT JOIN product_images pi ON p.id = pi.product_id
           WHERE p.id = ?
           GROUP BY p.id;`,
        [productId]
      );

      if (products.length === 0) return null;

      const product = products[0];
      if (product.images) {
        product.images = product.images.split(',');
      } else {
        product.images = [];
      }

      return product;
    }
    catch (e) {
      throw new Error("Error creating product")
    }


  }

  static async delete({ id }) {

    try {
      const result = await connection.query(
        'DELETE FROM products WHERE id = ?;',
        [id]
      )


      if (result[0].affectedRows == 0) return false

      return true

    } catch (e) {
      throw new Error(e.message)
    }

  }

  static async update({ id, input }) {

    try {
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
      } = input;
  
      let query = "UPDATE products SET";
  
      if (title !== undefined && title !== null) {
        query += ` title = '${title}',`;
      }
      if (description !== undefined && description !== null) {
        query += ` description = '${description}',`;
      }
      if (price !== undefined && price !== null) {
        query += ` price = '${price}',`;
      }
      if (discountPercentage !== undefined && discountPercentage !== null) {
        query += ` discountPercentage = '${discountPercentage}',`;
      }
      if (rating !== undefined && rating !== null) {
        query += ` rating = '${rating}',`;
      }
      if (stock !== undefined && stock !== null) {
        query += ` stock = '${stock}',`;
      }
      if (brand !== undefined && brand !== null) {
        query += ` brand = '${brand}',`;
      }
      if (category !== undefined && category !== null) {
        query += ` category = '${category}',`;
      }
      if (thumbnail !== undefined && thumbnail !== null) {
        query += ` thumbnail = '${thumbnail}'`;
      }
  
      if (query.endsWith(',')) {
        query = query.slice(0, -1);
      }
  
      query += ` WHERE id = '${id}'`;
  
      await connection.query(query);

      if (images && images.length > 0) {
        await connection.query('DELETE FROM product_images WHERE product_id = ?', [id]);
  
        for (const imageUrl of images) {
          await connection.query(
            `INSERT INTO product_images (product_id, image_url) VALUES (?, ?);`,
            [id, imageUrl]
          );
        }
      }

      const updatedProduct = await this.getById({ id });
  
      if (!updatedProduct) {
        throw new Error('Product not found after updating.');
      }
  
      return updatedProduct;
    }catch(e){
      throw new Error("Error updating product")
    }
    
  }
  
}
