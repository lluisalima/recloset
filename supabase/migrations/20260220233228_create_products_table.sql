/*
  # Create products table for Recloset By Luisa

  1. New Tables
    - `products`
      - `id` (uuid, primary key)
      - `name` (text, product name)
      - `description` (text, product description)
      - `price` (numeric, product price)
      - `size` (text, product size)
      - `badge` (text, product badge/label)
      - `color_bg` (text, card background color class)
      - `images` (jsonb, array of image objects with url and label)
      - `created_at` (timestamp)
  
  2. Security
    - Enable RLS on `products` table
    - Add policy for public read access (anyone can view products)
*/

CREATE TABLE IF NOT EXISTS products (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text NOT NULL,
  price numeric NOT NULL,
  size text NOT NULL,
  badge text NOT NULL,
  color_bg text NOT NULL,
  images jsonb NOT NULL DEFAULT '[]'::jsonb,
  created_at timestamptz DEFAULT now()
);

ALTER TABLE products ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view products"
  ON products FOR SELECT
  TO anon, authenticated
  USING (true);
