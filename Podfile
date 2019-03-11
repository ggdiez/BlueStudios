
platform :ios, '11.0'
use_frameworks!

target 'BlueStudios' do
    pod 'NVActivityIndicatorView', '4.4.0'
    pod 'Alamofire', '4.7'
    pod 'GSMessages', '1.6.1'
	pod 'Intercom', '5.1.9'
    target 'BlueStudiosTests' do
        inherit! :search_paths
        pod 'Hippolyte', '0.5.0', :configurations => ['Debug']
        pod 'Nimble', '7.0.1', :configurations => ['Debug']
        pod 'KIF', '3.7.0', :configurations => ['Debug']
    end
end

swift4Targets = ['MaterialComponents', 'NVActivityIndicatorView', 'GSMessages', 'Hippolyte']
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            if swift4Targets.include? target.name
                config.build_settings['SWIFT_VERSION'] = '4.2'
                else
                config.build_settings['SWIFT_VERSION'] = '3.0'
            end
        end
    end
    installer.pods_project.build_configurations.each do |config|
        config.build_settings['PROVISIONING_PROFILE_SPECIFIER'] = ''
    end
end

