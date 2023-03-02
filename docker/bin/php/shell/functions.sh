# Functions...
fixFilePermissions() {
    find . -type f -exec chmod 644 {} \;
}

fixDirectoryPermissions() {
    find . -type d -exec chmod 755 {} \;
}

fixAllPermissions() {
    find . -type f -exec chmod 644 {} \;
    find . -type d -exec chmod 755 {} \;
}

build()
{
    currentDirectory=$(pwd)

    if [ ! -d /var/www/html/vendor ]; then
        if [ "$currentDirectory" != "/var/www/html" ]; then
            cd /var/www/html || return
        fi

        composer install
    fi

    if [ ! -d /var/www/html/node_modules ]; then
        npm install
    fi

    npm run dev

    if [ "$(pwd)" != "$currentDirectory" ]; then
        cd "$currentDirectory" || return
    fi
}
