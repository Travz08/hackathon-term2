require 'cloudinary'
require 'shrine/storage/cloudinary'

Cloudinary.config(
  cloud_name: 'dt8rlngsi',
  api_key:    '947235153734762',
  api_secret: 'MMLknqxwqWuSxNCUx1gwKvQgOzc'
)

Shrine.storages = {
  cache: Shrine::Storage::Cloudinary.new(resource_type: 'image'), # for direct uploads
  store: Shrine::Storage::Cloudinary.new(resource_type: 'image')
}
