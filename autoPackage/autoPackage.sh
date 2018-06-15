
#DATE=`date +%Y%m%d_%H%M`

#cd ./source/basesource/sgcis

#svn update

cd ../

xcodebuild -workspace /Users/Z/Documents/Learning/OC/PositivePerson/PositivePersons/PositivePersons.xcworkspace -scheme PositivePersons -destination generic/platform=iOS archive -configuration Release ONLY_ACTIVE_ARCH=NO -archivePath /Users/Z/Documents/Learning/OC/PositivePerson/PositivePersons/autoPackage/xcarchive/PositivePersons

xcodebuild -exportArchive -archivePath /Users/Z/Documents/Learning/OC/PositivePerson/PositivePersons/autoPackage/xcarchive/PositivePersons.xcarchive -exportPath /Users/Z/Documents/Learning/OC/PositivePerson/PositivePersons/autoPackage/ipa -exportOptionsPlist /Users/Z/Documents/Learning/OC/PositivePerson/PositivePersons/autoPackage/exportOptionsPlist/exportOptionsPlist.plist

#xcodebuild -workspace ./basesource/sgcis/platforms/ios/sgcis.xcworkspace -scheme sgcis -destination generic/platform=iOS archive -configuration Release ONLY_ACTIVE_ARCH=NO -archivePath ./package/xcarchive/sgcis_$DATE

#xcodebuild -exportArchive -archivePath ./package/xcarchive/sgcis_$DATE.xcarchive -exportPath ./package/ipa/ipa_$DATE -exportOptionsPlist ./package/exportOptionsPlist/exportOptionsPlist.plist

#fir login -T 20da9c980e365eb85eca2cf464748a7a

#fir publish /Users/xxx/AutoPackage/ipa/ipa_$DATE/xxx.ipa
