platform :ios, '9.0'
swift_version = '4.1'
use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

def install_pods
  # lint
  pod 'SwiftLint'

  # auth
  pod 'Firebase'
  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  pod 'GoogleSignIn'
end

target 'TimeTableTodoApp' do
  install_pods
end
