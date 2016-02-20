class ProjectPictureUploader < BaseUploader
  version :admin_thumb do
    process resize_and_pad: [140, 100]
  end

  version :thumb do
    process resize_and_pad: [450, 450]
  end
end
