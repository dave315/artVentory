class Artwork < ActiveRecord::Base
  belongs_to :category
  mount_uploader :photo, ArtworkPhotoUploader

end
