import z from 'zod'

const productSchema = z.object({
  title: z.string({
    invalid_type_error: 'Title must be a string',
    required_error: 'Title is required.'
  }),
  description: z.string({
    invalid_type_error: 'Description must be a string',
    required_error: 'Description is required.'
  }),
  price: z.number().positive(),
  discountPercentage: z.number().min(0).max(100).default(0),
  rating: z.number().min(0).max(10).default(5),
  stock: z.number().int().positive(),
  brand: z.string({
    invalid_type_error: 'Brand must be a string',
    required_error: 'Brand is required.'
  }),
  category: z.enum([
    "smartphones",
    "laptops",
    "fragrances",
    "skincare",
    "groceries",
    "home-decoration",
    "furniture",
    "tops",
    "womens-dresses",
    "womens-shoes",
    "mens-shirts",
    "mens-shoes",
    "mens-watches",
    "womens-watches",
    "womens-bags",
    "womens-jewellery",
    "sunglasses",
    "automotive",
    "motorcycle",
    "lighting"
  ]),
  thumbnail: z.string().url(),
  images: z.array(z.string().url().default([])),// Puede ser un array vacío
})

export function validateProduct(input) {
  return productSchema.safeParse(input)
}

export function validatePartialProduct(input) {
  return productSchema.partial().safeParse(input)
}
