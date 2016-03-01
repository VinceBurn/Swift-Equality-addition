#
# Be sure to run `pod lib lint ContainerEquality.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ContainerEquality"
  s.version          = "2.1.0"
  s.summary          = "Swift pod to add some missing ContainerEquality functionality."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
Swift pod with the goal to provide extended equality method to Container class, for thing that we know could be compare for equality.
                       DESC

  s.homepage         = "https://github.com/VinceBurn/Swift-Equality-addition"
  s.license          = 'MIT'
  s.author           = { "Vincent Bernier" => "vincentbernier@hotmail.com" }
  s.source           = { :git => "https://github.com/VinceBurn/Swift-Equality-addition.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platforms = { :ios => "8.0", :osx => "10.9" }
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
