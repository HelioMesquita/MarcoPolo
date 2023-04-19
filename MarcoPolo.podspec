Pod::Spec.new do |s|
  s.name             = 'MarcoPolo'
  s.version          = '0.1.0'
  s.summary          = 'A short description of MarcoPolo.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/HelioMesquita/MarcoPolo'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'HelioMesquita' => 'helio.mesquitaios@gmail.com' }
  s.source           = { :git => 'https://github.com/HelioMesquita/MarcoPolo.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'Source/**/*.swift'
  
  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'Tests/**/*'
  end
  
end
