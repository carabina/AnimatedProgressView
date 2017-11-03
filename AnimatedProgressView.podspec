Pod::Spec.new do |s|
  s.name             = 'AnimatedProgressView'
  s.version          = '0.1.1'
  s.summary          = 'Beautiful and customizable animated linear progress view'
 
  s.description      = <<-DESC
This fantastic view changes its color gradually makes your app look fantastic!
                       DESC
 
  s.homepage         = 'https://github.com/DimaNakhratiants/AnimatedProgressView.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dima Nakhratiants' => 'dirmidante@gmail.com' }
  s.source           = { :git => 'https://github.com/DimaNakhratiants/AnimatedProgressView.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '11.1'
  s.source_files = 'AnimatedProgressView/AnimatedProgressView.swift'
 
end