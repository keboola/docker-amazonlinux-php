FROM amazonlinux:2017.03.1.20170812

ARG php_version="7.3.1"

RUN sed -i 's;^releasever.*;releasever=2017.03;;' /etc/yum.conf && \
    yum clean all && \
    yum install -y autoconf \
                bison \
                gcc \
                gcc-c++ \
                make \
                libcurl-devel \
                libxml2-devel \
                openssl-devel \
                bzip2-devel \
                tar \
                gzip \
                zip \
                unzip \
                git

RUN curl -sL https://github.com/php/php-src/archive/php-${php_version}.tar.gz | tar -xz && \
    cd php-src-php-${php_version} && \
    ./buildconf --force && \
    ./configure --silent --with-openssl --with-curl --with-zlib --without-pear --enable-bcmath --with-bz2 --enable-mbstring && \
    make install
