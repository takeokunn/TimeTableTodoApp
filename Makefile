PODS_ROOT=./Pods

# installation
install: bundle_install pod_install carthage_update

update: pod_update carthage_update

bundle_install:
	bundle install --path=vendor/bundle --jobs 4 --retry 3

pod_install:
	bundle exec pod install

pod_update:
	bundle exec pod update

carthage_update:
	carthage update --platform iOS

fix_lint:
	swiftlint autocorrect --format
