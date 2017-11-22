# frozen_string_literal: true

module ApplicationHelper
  #画像をセットするHelper　引数にimage,サイズ指定用クラス,タイトルを渡す。 image以外は省略化
 def set_image(image,size = "size_def",name = "notitle")
   if image.blank?
     img_url = 'no_image.png'
   else
     img_url = image
   end
   image_tag(img_url, alt: name,class:size)
 end
end
