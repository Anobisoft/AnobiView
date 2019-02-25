
Pod::Spec.new do |s|

  s.name             = 'AnobiView'
  s.version          = '0.0.2'
  s.summary          = 'AnobiView - UIView childs collection'

  s.description      = <<-DESC
AnobiView - UIView childs collection.

## Main features
ASGridView
ASGradientView
ASGrainbomatedView
DESC

  s.homepage     = "https://github.com/Anobisoft/AnobiView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Stanislav Pletnev" => "anobisoft@gmail.com" }
  s.social_media_url   = "https://twitter.com/Anobisoft"

  s.platform     = :ios, "9.3"

  s.source        = { :git => "https://github.com/Anobisoft/AnobiView.git", :tag => s.version.to_s }
  s.source_files  = "AnobiView/*.{h,m}"
  s.framework     = "UIKit"
  
  s.requires_arc = true

end
