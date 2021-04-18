#
# pod.sh
#
# Created by ZuopanYao on 2021/03/31.

if [ -z "$1" ]; then
 echo "缺少版本号参数"
 exit 0
fi

MODULE='CacheKit'
SPECS='Specs'

cp podspec.example $MODULE.podspec
REPLACE=`sed "s/{v}/$1/g" $MODULE.podspec`
echo "$REPLACE" > $MODULE.podspec

# 打 tag
git add $MODULE.podspec
git commit -m "modify $MODULE.podspec for $1"
git tag -a $1 -m "$1"

# 把 tag 提交到远程仓库
git push origin : $1

# cocoapods 索引更新
cd ../$SPECS
git pull

mkdir -p $MODULE/$1
cp ../$MODULE/$MODULE.podspec $MODULE/$1/$MODULE.podspec
git add *
git commit -m "$MODULE-$1"
git push

echo 'Done'

# cocoapods specs
pod trunk push "../$MODULE/$MODULE.podspec" --allow-warnings

