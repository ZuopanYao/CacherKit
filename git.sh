if [ -z "$1" ]; then
echo '请添加描述'
exit 0
fi

git add *
git commit -m "$1"
git pull
git push