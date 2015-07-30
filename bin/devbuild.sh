set -xe

BUILD_TAG=anshu-test-tenant-1
#BUILD_TAG=external-at-2
#ghprbPullId=725
#export pull_request_id=$ghprbPullId
export KEY_NAME=combo
export env_file="/home/anshup/git/anshprat/myfiles/private_keys/anshu_rc"
export ssh_user=ubuntu
export dns_server=192.168.20.2
#export dns_server=10.0.0.2
export env_http_proxy=http://${dns_server}:3128/
export env_https_proxy=http://${dns_server}:3128/
export cloud_provider=anshu-gate


#export override_repo="http://jiocloud.rustedhalo.com:8080/job/pkg_test_build/69/artifact/new_repo.tgz"
#export layout=external

######################## END OF MODIFICATIONS ################################

export module_git_cache=http://jiocloud.rustedhalo.com:8080/job/puppet-jiocloud-cache/lastSuccessfulBuild/artifact/cache.tar.gz
export git_protocol=https

export BUILD_NUMBER=$BUILD_TAG
# use the acceptance test environment (I may have to patch this a little)
export module_git_cache=http://jiocloud.rustedhalo.com:8080/job/puppet-jiocloud-cache/lastSuccessfulBuild/artifact/cache.tar.gz
export env=at
export cloud_provider=jio
##
# We should use combo keys, in which case bodepd/sorenh/hkumar/jenkins will have ssh access as ubuntu user,
# so commenting KEYNAME variable, for now which makes it to use combo (Dated: 2015-03-19) - Harish
##

# ensure that the correct pull request number and repo are set
export puppet_modules_source_repo=https://github.com/jiocloud/puppet-rjil
./build_scripts/deploy.sh
./build_scripts/test.sh
