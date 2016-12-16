
Pod::Spec.new do |s|
  s.name             = 'NotifyMe'
  s.version          = '0.1.2'
  s.summary          = 'A subclass of UIButton that notify a user via email.'


  s.description      = 'This CocoaPod provides a button iof its class the ability to notify a user via email he or she entered.'


  s.homepage         = 'https://github.com/TonyMJoseph1/NotifyMe'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Tony M Joseph' => 'tonyj@qburst.com' }
  s.source           = { :git => 'https://github.com/TonyMJoseph1/NotifyMe.git', :tag => '0.1.2' }

  s.ios.deployment_target = '8.0'

  s.source_files = 'NotifyMe/Classes/**/*'
  
end
